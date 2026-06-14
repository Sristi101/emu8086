INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; First Number
    PRINT "ENTER FIRST NUMBER: "
    MOV AH, 01H
    INT 21H
    SUB AL, 48
    MOV BL, AL

    ; Second Number 
    PRINTN
    PRINT "ENTER SECOND NUMBER: "
    MOV AH, 01H
    INT 21H

    SUB AL, 48
    MOV CL, AL

    ; Division
    MOV AL, BL
    MOV AH, 00H
    DIV CL

    ; Display Result Message
    MOV BL, AL
    PRINTN
    PRINT  "QUOTIENT: "

    ; Print Quotient
    MOV AL, BL
    ADD AL, 48

    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN  