## Write 

`write` is used to write bytes to a file descriptor. 

```c
#include <unistd.h>
ssize_t write(int fd, const void buf[.count], size_t count);
```

The first parameter is a file descriptor, the second parameter is a buffer and the third parameter is the size of the buffer. 

Here's an example. 

```c
#include <unistd.h> 
#include <fcntl.h>
#include <string.h> 
#include <stdio.h>

int main(){
    int fd = creat("flag",0644);
    if(fd < 0){
        perror("Failed to create flag");
    }

    const char *buf="My name is hwkim301\n";
    ssize_t written=write(fd,buf,strlen(buf));

    if(written < 0){
        perror("Failed writing my name\n");
    }
}
```

This code will create `flag` in the current working directory. 

Then it will write write the contents of `buf`. 

Compile it and execute the binary. 

```bash
$ gcc write.c -o write
$ ./write
```

`/flag` has been created by `creat`. 

You can see for yourself that the contents of the buffer have been written to the file. 

```bash
$ cat flag
My name is hwkim301
```

Although writing a constant buffer like this isn't that hard, writing and reading multiple times isn't that easy. 

You'll have to use the `lseek` syscall to move offsets around, but I'll add examples taking input and `lseek` later. 

That'll be it for now. 