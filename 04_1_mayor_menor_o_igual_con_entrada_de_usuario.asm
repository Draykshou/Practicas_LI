; Materia: Lenguajes de Interfaz
; Alumno: Velasco Gonzalez Diego
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 4.1. mayor, menor o igual con entrada del usuario
; Descripción: el usuario da 2 numeros y se imprime si el primero es mayor, menor o igual al segundo
INCLUDE Irvine32.inc

.data
pedirN1   BYTE "Escribe el primer numero: ", 0
pedirN2   BYTE "Escribe el segundo numero: ", 0
msgMayor BYTE "El primer numero es MAYOR que el segundo", 0
msgMenor BYTE "El primer numero es MENOR que el segundo", 0
msgIgual BYTE "Los dos numeros son IGUALES", 0

numero1 DWORD ?
numero2 DWORD ?

.code
main PROC
    ; Captura de los dos números
    mov edx, OFFSET pedirN1
    call WriteString
    call ReadInt
    mov numero1, eax

    mov edx, OFFSET pedirN2
    call WriteString
    call ReadInt
    mov numero2, eax

    ; Comparación y decisión
    mov eax, numero1
    cmp eax, numero2
    jg esMayor
    jl esMenor
    je esIgual

esMayor:
    mov edx, OFFSET msgMayor
    jmp mostrar

esMenor:
    mov edx, OFFSET msgMenor
    jmp mostrar

esIgual:
    mov edx, OFFSET msgIgual
    jmp mostrar

mostrar:
    call WriteString
    call Crlf
    exit
main ENDP
END main