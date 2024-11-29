.model small
.stack 100h
.data
    msg db 'The result of the addition is: $'

.code
    main proc
        ; Initialize the data segment
        mov ax, @data
        mov ds, ax

        ; Initialize three numbers in registers
        mov ax, 1    ; First number
        mov bx, 2    ; Second number
        mov cx, 3    ; Third number

        ; Push the three numbers onto the stack
        push ax      ; Push 1 onto the stack
        push bx      ; Push 2 onto the stack
        push cx      ; Push 3 onto the stack

        pop ax        ; Pop the 3 into AX
        pop bx        ; Pop the 2 into BX
        add ax, bx    ; AX = 3+2

        pop bx        ; Pop the 1 into BX
        add ax, bx    ; AX = 5+1

        ; Push the result back onto the stack
        push ax       ; Push the result (6) onto the stack   
        
        ; Display the result message
        mov ah, 09h
        lea dx, msg
        int 21h  

        ; Pop the result from the stack and store it in AX
        pop ax        ; Pop the result into AX
        mov dx, ax 
        add dx, 48 
        mov ah, 2
        int 21h    
        
        ; Exit program
        mov ah, 4Ch
        int 21h

    main endp
end main
