global _start

section .text
_start:
    mov al,  0      ;   al = 0
    mov bl,  1      ;   bl = 1
    inc bl          ;   bl++
    add rax , rbx