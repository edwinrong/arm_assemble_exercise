		AREA loadcon, CODE, READONLY
		ENTRY
start	BL	func1
		BL	func2
stop	MOV		r0, #0x18
		LDR		r1, =0x20026
		SWI		0x123456
func1
		LDR		r0, =42
		LDR		r1, =0x55555555
		LDR		r2, =0xFFFFFFFF
		MOV		pc, lr
		LTORG
func2
		LDR		r3, =0x55555555
		; LDR	r4, =0x66666666
		
		MOV		pc, lr
LargeTable
		SPACE	4200
		
		END