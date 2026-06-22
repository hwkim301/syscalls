.intel_syntax noprefix 
.globl _start 

_start:
    lea rdi, [rip+bin_sh]
    mov rsi, 0 
    mov rdx, 0 
    mov rax, 59 
    syscall     
bin_sh: 
.string "/bin/sh"
