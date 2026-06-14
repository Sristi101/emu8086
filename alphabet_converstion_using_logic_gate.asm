 INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    PRINT "ENTER AN ALPHABET: "
    MOV AH, 1
    INT 21H         

    CMP AL, 'a'
    JB TO_LOWER  
       
    TO_UPPER:  
        PRINTN
        PRINT "CONVERTED TO UPPERCASE: "
        AND AL, 11011111B   ; clear bit 5
        JMP DISPLAY
    
    TO_LOWER:
        PRINTN
        PRINT "CONVERTED TO LOWERCASE: "
        OR AL, 00100000B    ; set bit 5
    
    DISPLAY:
        MOV DL, AL
        MOV AH, 2
        INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN