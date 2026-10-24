; Materia: Lenguajes de Interfaz
; Alumno: Velasco Gonzalez Diego
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 14 - Captura y almacenamiento de datos numéricos
; Descripción: Registro de existencia en almacén de tarjetas ESP32. Captura la
; cantidad recibida con ReadString, acepta uno o dos dígitos con
; valor entre 1 y 99, rechaza entradas vacías, letras, signos,
; espacios y cantidades fuera de rango (y vuelve a pedir),
; convierte la cadena a número y lo guarda en cantidadRecibida.
; Suma esa cantidad a la existencia inicial de 25 unidades y
; guarda el resultado en existenciaActual, que se muestra con
; WriteString usando convertirDecimal. No se usa ReadDec,
; ReadInt, ParseDecimal32 ni WriteDec.

INCLUDE Irvine32.inc

.data
existenciaInicial DWORD 25
cantidadRecibida  DWORD ?
existenciaActual  DWORD ?

msgPedir    BYTE "Unidades recibidas (1 a 99): ", 0
msgError    BYTE "Entrada invalida. Escribe uno o dos digitos, de 1 a 99.", 0
msgExistencia BYTE "Existencia actual: ", 0
msgUnidades BYTE " unidades", 0

entrada      BYTE 8 DUP(?)
longitud     DWORD ?
bufferNumero BYTE 11 DUP(?)

.code
main PROC
capturar:
    mov edx, OFFSET msgPedir
    call WriteString
    mov edx, OFFSET entrada
    mov ecx, SIZEOF entrada - 1
    call ReadString
    mov longitud, eax

    ; uno o 2 caracteres
    cmp eax, 1
    jb entradaInvalida
    cmp eax, 2
    ja entradaInvalida

    ; Solo digitos
    mov esi, 0
validar:
    mov al, entrada[esi]
    cmp al, '0'
    jb entradaInvalida
    cmp al, '9'
    ja entradaInvalida
    inc esi
    cmp esi, longitud
    jb validar

    
    mov eax, 0
    mov ebx, 10
    mov esi, 0
convertir:
    mul ebx
    mov ecx, 0
    mov cl, entrada[esi]
    sub cl, '0'
    add eax, ecx
    inc esi
    cmp esi, longitud
    jb convertir

    ; Rango permitido: 1 a 99
    cmp eax, 1
    jb entradaInvalida
    cmp eax, 99
    ja entradaInvalida

    ; Almacenar la cantidad y actualizar la existencia
    mov cantidadRecibida, eax
    add eax, existenciaInicial
    mov existenciaActual, eax
    jmp mostrar

entradaInvalida:
    mov edx, OFFSET msgError
    call WriteString
    call Crlf
    jmp capturar

mostrar:
    mov edx, OFFSET msgExistencia
    call WriteString
    mov eax, existenciaActual
    mov esi, OFFSET bufferNumero
    call convertirDecimal
    mov edx, OFFSET bufferNumero
    call WriteString
    mov edx, OFFSET msgUnidades
    call WriteString
    call Crlf
    exit
main ENDP

convertirDecimal PROC
    mov ebx, 10
    mov ecx, 0
dividir:
    mov edx, 0
    div ebx
    push edx
    inc ecx
    cmp eax, 0
    jne dividir

escribir:
    pop edx
    add dl, '0'
    mov [esi], dl
    inc esi
    loop escribir

    mov BYTE PTR [esi], 0
    ret
convertirDecimal ENDP

END main