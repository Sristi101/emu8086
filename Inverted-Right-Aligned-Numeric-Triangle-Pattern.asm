.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC

    ; Number of digits in first row
    MOV BX, 5

ROW:
    ; Digits to print in this row
    MOV CX, BX

    ; Start printing from '1'
    MOV DL, '1'

COL:
    MOV AH, 2
    INT 21H

    INC DL
    LOOP COL

    ; New line
    MOV DL, 0DH
    MOV AH, 2
    INT 21H

    MOV DL, 0AH
    INT 21H

    ; Next row has one less digit
    DEC BX

    CMP BX, 0
    JNE ROW

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
    
    
 