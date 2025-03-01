section .data
    prompt db "Digite um caractere: ", 10  ; Mensagem para o usuário
    prompt_len equ $ - prompt            ; Tamanho da mensagem

section .bss
    input resb 10                         ; Reserva 1 byte para armazenar o caractere lido

section .text
    global _start

; Definições de constantes para syscalls e file descriptors
SYS_WRITE equ 4     ; Número da syscall "write"
SYS_READ  equ 3     ; Número da syscall "read"
SYS_EXIT  equ 1     ; Número da syscall "exit"
STDOUT    equ 1     ; File descriptor para stdout
STDIN     equ 0     ; File descriptor para stdin

_start:
    ; Exibe a mensagem "Digite um caractere: "
    mov eax, SYS_WRITE  ; Syscall para write
    mov ebx, STDOUT     ; File descriptor 1 (stdout)
    mov ecx, prompt     ; Endereço da mensagem
    mov edx, prompt_len ; Tamanho da mensagem
    int 0x80            ; Chama a syscall

    ; Lê um caractere do teclado
    mov eax, SYS_READ   ; Syscall para read
    mov ebx, STDIN      ; File descriptor 0 (stdin)
    mov ecx, input      ; Buffer para armazenar o caractere lido
    mov edx, 10          ; Número de bytes para ler (1 caractere)
    int 0x80            ; Chama a syscall

    ; Exibe o caractere lido
    mov eax, SYS_WRITE  ; Syscall para write
    mov ebx, STDOUT     ; File descriptor 1 (stdout)
    mov ecx, input      ; Endereço do caractere lido
    mov edx, 10          ; Número de bytes para escrever (1 caractere)
    int 0x80            ; Chama a syscall

    ; Termina o programa
    mov eax, SYS_EXIT   ; Syscall para exit
    xor ebx, ebx        ; Código de saída 0
    int 0x80            ; Chama a syscall
