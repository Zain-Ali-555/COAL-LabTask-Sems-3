.model samll
.stack 100h
.data
     num1 db ?
     num2 db ? 
     op   db ?
     msg1 db "Enter number 1 : $"
     msg2 db "Enter number 2 : $"
     msg3 db "Enter 1 for addition$"
     msg4 db "Enter 2 for subtraction$"
     msg5 db "Enter 3 for division$" 
     msg6 db "Result = $"
     newLine db 13, 10 , '$'   
.code  
     sum macro num1, num2
        mov al, num1
        add al, num2 
        add al, 48
        mov dl, al
        mov ah, 2
        int 21h
     endm  
     
     subtraction macro num1, num2
        mov al, num1
        sub al, num2
        add al, 48
        mov dl, al
        mov ah, 2
        int 21h
     endm  
     
     division macro num1, num2
        mov al, num1
        mov ah, 0
        mov bl, num2  
        div bl 
        add al, 48
        mov dl, al
        mov ah, 2
        int 21h
     endm        
     
     main proc
        mov ax, @data
        mov ds, ax
        call take_numbers 
        call take_op   
        
        cmp op, 1
        je add_nums
        cmp op, 2
        je sub_nums
        cmp op, 3
        je div_nums  
        
        add_nums:
        lea dx, msg6
        mov ah, 9
        int 21h
        sum num1, num2 
        jmp end_program
        
        sub_nums:
        lea dx, msg6
        mov ah, 9
        int 21h
        subtraction num1, num2
        jmp end_program
        
        div_nums:
        lea dx, msg6
        mov ah, 9
        int 21h
        division num1, num2      
       
        end_program:
        mov ah, 4ch
        int 21h 
     main endp
     
     take_numbers proc
        ;display prompt for number 1
        lea dx, msg1
        mov ah, 9
        int 21h        
        ;take user input
        mov ah, 1
        int 21h 
        mov num1, al 
        sub num1, 48  
        call next_line  
        
        ;display prompt for number 2
        lea dx, msg2
        mov ah, 9
        int 21h   
        ;take user input
        mov ah, 1
        int 21h 
        mov num2, al 
        sub num2, 48 
        call next_line  
        
        ret         
     take_numbers endp  
     
     take_op proc
        ;display menu
        lea dx, msg3
        mov ah, 9
        int 21h  
        call next_line  
        lea dx, msg4
        mov ah, 9
        int 21h  
        call next_line
        lea dx, msg5
        mov ah, 9
        int 21h 
        call next_line  
        
        ;take operator
        mov ah, 1
        int 21h 
        mov op, al 
        sub op, 48
        call next_line
        ret
     take_op endp
     
     next_line proc
        lea dx, newLine
        mov ah, 9
        int 21h   
        ret
     next_line endp
end main
     