        AREA    StrCopy, CODE, READONLY
        ENTRY                             ; Mark first instruction to execute
start   LDR     r1, =srcstr               ; Pointer to first string
        LDR     r0, =dststr               ; Pointer to second string
        BL      strcopy                   ; Call subroutine to do copy
stop    MOV     r0, #0x18                 ; angel_SWIreason_ReportException
        LDR     r1, =0x20026              ; ADP_Stopped_ApplicationExit
        SWI     0x123456                  ; ARM semihosting SWI
strcopy
        LDRB    r2, [r1],#1               ; Load byte and update address
        STRB    r2, [r0],#1               ; Store byte and update address
        CMP     r2, #0                    ; Check for zero terminator
        BNE     strcopy                   ; Keep going if not
        MOV     pc,lr                     ; Return
        AREA    Strings, DATA, READWRITE
srcstr  DCB     "First string - source",0
dststr  DCB     "Second string - destination",0
        END