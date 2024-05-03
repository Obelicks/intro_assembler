global  _start

section .text
_start:
    xor rax, rax        ; xor with itself to clear all data to 0x00
    xor rbx, rbx        ; ------||------
    inc rbx             ; incrementing register rbx (64-bit)
    mov rcx, 10         ; moving 10 into rcx (the loop register)
loopFib:
    add rax, rbx        ; add rax and rbx storing the result in rax
    xchg rax, rbx       ; swap values in the provided registers
    loop loopFib        ; while rcx != 0 jmp to loopFib