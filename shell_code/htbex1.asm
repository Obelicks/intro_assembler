global  _start

section .data
    message: db "Hello HTB Academy!", 0x0a
    len equ $ - message

section .text
_start:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, message
    mov     rdx, len
    syscall
    
    mov     rax, 60
    mov     rdi, 0
    syscall