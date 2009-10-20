		AREA    Jump, CODE, READONLY     ; Name this block of code
        CODE32                           ; Following code is ARM code
num     EQU     2                        ; Number of entries in jump table
        ENTRY                            ; Mark first instruction to execute
start                                    ; First instruction to call
        MOV     r0, #0                   ; Set up the three parameters
        MOV     r1, #3
        MOV     r2, #2
        BL      arithfunc                ; Call the function
stop    MOV     r0, #0x18                ; angel_SWIreason_ReportException
        LDR     r1, =0x20026             ; ADP_Stopped_ApplicationExit
        SWI     0x123456                 ; ARM semihosting SWI
arithfunc                                ; Label the function
        CMP     r0, #num                 ; Treat function code as unsigned integer
        MOVHS   pc, lr                   ; If code is >= num then simply return
        ADR     r3, JumpTable            ; Load address of jump table
        LDR     pc, [r3,r0,LSL#2]        ; Jump to the appropriate routine
JumpTable
        DCD     DoAdd
        DCD     DoSub
DoAdd   ADD     r0, r1, r2               ; Operation 0
        MOV     pc, lr                   ; Return
DoSub   SUB     r0, r1, r2               ; Operation 1
        MOV     pc, lr                   ; Return
        END                              ; Mark the end of this file