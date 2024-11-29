.model small
.stack 100h
.data
    number db 5       ; The number we want to display in binary (5)

    msg db 'Binary number is = $'
.code

main proc
    mov ax, @data     ; Initialize data segment
    mov ds, ax

    mov al, number    ; Load the number (5) into AL
    ;sub al, 48 
    mov ah, 0
    
    mov bx, 2
    
    mov dx, 0         ;remainder is stored in dx
    
    mov cx, 0         ;counter
again:    
    div bx    
    push dx    
    inc cx
    cmp ax, 0
    jne again 
    
    lea dx, msg
    mov ah, 09h
    int 21h 
    
disp:    
    pop dx 
    add dx, 48
    mov ah, 2
    int 21h
    loop disp


    ; End the program
    mov ah, 4Ch       ; DOS interrupt to terminate the program
    int 21h

main endp
end main