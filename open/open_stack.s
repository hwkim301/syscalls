.intel_syntax noprefix 
.globl _start 

_start:
    mov rax, 0x67                # '/g'
    push rax
    mov rax, 0x616c662f6e65706f  # 'open/fla'
    push rax
    mov rax, 0x2f736c6c61637379  # 'yscalls/'
    push rax
    mov rax, 0x732f3130336d696b  # 'kim301/s'
    push rax
    mov rax, 0x77682f656d6f682f  # '/home/hw'
    push rax
    
    mov rdi, rsp 
    mov rsi, 66 
    mov rdx, 0644 
    mov rax, 2
    syscall      # open("/home/hwkim301/syscalls/open/flag", O_CREAT| O_RDWR, 0644);

    xor rdi, rdi # exit(0); 
    mov rax, 60 
    syscall 
