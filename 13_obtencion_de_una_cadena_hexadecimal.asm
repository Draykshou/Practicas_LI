; Materia: Lenguajes de Interfaz
; Alumno: Velasco Gonzalez Diego
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 13 - Obtención de una cadena hexadecimal
; Descripción: tomar un valor hexadecimal y convertirlo a una cadena de texto para imprimirlo

INCLUDE Irvine32.inc

.data
valor     DWORD 12AB34CDh
bufferHex BYTE 9 DUP(?)
msg       BYTE "12AB34CDh en texto: ", 0

.code
main PROC
    mov edx, OFFSET msg
    call WriteString
    mov eax, valor
    mov esi, OFFSET bufferHex
    call convertirHex
    mov edx, OFFSET bufferHex
    call WriteString
    call Crlf
    exit
main ENDP

convertirHex PROC
    mov BYTE PTR [esi + 8], 0

    mov ebx, 7
    mov ecx, 8
siguienteDigito:
    mov edx, eax
    and edx, 0Fh

    ; 0-9 -> '0'-'9'; 10-15 -> 'A'-'F'
    cmp dl, 9
    ja esLetra
    add dl, '0'
    jmp guardar
esLetra:
    sub dl, 10
    add dl, 'A'
guardar:
    mov [esi + ebx], dl
    dec ebx

    ; Pasar al siguiente nibble
    shr eax, 4
    loop siguienteDigito
    ret
convertirHex ENDP
END main