.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC

    ; Initialize row counter
    MOV BX, 1

ROW:
    ; Set number of columns equal to current row number
    MOV CX, BX

    ; Start printing from character '1'
    MOV DL, '1'

COL:
    ; Display character in DL
    MOV AH, 2
    INT 21H

    ; Move to next digit
    INC DL

    ; Repeat until CX becomes 0
    LOOP COL

    ; Move cursor to next line (Carriage Return)
    MOV DL, 0DH
    INT 21H

    ; Line Feed
    MOV DL, 0AH
    INT 21H

    ; Increment row number
    INC BX

    ; Continue until BX = 6
    CMP BX, 6
    JNE ROW

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
