.MODEL SMALL
.STACK 100H
.DATA
    hexNum DB 1AH ;1A IN HEX ( 26 in Decimal)
    msg DB 'Decimal Value: $'

.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    ;Display message
    LEA DX,msg
    MOV AH, 09H
    INT 21H
    
    ;Convert hex to Decimal
    MOV AL, hexNum
    AAM     ;ASCII Adjust AX for Multiplication (AX = 0x1A ? AH=01, AL=0A)  
    
    ADD AH, 30H ;CONVERT AH to ASCII
    MOV DL, AH
    MOV AH, 02H
    INT 21H
    
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    
    ;EXIT
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN