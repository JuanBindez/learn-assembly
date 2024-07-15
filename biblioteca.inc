segment .data
    LF          equ 0xA   ; Line Feed
    NULL        equ 0xD   ; null value
    SYS_CALL    equ 0x80  ; system call OS
    ; EAX
    SYS_EXIT    equ 0x1   ; calling code to end the program
    SYS_READ    equ 0x3   ; read operatin
    SYS_WRITE   equ 0x4   ; write operation
    ; EBX
    RET_EXIT    equ 0x0   ; operation carried out successfully
    STD_IN      equ 0x0   ; standard input
    STD_OUT     equ 0x1   ; standard out

    TAM_BUFFER  equ 0xA

segment .bss
    BUFFER resb 0x1

section .text

saidaResultado:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, BUFFER
    mov EDX, TAM_BUFFER
    int SYS_CALL
    ret