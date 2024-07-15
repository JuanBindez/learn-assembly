segment .data
    LF        equ 0xA   ; Line Feed
    NULL      equ 0xD   ; null value
    SYS_CALL  equ 0x80  ; system call OS
    ; EAX
    SYS_EXIT  equ 0x1   ; calling code to end the program
    SYS_READ  equ 0x3   ; read operatin
    SYS_WRITE equ 0x4   ; write operation
    ; EBX
    RET_EXIT  equ 0x0   ; operation carried out successfully
    STD_IN    equ 0x0   ; standard input
    STD_OUT   equ 0x1   ; standard out


section .data
    ; dd dw db dq dt
    x dd 50
    y dd 10
    msg1 db "x é maior que y", LF, NULL
    tam1 equ $- msg1
    msg2 db "y é maior que x", LF, NULL
    tam2 equ $- msg2

section .text

global _start

_start:
    ; je =, jg >, jge >=, jl <, jle <=, jne !=.
    ; jmp go to -> unconditional jump
    mov EAX, DWORD[x]
    mov EBX, DWORD[y]
    ; if comparison
    cmp EAX, EBX
    jge maior ; EAX >= EBX
    mov ECX, msg2
    mov EDX, tam2
    jmp final

maior:
    mov ECX, msg1
    mov EDX, tam1
    
final:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL