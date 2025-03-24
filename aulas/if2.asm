segment .data
    LF    equ 0xA
    NULL  equ 0xD

section .data
    ; Variáveis
    valor1 dd 30       ; inteiro 32-bit
    valor2 dd 20       ; inteiro 32-bit
    msg_maior db 'valor1 é maior que valor2', LF, NULL
    msg_menor_igual db 'valor1 não é maior que valor2', LF, NULL

section .text
    global _start

_start:
    ; Carrega os valores nos registradores
    mov eax, [valor1]
    mov ebx, [valor2]
    
    ; Compara os dois valores
    cmp eax, ebx
    
    ; Condição if (valor1 > valor2)
    jle else_block      ; Pula se valor1 <= valor2
    
    ; Corpo do if (executado se valor1 > valor2)
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, msg_maior
    mov edx, 25         ; tamanho da mensagem
    int 0x80
    jmp end_if          ; Pula o bloco else
    
else_block:
    ; Corpo do else
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, msg_menor_igual
    mov edx, 30         ; tamanho da mensagem
    int 0x80
    
end_if:
    ; Finaliza o programa
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; código de retorno 0
    int 0x80
