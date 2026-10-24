; Materia: Lenguajes de Interfaz
; Alumno: Velasco Gonzalez Diego
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 10. Obtención de una cadena decimal
; Descripción: Un archivo de 100000 bytes se descarga en bloques de 512 bytes
; y se han recibido 125 bloques. En main se calculan los bytes
; descargados y pendientes, el porcentaje entero de avance y los
; grupos completos de 1024 bytes con su residuo. Cada resultado
; se convierte a texto con el procedimiento convertirDecimal
; y se muestra con WriteString

INCLUDE Irvine32.inc

.data
tamanoArchivo    DWORD 100000
tamanoBloque     DWORD 512
bloquesRecibidos DWORD 125

descargados     DWORD ?
pendientes      DWORD ?
porcentaje      DWORD ?
gruposCompletos DWORD ?
residuo         DWORD ?

bufferNumero BYTE 11 DUP(?)

msgDescargados BYTE "Bytes descargados:            ", 0
msgPendientes  BYTE "Bytes pendientes:             ", 0
msgPorcentaje  BYTE "Porcentaje de avance (%):     ", 0
msgGrupos      BYTE "Grupos completos de 1024:     ", 0
msgResiduo     BYTE "Residuo del agrupamiento:     ", 0

.code
main PROC
    ; Bytes descargados = bloques recibidos * tamaño del bloque
    mov eax, bloquesRecibidos
    mul tamanoBloque
    mov descargados, eax

    ; Bytes pendientes = tamaño del archivo - bytes descargados
    mov eax, tamanoArchivo
    sub eax, descargados
    mov pendientes, eax

    ; Porcentaje entero = descargados * 100 / tamaño del archivo
    mov eax, descargados
    mov ebx, 100
    mul ebx
    div tamanoArchivo
    mov porcentaje, eax

    ; Grupos completos de 1024 bytes y residuo
    mov eax, descargados
    mov edx, 0
    mov ebx, 1024
    div ebx
    mov gruposCompletos, eax
    mov residuo, edx

   
    mov edx, OFFSET msgDescargados
    call WriteString
    mov eax, descargados
    mov esi, OFFSET bufferNumero
    call convertirDecimal
    mov edx, OFFSET bufferNumero
    call WriteString
    call Crlf

    mov edx, OFFSET msgPendientes
    call WriteString
    mov eax, pendientes
    mov esi, OFFSET bufferNumero
    call convertirDecimal
    mov edx, OFFSET bufferNumero
    call WriteString
    call Crlf

    mov edx, OFFSET msgPorcentaje
    call WriteString
    mov eax, porcentaje
    mov esi, OFFSET bufferNumero
    call convertirDecimal
    mov edx, OFFSET bufferNumero
    call WriteString
    call Crlf

    mov edx, OFFSET msgGrupos
    call WriteString
    mov eax, gruposCompletos
    mov esi, OFFSET bufferNumero
    call convertirDecimal
    mov edx, OFFSET bufferNumero
    call WriteString
    call Crlf

    mov edx, OFFSET msgResiduo
    call WriteString
    mov eax, residuo
    mov esi, OFFSET bufferNumero
    call convertirDecimal
    mov edx, OFFSET bufferNumero
    call WriteString
    call Crlf
    exit
main ENDP

convertirDecimal PROC
    ; Dividir entre 10 el numero para separar los digitos
    mov ebx, 10
    mov ecx, 0
dividir:
    mov edx, 0
    div ebx
    push edx
    inc ecx
    cmp eax, 0
    jne dividir

    ; Recuperar los dígitos en el orden correcto y convertirlos a ASCII
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