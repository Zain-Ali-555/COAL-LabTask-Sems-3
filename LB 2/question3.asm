.model small   
.stack 100h
.data         
       msg db ' is the average of the numbers 3,4,5,3,5 $'
       
.code
     main proc      
        
        ;Initialize data segment
        mov ax, @data
        mov ds, ax  
        
        ;load 3 in al      
        mov ax, 3          
        
        ;adding
        add ax, 4        
        add ax, 5         
        add ax, 3
        add ax, 5
        
        ;set bl to 5(number of items)
        mov bx, 5  
        
        ;calculate average
        div bx
        
        add ax, 48
        
        mov dx, ax
        mov ah, 2
        int 21h
        
        lea dx, msg
        mov ah, 09h
        int 21h
        
        ;Exit program
        mov ah,4ch
        int 21h
        
        main endp
end main