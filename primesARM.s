	.global _start
	
_start:
	EOR R3, R3
	EOR R4, R4
	EOR R5, R5
	
	MOV R4, #3
	MOV R6, #5
	MOV R5, R6
	
_new_number:
	EOR R3, R3
	MOV R3, R6
	EOR R4, R4
	MOV R4, #3
	EOR R5, R5
	MOV R5, R6
	SUB R5, R5, R4
	B _factorise
	
_factorise:
	CMP R4, R6
	BEQ _is_prime 
	CMP R3, R4
	BEQ _inc_num
	CMP R3, R4
	BMI _inc_fact
	SUB R3, R3, R4
	B _factorise
	
_inc_num:
	ADD R6, R6, #2
	B _new_number
	
_inc_fact:
	CMP R4, R6
	BGE _is_prime
	ADD R4, R4, #2
	MOV R3, R6
	B _factorise
	
_is_prime:
	MOV R3, #0
	MOV R10, #0
	LDR R9, =bill
	BL _chk_num
	BL _print_digit
	LDR R9, =cmill
	BL _chk_num
	BL _print_digit
	LDR R9, =xmill
	BL _chk_num
	BL _print_digit
	LDR R9, =mill
	BL _chk_num
	BL _print_digit
	LDR R9, =cm
	BL _chk_num
	BL _print_digit
	LDR R9, =xm
	BL _chk_num
	BL _print_digit
	LDR R9, =m
	BL _chk_num
	BL _print_digit
	LDR R9, =c
	BL _chk_num
	BL _print_digit
	LDR R9, =x
	BL _chk_num
	BL _print_digit
	LDR R9, =i
	BL _chk_num
	BL _print_digit
	MOV R0, #1
	LDR R1, =ending
	MOV R2, #1
	MOV R7, #4
	SWI 0
	
_chk_num:
	MOV R8, R6
	CMP R8, R9
	SUBGT R8, R8, R9
	ADDGT R10, #1
	MOVLE PC, R14
	B chk_num
	
_print_digit:
	MOV R0, #1			@ Best get the output ready now
	MOV R2, #1			
	MOV R7, #4
	
	CMP R10, #0			@ Check if there's anything to print - if there's nothing in R10 then out we go
	ADDGT R3, #1		@ If there is incremement R3
	CMP R3, #0			@ Because if R3 is 0 then also we quit
	MOVEQ PC, R14
	ADD R10, #10
	CMP R10, #10
	LDREQ R1, =num_0
	SWIEQ 0
	SUB R10, #1
	CMP R10, #9
	LDREQ R1, =num_9
	SWIEQ 0
	SUB R10, #1
	CMP R10, #8
	LDREQ R1, =num_8
	SWIEQ 0
	SUB R10, #1
	CMP R10, #7
	LDREQ R1, =num_7
	SWIEQ 0
	SUB R10, #1
	CMP R10, #6
	LDREQ R1, =num_6
	SWIEQ 0
	SUB R10, #1
	CMP R10, #5
	LDREQ R1, =num_5
	SWIEQ 0
	SUB R10, #1
	CMP R10, #4
	LDREQ R1, =num_4
	SWIEQ 0
	SUB R10, #1
	CMP R10, #3
	LDREQ R1, =num_3
	SWIEQ 0
	SUB R10, #1
	CMP R10, #2
	LDREQ R1, =num_2
	SWIEQ 0
	SUB R10, #1
	CMP R10, #1
	LDREQ R1, =num_1
	SWIEQ 0
	
	
	
.data
bill:	
	.int #1000000000
cmill:
	.int #100000000
xmill:
	.int #10000000
mill:
	.int #1000000
cm:
	.int #100000
xm:
	.int #10000
m:
	.int #1000
c:
	.int #100
x:
	.int #10
i:
	.int #1

ending:
	.ascii " is Prime\n"
num_0:
	.ascii "0"
num_9:
	.ascii "9"
num_8:
	.ascii "8"
num_7:
	.ascii "7"
num_6:
	.ascii "6"
num_5:
	.ascii "5"
num_4:
	.ascii "4"
num_3:
	.ascii "3"
num_2:
	.ascii "2"
num_1:
	.ascii "1"
