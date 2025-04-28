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

; int32_t strCmp(char* a, char* b)
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
	mov AL, byte [RDI]   ; <-- Cargar SIEMPRE en cada vuelta
    mov BL, byte [RSI]
	cmp AL, '\0'
	je .fin
	cmp BL, '\0'
	je .fin
	cmp AL, BL
	je .equal
	;no son iguales
	jl .a_is_smaller
	jg .a_is_greater


.a_is_smaller:
	mov EAX, 1
	jmp .return

.a_is_greater:
	mov EAX, -1
	jmp .return
	
	
.equal:
	;no son el caracter nulo, tengo q comparar el resto del str
	inc RDI
	inc RSI
	mov AL, byte [RDI]
	mov BL, byte [RSI]

	jmp .loop

.same_str:
	mov EAX, 0 ;son el mismo string, devuelvo 0
	jmp .return

.fin:
	cmp AL, BL
	je .same_str
	cmp AL, '\0'
	je .a_is_smaller
	jmp .a_is_greater

.return:
	pop RBP
	ret

; char* strClone(char* a)
strClone:
	ret

; void strDelete(char* a)
strDelete:
	ret

; void strPrint(char* a, FILE* pFile)
strPrint:
	ret

; uint32_t strLen(char* a)
strLen:
	ret


