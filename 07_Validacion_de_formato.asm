; Materia: Lenguajes de Interfaz
; Alumno: Velasco Gonzalez Diego
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 7. Validación de formato
; Descripción: Captura un código con ReadString y valida el formatoAAA-999

INCLUDE Irvine32.inc

.data
msgPedir    BYTE "Escribe un codigo con formato TEC-123:", 0
msgValido   BYTE "Formato valido", 0
msgInvalido BYTE "Formato invalido. Intenta de nuevo.", 0

codigo BYTE 20 DUP(?)

.code
main PROC
pedir:
    mov edx, OFFSET msgPedir
    call WriteString
    mov edx, OFFSET codigo
    mov ecx, SIZEOF codigo - 1
    call ReadString

    ; mirar longtud
    cmp eax, 7
    jne invalido

    ; 0 a 2 letras
    mov esi, 0
letras:
    mov al, codigo[esi]
    cmp al, 'A'
    jb invalido
    cmp al, 'Z'
    ja invalido
    inc esi
    cmp esi, 3
    jb letras

    ; ver guion
    mov al, codigo[esi]
    cmp al, '-'
    jne invalido
    inc esi

    ; numeros 4 a 6
digitos:
    mov al, codigo[esi]
    cmp al, '0'
    jb invalido
    cmp al, '9'
    ja invalido
    inc esi
    cmp esi, 7
    jb digitos

    mov edx, OFFSET msgValido
    call WriteString
    call Crlf
    exit

invalido:
    mov edx, OFFSET msgInvalido
    call WriteString
    call Crlf
    jmp pedir
main ENDP
END main