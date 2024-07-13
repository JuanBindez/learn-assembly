section .data
    msg db 'hello world!', 0xA
    tam equ $- msg                 ;size of the message I want to appear

section .text

global _start

_start:
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, msg
    mov EDX, tam                    ;size of the message I want to appear
    int 0x80

    ;return 0
    mov EAX, 0x1
    mov EBX, 0x0
    int 0x80