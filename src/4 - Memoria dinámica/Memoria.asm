extern malloc
extern free
extern fprintf

section .data

section .text

global strCmp
global strClone
global strDelete
global strPrint
global strLen

; ** String **

; 
; a->RDI, b->RSI
; 0 si son iguales
; 1 si a < b
; -1 si a > b
strCmp:
	push RBP
	mov RBP, RSP

	mov AL, byte [RDI] ;primer caracter de a
	mov BL, byte [RSI] ;primer caracter de b
	
.loop:
	;mov AL, byte [RDI]
    ;mov BL, byte [RSI]
	cmp AL, 0 ;chequeo si es el caracter nulo
	je .check ;si es el caracter nulo ya recorri toda la cadena, chequeo si la otra cadena es mas larga o no
	cmp BL, 0 ;chequeo si es el caracter nulo
	je .check ;si es el caracter nulo ya recorri toda la cadena
	;si estoy aca son dos caracteres no nulos
	cmp AL, BL
	;no son iguales
	jl .a_is_smaller
	jg .a_is_greater
	je .equal
	
.a_is_smaller:
	mov EAX, 1
	jmp .return

.a_is_greater:
	mov EAX, -1
	jmp .return
	
.equal:
	;tengo q comparar el resto del str
	inc RDI
	inc RSI
	mov AL, byte [RDI]
	mov BL, byte [RSI]

	jmp .loop

.same_str:
	mov EAX, 0 ;son el mismo string, devuelvo 0
	jmp .return

.check:
	;si estoy aca es pq AL o BL son '\0'
	cmp AL, BL ; chequeo si los dos son el caracter nulo
	je .same_str ;en ese caso las dos cadenas se terminan, son iguales
	cmp AL, 0 ; no se si es necesario
	je .a_is_smaller ;la cadena 1 es mas corta, por ende la mas chica
	jmp .a_is_greater ;la cadena 2 es mas corta

.return:
	pop RBP
	ret
;Genera una copia del string pasado por parámetro. El puntero pasado siempre es válido
;aunque podría corresponderse a la cadena vacía.
; char* strClone(char* a)

strClone:
	push RBP
	mov RBP, RSP
	push R12
	push R13
	mov R12, RDI
	xor RAX, RAX
	call strLen

	mov RDI, RAX
	add RDI, 1

	call malloc ;tengo en RAX la direccion de memoria reservada, Voy a devolver RAX
	cmp RAX, 0
	je .fin 
	mov RSI, RAX ;Voy a usar RSI para copiar el str
	mov R13, RAX
	.loop:
	mov AL, BYTE [R12]
	;copio el caracter actual a RSI
	mov BYTE [RSI], AL
	cmp AL, 0 ;chequeo si llegue al final del str
	je .fin
	;avanzo los punteros
	inc R12
	inc RSI

	jmp .loop
	
.fin:
	mov RAX, R13
	pop R13
	pop R12
	pop RBP
	ret

; void strDelete(char* a)
strDelete:
	call free
	ret

; void strPrint(char* a, FILE* pFile)
strPrint:
	ret

; uint32_t strLen(char* a)
strLen:
	push RBP
	mov RBP, RSP
	xor ECX, ECX; contador
	mov AL, BYTE [RDI]
.loop:
	cmp AL, 0
	je .fin
	add ECX, 1 ;sumo 1
	inc RDI
	mov AL, BYTE [RDI]
	jmp .loop
.fin:
	mov EAX, ECX
	pop RBP
	ret


