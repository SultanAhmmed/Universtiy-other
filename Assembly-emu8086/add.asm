.MODEL SMALL

.STACK 100H

.DATA
   
   msg1 DB 'Enter first number: $' ; Message to user
   msg2 DB 0DH, 0AH, 'Enter second number: $' ; Message (newline added)
   msg3 DB 0DH, 0AH, 'Sum: $'
 
   A DB ?
   B DB ?
   SUM DB ?
   
.CODE

MAIN PROC
    ; Initialize data segment
    MOV AX,@DATA
    MOV DS, AX
    
    ; Display message 1
    LEA DX, msg1
    MOV AH, 09H
    INT 21H
    
    ;Take first number as input
    MOV AH, 01H
    INT 21H
    SUB AL, 30H ; Convert ASCII to decimal
    MOV A, AL; 
     
     
    ; Display message 2
    LEA DX, msg2
    MOV AH, 09H
    INT 21H
    
    ;Take second number as input
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV B, AL
    
    ;Perform addition
    MOV AL, A
    ADD AL, B
    MOV SUM, AL ; Store sum
    
    ;Convert sum back to ASCII
    ADD SUM, 30H
    
    ;Display message 3
    LEA DX, msg3
    MOV AH, 09H
    INT 21H
    
    ;Display sum
    MOV DL, SUM
    MOV AH, 02H
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN