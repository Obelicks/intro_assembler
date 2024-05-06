global _start

section .data 
    message db "Fibonacci Sequence:", 0x0a

section .text
_start:

printMessage:
    mov rax, 1          ; syscall nr. 1 write
    mov rdi, 1          ; choosing stdout
    mov rsi, message    ; parsing the message pointer to rsi
    mov rdx, 20         ; print length of 20 bytes
    syscall

initFib:
    xor rax, rax        ; reset rax to 0x00
    xor rbx, rbx        ; reset rbx to 0x01
    inc rbx             ; rbx: 1

loopFib:
    add rax, rbx        ; rax = rax+rbx
    xchg rax, rbx       ; swap the values of rax and rbx
    cmp rbx, 10         ; do rbx - 10
    js loopFib          ; jump if result is <0

Exit:
    mov rax, 60         ; syscall nr. 60 Exit
    mov rdi, 0          ; exit code 0
    syscall