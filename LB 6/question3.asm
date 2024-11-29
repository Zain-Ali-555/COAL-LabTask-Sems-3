.model small
.stack 100h
.data 
.code
      main proc 
        mov cx, 26
        mov dx, 65  
        
        call print_Character       
      
        
        mov ah, 4ch
        int 21h
        
      main endp  
      
      print_Character proc 
        again:        
        mov ah, 2
        int 21h                    
        add dx, 1       
        loop again
        ret
      print_Character endp    
        
end main