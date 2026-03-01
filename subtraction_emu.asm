.model small
.stack 100h
.data
    n1 db 6
    n2 db 2 
    n3 db 19
    n4 db 8 
    msg db "Result: $"
    newline db 0dh, 0ah,"$"
    result1 db ? 
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; for result only (0-9) 
    mov al, n1
    sub al, n2        ; AL = 4
    
    mov result1, al
    
    ; convert number to ascii
    add result1, 30h
    
    ; show result message
    mov ah, 09h
    lea dx, msg
    int 21h
    
    ; show the output
    mov dl, result1
    mov ah, 02h
    int 21h 
    
    ; newline
    mov ah, 09h
    lea dx, newline
    int 21h 
    
    ; for result more than 9 
    mov al, n3
    sub al, n4        ; AL = 11
    
    ; find the remainder
    mov ah, 0
    mov bl, 10
    div bl            ; AL = quotient, AH = remainder
    mov bh, ah  
    
    mov ah, 09h
    lea dx, msg
    int 21h 
    
    ; first digit
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h
    
    ; second digit
    add bh, 30h
    mov dl, bh
    mov ah, 02h
    int 21h
     
    ; exit 
    mov ah, 4ch
    int 21h 
    
main endp
end main