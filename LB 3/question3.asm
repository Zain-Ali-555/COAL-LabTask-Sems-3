.model small
.stack 100h
.data 
.code
      main proc 
        mov cx, 26
        mov dx, 97
        
      again:        
        mov ah, 2
        int 21h
        
        add dx, 1
        
        loop again
        
        mov ah, 4ch
        int 21h
        
      main endp
end main