global  _start
extern  printf,scanf    ; importing printf and scanf from libc

section .data
    message db "Please input max Fn: ", 0x0a
    outFormat db  "%d", 0x0a, 0x00
    inFormat db "%d", 0x00

section .bss
    userInput resb 1    ; 1 byte Buffer Space

section .text
_start:
    call printMessage   ; print intro message
    call getInput       ; get max number
    call initFib        ; set initial Fib values
    call loopFib        ; calculate Fib numbers
    call Exit           ; Exit the program

printMessage:
    mov rax, 1          ; rax: syscall number 1
    mov rdi, 1          ; rdi: fd 1 for stdout
    mov rsi, message    ; rsi: pointer to message
    mov rdx, 20         ; rdx: print length of 20 bytes
    syscall             ; call write syscall to the intro message
    ret

getInput:
    sub rsp, 8          ; stack alignment
    mov rdi, inFormat   ; set 1st parameter
    mov rsi, userInput  ; set 2nd parameter
    call scanf          ; function call
    add rsp, 8          ; undo stack alignment

initFib:
    xor rax, rax        ; initialize rax to 0
    xor rbx, rbx        ; initialize rbx to 0
    inc rbx             ; increment rbx to 1
    ret

printFib:
    push rax            ; push registers to stack
    push rbx
    mov rdi, outFormat  ; set 1st argument (Print Format)
    mov rsi, rbx        ; set 2nd argument (Fib Number)
    call printf         ; printf(outFormat, rbx)
    pop rbx             ; restore registers from stack
    pop rax
    ret

loopFib:
    call printFib           ; print current Fib number
    add rax, rbx            ; get the next number
    xchg rax, rbx           ; swap values
    cmp rbx, [userInput]	; do rbx - userInput
    js loopFib		        ; jump if result is <0
    ret

Exit:
    mov rax, 60
    mov rdi, 0
    syscall