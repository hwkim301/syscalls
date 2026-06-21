from pwn import *

path = '/home/hwkim301/syscalls/open/flag'
path = path.ljust((len(path) + 7) // 8 * 8, '\x00')
print(path)

chunks = [path[i:i+8].encode() for i in range(0, len(path), 8)]

for chunk in reversed(chunks):
    print(f'mov rax, {hex(u64(chunk))}')
    print('push rax')

