; Materia: Lenguajes de Interfaz
; Alumno: Velasco Gonzalez Diego
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 3. Comparación y prueba
; Descripción: practica para ver como cmp y test afectan a las eflags

INCLUDE Irvine32.inc

.data
instruccion BYTE "Comparaciones", 0
fin         BYTE "Fin de las comparaciones.", 0

.code
main PROC
    mov edx, OFFSET instruccion
    call WriteString
    call Crlf

    ; CMP
    ; Iguales: ZF=1, SF=0, CF=0, OF=0
    mov eax, 10
    mov ebx, 10
    cmp eax, ebx
    call dumpRegs

    ; Mayor: 8 - 5 = 3 -> ZF=0, SF=0, CF=0, OF=0
    mov eax, 8
    mov ebx, 5
    cmp eax, ebx
    call dumpRegs

    ; Menor: 5 - 8 = -3 -> ZF=0, SF=1, CF=1 , OF=0
    mov eax, 5
    mov ebx, 8
    cmp eax, ebx
    call dumpRegs

    ; Test
    ; AND interno con la máscara sin modificar al
    mov al, 10110010b

    ; Bit 1 activo -> resultado distinto de cero -> ZF=0
    test al, 00000010b

    ; Bit 0 inactivo -> resultado cero -> ZF=1
    test al, 00000001b

    mov edx, OFFSET fin
    call WriteString
    call Crlf
    exit
main ENDP
END main