.model small   
.stack 100h
.data
       
.code
     main proc  
        
        mov al, 3 
        
        add al, 5 
        
        sub al, 2
        
        sub al, 1
        
        add al, 48
        
        mov dl, al
        mov ah, 2
        int 21h
        
        ;Exit program
        mov ah,4ch
        int 21h
        
        main endp
end main