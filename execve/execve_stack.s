.intel_syntax noprefix 
.globl _start 

_start:
    mov rbx, 0x68732f6e69622f
    push rbx 
    mov rdi, rsp 
    mov rsi, 0 
    mov rdx, 0 
    mov rax, 59 
    syscall
