.model small
.stack 100h
.data
    newline db 13, 10, '$'   ; Newline characters for DOS interrupt
.code
    main proc
        ; Initialize the data segment
        mov ax, @data
        mov ds, ax

        ; Outer loop: from 1 to 5
        mov cx, 5             ; Outer loop counter, CX = 5 (for numbers 1 to 5)
        mov si, 1             ; Start printing from 1

    outer_loop:
        push cx               ; Save outer loop counter on the stack
        mov cx, si            ; Set inner loop counter to current value of SI (1, 2, 3,...)

    inner_loop:
        mov dx, si            ; Move current number into DL
        add dx, '0'           
        mov ah, 02h           
        int 21h
        loop inner_loop       

        ; Print a newline 
        mov ah, 09h
        lea dx, newline
        int 21h

        pop cx                ; Restore outer loop counter from the stack
        inc si                ; Increment SI for the next number
        loop outer_loop       ; Decrement CX and repeat if CX > 0

        ; Exit program
        mov ah, 4Ch
        int 21h

    main endp
end main
