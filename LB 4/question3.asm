.model small
.stack 100h
.data
    char_array db 'abcdefgh$'      ; Array of characters (from 'a' to 'h')
    msg1 db 'The character is found.$'
    msg2 db 'The character is not found.$'
    msg3 db 'Enter a character (a-h): $'
    newline db 13, 10, '$'
    user_input db '?$'

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Display the prompt for user input
    mov ah, 09h                ; DOS service to display string
    lea dx, msg3         ; Load offset of prompt message
    int 21h                    ; Call DOS interrupt

    ; Get user input
    mov ah, 01h                
    int 21h                    
    mov user_input, al         ; Store the input character   
    
    ; Print newline
    lea dx, newline
    mov ah, 09h                
    int 21h

    ; Initialize search loop
    lea si, char_array         ; Load the address of char_array into SI
    mov cx, 8                  ; Set loop counter 

search:
    lodsb                      ; Load byte from array into AL
    cmp al, user_input         
    je found                   

    loop search           

not_found:
    lea dx, msg2
    mov ah, 09h                ; DOS service to display string
    int 21h
    jmp exit                   ; Jump to exit

found:
    lea dx, msg1
    mov ah, 09h                
    int 21h

exit:
    ; Exit the program
    mov ah, 4Ch                ; DOS service to terminate program
    int 21h

main endp
end main