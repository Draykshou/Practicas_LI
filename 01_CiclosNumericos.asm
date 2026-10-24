; Materia: Lenguajes de Interfaz
; Alumno: Velasco Gonzalez Diego
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 1.Ciclos numéricos
; Descripción: Repite un bloque de instrucciones con LOOP

INCLUDE Irvine32.inc

.data
titulo1   BYTE "Ciclo con ECX = 5", 0
titulo2   BYTE "Ciclo con ECX = 3", 0
msgRepeticion BYTE "Repeticion del ciclo", 0
msgFin    BYTE "Fin del programa", 0

.code
main PROC
    ; Primer ciclo: ECX = 5
    mov edx, OFFSET titulo1
    call WriteString
    call Crlf

    mov ecx, 5
ciclo1:
    mov edx, OFFSET msgRepeticion
    call WriteString
    call Crlf
    loop ciclo1

    ; Segundo ciclo: solo cambia el valor inicial de ECX
    mov edx, OFFSET titulo2
    call WriteString
    call Crlf

    mov ecx, 3
ciclo2:
    mov edx, OFFSET msgRepeticion
    call WriteString
    call Crlf
    loop ciclo2

    mov edx, OFFSET msgFin
    call WriteString
    call Crlf
    exit
main ENDP
END main