.MODEL SMALL
.STACK 100H
.DATA
    array DB 5 DUP(0)   ; Declare an array of size 5
.CODE
START:
    MOV AX, @DATA       ; Initialize data segment
    MOV DS, AX

    MOV CX, 5           ; Loop counter for 5 inputs
    MOV SI, 0           ; Array index starting at 0

again:
    MOV AH, 1           ; Function to take single character input
    INT 21H             ; DOS interrupt to take input
    MOV array[SI], AL   ; Store the input in array
    INC SI              ; Increment index
    LOOP again     ; Repeat until CX=0

    MOV AH, 4CH         ; Exit
    INT 21H
END START