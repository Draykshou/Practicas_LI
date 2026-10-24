; Materia: Lenguajes de Interfaz
; Alumno: Velasco Gonzalez Diego
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 0.Hola mundo con irvine32
; Descripción: Programa sencillo de Hola mundo usando la libreria de irvine32
 
INCLUDE Irvine32.inc
 
.data
mensaje BYTE "Hola mundo!", 0
 
.code
main PROC
    mov edx, OFFSET mensaje
    call WriteString
    call Crlf
    exit
main ENDP
END main
 
