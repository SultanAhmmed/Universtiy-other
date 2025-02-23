.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH, 1
    INT 21H
    MOV BH,AL
    
    SUB BL, BH
    ADD BL, 030H  ; CONVERT HEX TO DECIMAL
    
    MOV AH, 2
    MOV DL, 0AH ; NEW LINE
    INT 21H
    MOV AH, 2
    MOV DL, 0DH ; SETTING CURSOR AT 0
    INT 21H
    
    ;PRINTING RESULT
    MOV AH,2
    MOV DL, BL
    INT 21H
    
    EXIT:
    MOV AH, 04CH
    INT 21H
    
    
    MAIN ENDP
END MAIN

