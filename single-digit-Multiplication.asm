.MODEL SMALL
.STACK 100H
.DATA
    MSG    DB "ENTER FIRST NUMBER: $"
    MSG2   DB 0DH,0AH,"ENTER SECOND NUMBER: $"
    RESULT DB 0DH,0AH,"PRODUCT: $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    MOV AH, 01H
    INT 21H

    SUB AL, 48
    MOV BL, AL

    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    MOV AH, 01H
    INT 21H

    SUB AL, 48

    MUL BL          ; AX = AL * BL

    MOV BL, AL
    MOV AH, 09H
    LEA DX, RESULT
    INT 21H

    MOV AL, BL
    ADD AL, 48

    MOV DL, AL
    MOV AH, 02H  
    
    INT 21H
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN