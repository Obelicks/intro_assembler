global _start 
_start:
    mov eax, 1      ; eax = 1
    mov ebx, 42     ; ebx = 42
    sub ebx, 29
    int 0x80