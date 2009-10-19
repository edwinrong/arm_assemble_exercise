	AREA ex01, CODE, READONLY
			
	GBLA	Test1
	GBLL	Test2
	GBLS	Test3
;Test2	SETL	{TRUE}	
Test2	SETL	{FALSE}
Test1	SETA	0xaa
Test3	SETS	"Testing"	

Test4	equ		0xffff
data01_len	equ	0x2

	ENTRY
	IF	Test2 = {TRUE}
		LDR		r0, =Test1
	ELSE
		LDR		r1, =Test4
		BIC		r1, r1, #0x7
	ENDIF
	
	LDR		r2, =data01_len
	LDR		r3, =data01
	ADD		r5, r2, r3
a	LDRB	r4, [r3]
	BIC		r4, r4, #0x01
	STRB	r4, [r3]
	ADD		r3, r3, #0x1
	CMP		r3, r5
	BNE		a	
0
	b 0
	LTORG
data01
	DCB	0x0f, 0x0b			
	END
	
	AREA data, DATA, READWRITE
;data01
	;DCB	0x0f, 0x0b	
	END
	
