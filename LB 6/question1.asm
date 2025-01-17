.model small
.stack 100h
.data
    original_string db 'Jaffar$'        ; Original string terminated with '$'
    
    msg_original db 'Original String: $'
    msg_reversed db 'Reversed String: $'  
    nextline db 13, 10, '$'

.code
    main proc   
        ; Initialize data segment
        mov ax, @data       
        mov ds, ax           
        call printOriginalString 
        call newLine             
        call reverseString           
        ; Exit program
        mov ah, 4Ch
        int 21h 
    main endp 
    
    printOriginalString proc
        ; Print the original string
        mov ah, 09h 
        lea dx, msg_original
        int 21h
        lea dx, original_string
        int 21h         
        ret             
    printOriginalString endp  
    
    newLine proc
        lea dx, nextline
        mov ah, 9
        int 21h          
        ret            
    newLine endp
    
    reverseString proc 
        ; Reverse the string using stack
        lea si, original_string    ; Load address of original string         
        mov cx, 6                 ; Set CX to the length of 'Jaffar$'
      push_loop: 
        mov bx, [si]               
        push bx                    ; Push the character onto the stack
        inc si                     
        loop push_loop                                                       
        mov ah, 09h
        lea dx, msg_reversed
        int 21h                                                              
        mov cx, 6                                                    
      pop_loop:
        pop dx                      ; Pop the character from the stack    
        mov ah, 02h
        int 21h                 
        loop pop_loop                                                        
        ret                                                                  
    reverseString endp

        
end main
