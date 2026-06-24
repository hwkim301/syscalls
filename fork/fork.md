## fork + execve to create a child process 

Creating processes in Linux is achieved by a fork + execve syscall for the majority.

In my opinion, it seems a bit redundant to call `fork` which creates a child process then uses exec to swap the program to the one you want to call. 

[Here](https://unix.stackexchange.com/questions/136637/why-do-we-need-to-fork-to-create-new-processes) is an explanation.

Now we have some background on why `fork` is used to create processes. 

Here's the synopsis for `fork` in the man page.

```c
#include <unistd.h>

pid_t fork(void);
```

`fork` doesn't take any arguments and returns a `pid_t` type. 

According to the [glibc manual](https://ftp.gnu.org/old-gnu/Manuals/glibc-2.2.3/html_node/libc_554.html) the `pid_t` type represents process IDs. 

The value of `pid_t` is defined in `<sys/types.h>`.

The maximum value of `pid_t` used to be 32768, but on Ubuntu 24.04.4 it's now 4194304.

Run the command below to find the maximum value of `pid` and check [here](https://stackoverflow.com/questions/6294133/maximum-pid-in-linux) for more information.

```bash
$ cat /proc/sys/kernel/pid_max 
4194304
```

Until now we've expected the definition of `fork`, let's try digging to the internals.

Unlike other functions, fork is called once but returned twice. 

It kind of doesn't make sense. It's because when it gets called it returns the original fork and the child that was created also returns. 

The return value of the child is 0, whereas the return value of the parent if the process ID of the child. 

The parent will return the process ID of the child because the parent can have multiple children. 

On the other hand, the child will have only one parent. 

If `fork` fails, -1 is returned to the parent.

Since the child is a copy of the parent, it gets a copy of the parent's data space, heap and stack. 

However, the parent and child do not share memory. 

The parent shares, the text segment with the child. 

My guess is that the parent shares the text segment because `.text` is usually read-only when executing so when it creates a child process which is a copy it points to the same `.text` as the parent. 

Linux doesn't actually completely copy the parent's data, stack and heap and uses [Copy-on-write](https://en.wikipedia.org/wiki/Copy-on-write).

### wait and waitpid 

There are cases when you want to receive information about a child process when the child process terminates. 

When the child terminates before the parent, this state is known as a zombie. 

A zombie process waits for its parent to read its exit status. 
Once the parent acknowledges this information a process called reaping, he zombie process is fully removed.

`wait` and `waitpid` are used to obtain information about the child. 

The definitions for the syscalls can be found in `<sys/wait.h>`.

```c
#include <sys/wait.h>

pid_t wait(int *_Nullable wstatus);
pid_t waitpid(pid_t pid, int *_Nullable wstatus, int options);
```

You can think of `waitpid` as a fine grained version of `wait`.

I'll focus on `waitpid`. 

The first parameter `waitpid` specifies which process to wait for. 

The second parameter, `wstatus` to write the terminated
child’s exit status code.

If you pass NULL, as the second parameter the parent will simply wait for the child to terminate and will not be interested in retrieving the exit status code. 

The third parameter, `options` lets us specify options to change waitpid()’s
behavior.

The default value which is 0 will return the PID of the child is the child has already terminated and is waiting to be reaped. 

Understanding the `wstatus` and `options` value were a bit hard for me. 

I referenced a lot from [here](https://cs3157.github.io/www/2023-9/lecture-notes/15-fork.pdf) for `wstatus` and `options`. 

The man pages for `wait` and `waitpid` were quite cryptic so I recommend reading the cs3157 material. 