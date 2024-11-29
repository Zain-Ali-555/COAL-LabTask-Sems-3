;macro

.model small
.stack 100h
.data         
     var1 db 1  
     var2 db 2
     var3 db 3  
.code  
      addition macro  var1, var2, var3
        mov al, var1
        mov bl, var2
        add al, bl
        mov bl, var3
        add al, bl    
        add al, 48
        
        mov dl, al
        mov ah, 2
        int 21h         
      add endm    
      
      main proc
        mov ax, @data
        mov ds, ax         
        addition var1, var2, var3 
              
        mov ah, 4ch
        int 21h
      main endp
        
        
end main