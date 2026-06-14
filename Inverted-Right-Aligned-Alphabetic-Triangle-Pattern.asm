.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC

    ; Start from 5 characters
    MOV BX, 5

    ; First character
    MOV DL, 'a'

ROW:
    ; Number of characters in current row
    MOV CX, BX

COL:
    MOV AH, 2
    INT 21H

    INC DL
    LOOP COL

    ; Save current character
    PUSH DX

    ; New line
    MOV DL, 0DH
    MOV AH, 2
    INT 21H

    MOV DL, 0AH
    INT 21H

    ; Restore current character
    POP DX

    ; Decrease row size
    DEC BX

    ; Continue until BX = 0
    CMP BX, 0
    JNE ROW

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
    
    
    
 