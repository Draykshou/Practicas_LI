; Materia: Lenguajes de Interfaz
; Alumno: Velasco Gonzalez Diego
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 8. Operaciones aritméticas
; Descripción: Repaso a las operaciones aritmeticas en ensamblador


INCLUDE Irvine32.inc
 
.code
main PROC
    mov eax, 50
    add eax, 20
    call WriteInt
    call Crlf
 
    sub eax, 15
    call WriteInt
    call Crlf
 
    inc eax
    call WriteInt
    call Crlf
 
    dec eax
    call WriteInt
    call Crlf
 
    mov eax, 25
    mov ebx, 3
    mul ebx
    mov ecx, edx
    call WriteInt
    call Crlf
    mov eax, ecx
    call WriteInt
    call Crlf
 

    mov eax, 125
    mov edx, 0
    mov ebx, 12
    div ebx
    mov ecx, edx
    call WriteInt
    call Crlf
    mov eax, ecx
    call WriteInt
    call Crlf
    exit
main ENDP
END main
