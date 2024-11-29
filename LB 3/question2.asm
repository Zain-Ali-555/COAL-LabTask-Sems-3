; Find Average

.model small
.stack 100h
.data 
      numbers dw 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 
      
      sum dw 0 
      
      count dw 10 
      
      
.code
      main proc 
        mov ax, @data
        mov ds, ax  
        
        xor ax, ax         ; Clear AX (initialize sum to 0)
        xor bx, bx         ; Clear BX (BX will be used to store the average)
        xor si, si         ; Clear SI, SI will be used to index the array
        
        mov cx, count
        lea si, numbers
        
      again:        
        mov bx, [si]
        add ax, bx
        add si, 2       
        loop again 
        
        mov cx, count
        
        div cx 
        
        mov bx, ax   
        
        add bl, 48
        
        mov dl, bl
        mov ah, 2
        int 21h
        
        mov ah, 4ch
        int 21h
        
      main endp
end main
