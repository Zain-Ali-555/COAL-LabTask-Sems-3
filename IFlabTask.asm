TITLE  Compound IF Statements         (Regist.asm)

; Simple college registration example that uses
; the .IF, .ENDIF, and .ELSEIF directives.
; Last update: 1/28/02

INCLUDE Irvine32.inc

.data
    grade WORD ?
    marks WORD 81
    invalid_msg Word "Invalid Marks", 0
.code
    main PROC     
        
         .IF (marks >= 80) && (marks <= 100)
	        mov grade, 'A'
	     .ELSEIF (marks >= 70) 
	        mov grade, 'B'
	     .ELSEIF (marks >= 60)
	        mov grade, 'C'
	     .ELSEIF (marks >= 55)
	        mov grade, 'D'
	     .ELSEIF (marks >= 50)
	        mov grade, 'E'
	     .ELSEIF (marks < 50) && 
	        mov grade, 'F'   
	     .ElSE
	        jmp invalid
         .ENDIF  
         
         mov edx, grade
         call WriteChar         
         exit 
         
         invalid:
         lea edx, invalid_msg
         call WriteString
	     
	     exit 	 
   main ENDP  
end main

