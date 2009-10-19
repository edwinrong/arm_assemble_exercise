;*********************************************************
;File Name : 		init.s
;Description:
;Author:
;Date:
;*********************************************************

	IMPORT		Main
	AREA	Init, CODE, READONLY
	ENTRY
	LDR		R0, =0x3FF000
	LDR		R1, =0xE7FFFF80
	STR		R1, [R0]
	LDR		SP, =0x3FE1000
	BL		Main
	END
	
	