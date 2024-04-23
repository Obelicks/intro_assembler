global _start

section .text
_start:
    mov ecx, 99         ; 99 in ecx
    mov ebx, 42         ; exit status is 42
    mov eax, 1          ; sys_exit system call
    cmp ecx, 100        ; compare ecx to 100, sets a background flag 
    jl skip             ; jump if less than in previous command to skip label. jmp is unconditional
    mov ebx, 13         ; exit status would be 13
skip:
    int 0x80            