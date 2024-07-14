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
    msg db "Entry with your name", LF, NULL
    tam equ $- msg

section .bss
    nome resb 1

section .text

global _start

_start:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, msg
    mov EDX, tam 
    int SYS_CALL

    mov EAX, SYS_READ
    mov EBX, STD_IN
    mov ECX, nome
    mov EDX, 0xA
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL
