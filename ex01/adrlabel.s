		AREA	adrlabel, CODE, READONLY
		ENTRY
Start	
		BL		func
stop
		MOV		r0, #0x18
		LDR		r1, =0x20026
		SWI		0x123456
		LTORG
func	
		ADR		r0, Start
		ADR		r1, DataArea
		;ADR	r2, DataArea+4300
		
		ADRL	r2, DataArea + 4300
		MOV		pc, lr
DataArea
		SPACE	8000
		
		
		END
		