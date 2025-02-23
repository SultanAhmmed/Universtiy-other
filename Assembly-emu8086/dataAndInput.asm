.MODEL SMALL
.STACK 100H

.DATA
; THE VARIABLE WHICH ARE DECLARED
   NUM DB 49
   CHAR DB 'A'
   MSG DB "My name is Sultan $"


.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH, 2
    MOV DL, NUM
    INT 21H
    
    ; NEW LINE
    MOV AH, 2
    MOV DL, 0AH ; FOR NEW LINE 
    INT 21H
    MOV DL, 0DH ; SET THE CURSOR AT THE STARTING POSITION
    INT 21H
     
    MOV AH, 2
    MOV DL, CHAR
    INT 21H
    
    MOV AH,2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
     
    MOV AH, 9
    LEA DX, MSG
    ;MOV DL, OFFSET MSG
    INT 21H
     
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN