.model small   
.stack 100h
.data
      num1 db 2 ;first number, dw = define word(16 bits)
      num2 db 3 ;second number 
       
.code  
     multiply macro numx, numy
            ;Load the variables into registers
        mov al, num1
        mov bl, num2 
        
        mul bl  
        
        add al, 48
        
        mov dl, al
        mov ah, 2
        int 21h
     endm
     main proc     
        
        ;initialize data segment
        mov ax,@data
        mov ds,ax  
        
        multiply num1, num2
        
        ;Exit program
        mov ah,4ch
        int 21h
        
        main endp
end main