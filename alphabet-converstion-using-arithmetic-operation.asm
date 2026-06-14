.MODEL SMALL
.STACK 100H
.DATA  
    MSG DB "ENTER A CHARACTER: $"
    MSG2 DB 0DH, 0AH, "CONVERTED TO UPPERCASE: $"
    MSG3 DB 0DH, 0AH, "CONVERTED TO LOWERCASE: $"
.CODE
MAIN PROC   
    MOV AX, @DATA
    MOV DS, AX  
    
    MOV AH, 09H
    LEA DX, MSG
    INT 21H
    ; user input
    MOV AH, 01H
    INT 21H
    ; check if al < 'a'
    CMP AL, 'a'
    JB TO_LOWER   ; jb - jump if smaller
      
    TO_UPPER:
        SUB AL, 32  
        MOV BL, AL
        MOV AH, 09H
        LEA DX, MSG2  
        INT 21H 
        MOV AL, BL 
        
        JMP DISPLAY
    
    TO_LOWER:
        ADD AL, 32
        MOV BL, AL 
        MOV AH, 09H
        LEA DX, MSG3
        INT 21H  
        MOV AL, BL 
              
     DISPLAY: 
        MOV AH, 02H
        MOV DL, AL
        INT 21H     
        
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN