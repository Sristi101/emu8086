.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    ; Row counter starts from 1
    MOV BX, 1

    ; First character to print
    MOV DL, 'a'

ROW:
    ; Number of characters to print in this row
    MOV CX, BX

COL:
    ; Print character in DL
    MOV AH, 2
    INT 21H

    ; Next alphabet
    INC DL

    ; Repeat until CX = 0
    LOOP COL

    ; Save current character
    PUSH DX

    MOV DL, 0DH
    INT 21H

    MOV DL, 0AH
    INT 21H

    POP DX

    ; Move to next row
    INC BX

    ; Continue until row 5
    CMP BX, 6
    JNE ROW

    MOV AH, 4CH
    INT 21H

MAIN ENDP                                   
END MAIN     
