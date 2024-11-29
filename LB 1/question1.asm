.model small   
.stack 100h
.data
      num1 dw '5' ;first number, dw = define word(16 bits)
      num2 dw '6' ;second number 
       
      msg1 db 'Before Swapping :   $'  
      str1 db 'Number 1 = $'
      msg2 db 'After swapping :   $' 
      str2 db 'Number 2 = $'
       
.code
     main proc     
        
        ;initialize data segment
        mov ax,@data
        mov ds,ax 
        
        ;Display message before swapping
        lea dx, msg1                    ;loads string 1 into dx
        mov ah, 09h                     ;service routine to display on screen
        int 21h  
        
        ;Display numbers before swapping
        lea dx, str1
        mov ah, 09h
        int 21h  
        
        mov dx, num1
        mov ah, 2
        int 21h   
        
        lea dx, str2
        mov ah, 09h
        int 21h 
        
        mov dx, num2
        mov ah, 2
        int 21h  
        
        ;Load the variables into registers
        mov ax, num1
        mov bx, num2
        
        ;swap values
        mov num1, bx
        mov num2, ax 
        
        ;Display message after swapping
        lea dx, msg2
        mov ah, 09h
        int 21h
        
        ;Display numbers after swapping
        lea dx, str1
        mov ah, 09h
        int 21h  
        
        mov dx, num1
        mov ah, 2
        int 21h
        
        lea dx, str2
        mov ah, 09h
        int 21h
        
        mov dx, num2
        mov ah, 2
        int 21h
        
        ;Exit program
        mov ah,4ch
        int 21h
        
        main endp
end main