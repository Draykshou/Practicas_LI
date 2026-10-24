; Materia: Lenguajes de Interfaz
; Alumno: Velasco Gonzalez Diego
; Horario: 8-9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 11. Operaciones lógicas
; Descripción: vistazo de las operaciones logicas de ensamblador
include Irvine32.inc
.code
main proc
	; 0 - Encendido
	; 1 - Alarma
	; 2 - Conectado
	; Estado inicial: 00000101

	; 1 AND: Extraer el estado de encendido
	mov al, 00000101b
	and al, 00000001b
	call dumpRegs
	nop

	; 2 OR: encender la alarma
	mov al, 00000101b
	or al, 00000010b
	call dumpRegs
	nop

	; 3 - XOR - Desconectar y conectar computador
	mov al, 00000101b
	xor al, 00000100b
	call dumpRegs
	nop
	xor al, 00000100b
	call dumpRegs
	nop
 
	; 4 - NOT - Devolver estados
	mov al, 00000101b
	not al
	call dumpRegs
	nop

	exit
main endp
end main