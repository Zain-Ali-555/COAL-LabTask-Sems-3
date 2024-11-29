.model small
.stack 100h
.data       
     msg1 db 'Enter number (0-9) = $' 
     msg2 db 'The given number is even$'
     msg3 db 'The given number is odd$'
     newline db 0Dh, 0Ah, '$'  ; Newline characters for moving to the next line

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax        
    call takeInput    
    call check
    ; Exit the program
    mov ah, 4Ch         ; DOS interrupt to terminate the program
    int 21h               
   main endp 

   takeInput proc
      ; Display "Enter number (0-9) = " message
      lea dx, msg1
      mov ah, 09h
      int 21h      
      ; Take user input
      mov ah, 01h         ; Function to take single character input
      int 21h             ; Result will be in AL (ASCII)
      ret
   takeInput endp   
   
   check proc
      sub al, 48          ; Convert ASCII to decimal     
      ; Check if the number is even or odd
      mov ah, 0           ; Clear AH
      mov bl, 2           
      div bl                                               
      cmp ah, 0           ; If AH (remainder) is 0, number is even
      je even         ; Jump to even_msg if remainder is 0 (even)    
      ; Display "The given number is odd" message
      lea dx, msg3
      mov ah, 09h
      int 21h
      jmp end_program     ; Skip even message                        
      ret
    check endp  
    
    even proc
      ; Display "The given number is even" message
      lea dx, msg2
      mov ah, 09h
      int 21h   
      ret
    even endp
     
end main
