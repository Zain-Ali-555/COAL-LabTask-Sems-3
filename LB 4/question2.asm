.model small
.stack 100h
.data
    numbers db '1', '2', '3', '4', 13, 10, '5', '6', '7', '8', 13, 10, '$'  ; Array of characters and line breaks
    msg db 13, 10, '$'                                                      ; Newline characters

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Load address of numbers array
    lea dx, numbers

    ; Print the numbers
    mov ah, 09h            ; DOS interrupt to print string
    int 21h

    ; Exit the program
    mov ah, 4Ch            ; DOS interrupt to exit program
    int 21h

main endp
end main
