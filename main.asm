segment .data
    LINE       equ 0xA
    NULL       equ 0xD
    
    ;System Calls
    SYS_WRITE  equ 0x4
    SYS_READ   equ 0x3
    SYS_EXIT   equ 0x1

    SYS_STDIN  equ 0x0
    SYS_STDOUT equ 0x1
    SYS_CALL   equ 0x80

    RETURN_0   equ 0x0

section .data
    msg       db "Olá digite Algo para o Assembly :", LINE, NULL
    len       equ $ - msg

    msg_2     db "A menssagem digitada Foi? "
    len_msg_2 equ $ - msg_2

section .bss
    frase_input resb 100

section .text
    global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, SYS_STDOUT
    mov ecx, msg
    mov edx, len
    int SYS_CALL

    mov eax, SYS_READ
    mov ebx, SYS_STDIN
    mov ecx, frase_input
    mov edx, 100
    int SYS_CALL

    mov eax, SYS_WRITE
    mov ebx, SYS_STDOUT
    mov ecx, msg_2
    mov edx, len_msg_2
    int SYS_CALL

    mov eax, SYS_WRITE
    mov ebx, SYS_STDOUT
    mov ecx, frase_input
    mov edx, 100
    int SYS_CALL

    mov eax, SYS_EXIT
    mov ebx, RETURN_0
    int SYS_CALL
