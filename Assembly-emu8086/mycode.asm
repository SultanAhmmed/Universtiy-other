.MODEL SMALL

.STACK 100H

.DATA   
   msg1 DB 'Enter a charcter: $'  ; Promp message
   msg2 DB 'You entered: $' ;Output message
   input DB ?   ; Variable to store user input
   
.CODE

MAIN PROC
  MOV AX, @DATA
  MOV DS, AX
  
  ; DISPLAY MESSAGE 1 
  MOV DX, OFFSET msg1
  MOV AH, 09H
  INT 21H
  
  ; TAKE INPUT FROM USER
  MOV AH, 01H
  INT 21H
  MOV input, AL
  
  ; NEWLINE FOR BETTER FORMATTING
  MOV DL, 0DH ; CARRIAGE RETURN
  MOV AH, 02H
  INT 21H
  
  MOV DL, 0AH ; LINE FEED
  MOV AH, 02H
  INT 21H
  
  ; DISPLAY MESSAGE 2
  MOV DX, OFFSET msg2
  MOV AH, 09H
  INT 21H
   
  
  ; DIPLAY USER INPUT
  MOV DL, input
  MOV AH, 02H
  INT 21H
  
  ;EXIT PROGRAM
  MOV AH, 4CH
  INT 21H
            
        
MAIN ENDP

END MAIN