; Materia: Lenguajes de Interfaz
; Alumno: Velasco Gonzalez Diego
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 3. Comparación y prueba
; Práctica: 4. Saltos
; Descripción: programa de ejemplo para ver algunos de los saltos

INCLUDE Irvine32.inc

.data
msg1      BYTE "Salto jmp", 0
msgIguales   BYTE "Salto je", 0
msgMayor     BYTE "Salto jg", 0
msgMenor	 BYTE "Salto jl", 0

.code
main PROC
    jmp continuar ; primer salto

; condicionales
sonIguales:
    mov edx, OFFSET msgIguales
    jmp fin

esMayor:
    mov edx, OFFSET msgMayor
    jmp fin

esMenor:
    mov edx, OFFSET msgMenor
    jmp fin

; primer salto
continuar:
    mov edx, OFFSET msg1
    call WriteString
    call Crlf

    mov eax, 4
    mov ebx, 10
    cmp eax, ebx
    je sonIguales
    jg esMayor
    jl esMenor

fin:
    call WriteString
    call Crlf
    exit
main ENDP
END main