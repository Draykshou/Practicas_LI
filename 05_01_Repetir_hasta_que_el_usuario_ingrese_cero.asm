; Materia: Lenguajes de Interfaz
; Alumno: Velasco Gonzalez Diego
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 5.1. Repetir hasta que el usuario ingrese cero
; Descripción: El programa se repetira en bucle hasta que el usuario ingrese un cero.

INCLUDE Irvine32.inc

.data
msgPedir BYTE "Escriba cero para terminar: ", 0
msgAux   BYTE "Escribio otro numero", 0
msgFin   BYTE "Capturaste cero, fin del programa", 0

.code
main PROC
ciclo:
    mov edx, OFFSET msgPedir
    call WriteString
    call ReadInt

    ; Condición de salida
    cmp eax, 0
    jz fin

    mov edx, OFFSET msgAux
    call WriteString
    call Crlf
    jmp ciclo

fin:
    mov edx, OFFSET msgFin
    call WriteString
    call Crlf
    exit
main ENDP
END main