.model small   
.stack 100h
.data  
       num1 db 1
       num2 db 2
       num3 db 3
       
.code
     main proc  
        
        mov ax, @data
        mov ds, ax
        
        mov al, num1 
        mov bl, num2
        mov cl, num3
        
        add al, bl
        
        add al, cl
         
        add al, 48 
        
        mov dl, al
        mov ah, 2
        int 21h
        
        ;Exit program
        mov ah,4ch
        int 21h
        
        main endp
end main