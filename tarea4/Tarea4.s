.data
modo: .int 3
largo: .int 4
arreglo: .4byte 0,0,5,5
.text

MAIN:
	ldr R4, =arreglo
	ldr R5, =largo
	ldr R1,=modo
	#mov R3, #00
	mov R7,#04
	ldr R6, [R5]
	ldr R0,[R1]

	cmp R0,#02
	blt MODO1
	beq MODO2
	cmp R0,#03
	beq MODO3
	bgt MODO4
	
MODO1:
	ldr R0, [R4]
	ldr R1, [R4,#4]
	mul R0,R0,R0
	mul R1,R1,R1
	add R0,R0,R1
	b RAIZ

MODO2:
	ldr R0, [R4]
	ldr R1, [R4,#4]
	mul R0,R0,R0
	mul R1,R1,R1
	cmp R0,R1
	bgt R0MR1
	blt R1MR0
	
R0MR1:
	sub R0,R0,R1
	b RAIZ
R1MR0:
	sub R0,R1,R0
	b RAIZ

MODO3:
	mov R5,#00
	ldr R0, [R4]
	add R5,R5,#04
	ldr R1, [R4,R5]
	add R5,R5,#04
	ldr R2, [R4,R5]
	add R5,R5,#04
	ldr R3, [R4,R5]	
	sub R0,R2,R0
	mul R0,R0,R0
	mov R2,R0
	sub R0,R3,R1
	mul R0,R0,R0
	mov R3,R0
	add R0,R2,R3
	#calcular raiz

RAIZ:
	mov R2, #128
	mov R3,#00
LRAIZ:
	asr R2,R2,#1
	add R3,R3,R2
	mov R1,R3
	mul R1,R1,R1
	cmp R2,#00
	beq .ENDRAIZ
	cmp R1,R0
	beq .ENDRAIZ
	bgt UNSET
	
	blt LRAIZ


UNSET:
	sub R3,R3,R2
	b LRAIZ
.ENDRAIZ:
	
	
	mov R2,R3
	b .ENDMODO4

	
MODO4:
	mov R0,#00
	mul R7,R7,R6
loopsum:
	
	ldr R1,[R4,R0]
	add R9,R9,R1
	add R0,R0,#4
	cmp R0,R7
	blt loopsum
.endloopsum:
mov R0,#0
mov R1,#2
mov R2,R9
bl printInt
mov R1, R9
mov R2,#00

cmp R1,#00

bge .ENDDIVNEG
DIVNEG: neg R1,R1
.ENDDIVNEG:
cmp R1,R6
blt .ENDLOOPDIV
#if0
#if+
LOOPDIV:
	sub R1,R1,R6
	add R2,R2,#1
	cmp R1,R6
	bge LOOPDIV
	
.ENDLOOPDIV:
.ENDMODO4:

mov R0,#0
mov R1,#5
bl printInt

end: 	wfi
	.end
