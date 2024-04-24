global _start

section .text
_start:
    mov ebx, 1      ; start ebx at 1
    mov ecx, 6      ; number of iteration
loop_start:
    add ebx, ebx    ; double ebx
    dec ecx         ; ecx -= 1
    cmp ecx, 0      ; compare ecx to 0
    jg loop_start        ; jump to label if ecx > 0
    mov eax, 1
    int 0x80
