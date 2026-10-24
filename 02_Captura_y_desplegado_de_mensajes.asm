; Materia: Lenguajes de Interfaz
; Alumno: Velasco Gonzalez Diego
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 2. Captura y despliegue de mensajes
; Descripción: Captura dos cadenas con ReadString y las muestra con WriteString.

INCLUDE Irvine32.inc

.data
pedirNombre  BYTE "Escribe tu nombre: ", 0
pedirCarrera BYTE "Escribe tu carrera: ", 0
mostrarNombre   BYTE "Nombre: ", 0
mostrarCarrera  BYTE "Carrera: ", 0

nombre  BYTE 30 DUP(0)
carrera BYTE 40 DUP(0)

.code
main PROC
    ; Captura el nombre
    mov edx, OFFSET pedirNombre
    call WriteString
    mov edx, OFFSET nombre
    mov ecx, SIZEOF nombre - 1
    call ReadString

    ; Captura la carrera
    mov edx, OFFSET pedirCarrera
    call WriteString
    mov edx, OFFSET carrera
    mov ecx, SIZEOF carrera - 1
    call ReadString

    
    mov edx, OFFSET mostrarNombre
    call WriteString
    mov edx, OFFSET nombre
    call WriteString
    call Crlf

    mov edx, OFFSET mostrarCarrera
    call WriteString
    mov edx, OFFSET carrera
    call WriteString
    call Crlf
    exit
main ENDP
END main