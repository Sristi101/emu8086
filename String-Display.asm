.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'Enter a string: $'
    STR DB 50, ?, 50 DUP('$')
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display Message
    MOV AH, 09H  
    LEA DX, MSG
    INT 21H

    ; Read String 
    MOV AH, 0AH 
    LEA DX, STR
    INT 21H

    ; Move pointer to first character
    LEA SI, STR+2

    ; length of str
    MOV CL, STR+1
    MOV CH, 0

    ; Print New Line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Display the String
PRINT:
    MOV DL, [SI]
    MOV AH, 02H
    INT 21H
    INC SI
    LOOP PRINT

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN        
