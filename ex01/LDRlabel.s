		AREA    LDRlabel, CODE,READONLY
        ENTRY                              ; Mark first instruction to execute
start
        BL      func1                      ; Branch to first subroutine
        BL      func2                      ; Branch to second subroutine
stop    MOV     r0, #0x18                  ; angel_SWIreason_ReportException
        LDR     r1, =0x20026               ; ADP_Stopped_ApplicationExit
        SWI     0x123456                   ; ARM semihosting SWI
func1
        LDR     r0, =start                 ; => LDR R0,[PC, #offset into
        LDR     r1, =Darea + 12            ; => LDR R1,[PC, #offset into
                                           ; Literal Pool 1]
        LDR     r2, =Darea + 6000          ; => LDR R2, [PC, #offset into
                                           ; Literal Pool 1]
        MOV     pc,lr                      ; Return
        LTORG                              ; Literal Pool 1
func2
        LDR     r3, =Darea + 6000          ; => LDR r3, [PC, #offset into
                                           ; Literal Pool 1]
                                           ; (sharing with previous literal)
        ; LDR   r4, =Darea + 6004          ; If uncommented produces an error
                                           ; as Literal Pool 2 is out of range
        MOV     pc, lr                     ; Return
Darea   SPACE   8000                       ; Starting at the current location,
                                           ; clears a 8000 byte area of memory
                                           ; to zero
        END                                ; Literal Pool 2 is out of range of
                                           ; the LDR instructions above