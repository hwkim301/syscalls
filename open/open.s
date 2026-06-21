.intel_syntax noprefix
.globl _start

.section .data
    flag: .asciz "/home/hwkim301/syscalls/open/flag"

.section .text
_start:
    lea rdi, [rip + flag]
    mov rsi, 66             
    mov rdx, 0644
    mov rax, 2        
    syscall      # open("/home/hwkim301/syscalls/open/flag", O_CREAT | O_RDWR, 0644);

    xor rdi, rdi # exit(0)
    mov rax, 60 
    syscall
