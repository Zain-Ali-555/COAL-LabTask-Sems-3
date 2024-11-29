include Irvine32.inc

.data
     multiplicand dword 10011b   ; M
     multiplier   dword 101b     ; Q
     accumulator  dword 0        ; A
     Q_1          dword 0        ; Q-1 bit
     count        dword 32       ; Counter for 32-bit multiplication
     result       dword ?        ; Final result

.code
     main proc    
         ; Initialize registers
         mov eax, 0          ; Clear accumulator
         mov ebx, multiplier ; Load multiplier
         mov ecx, count      ; Load counter
         mov edx, 0          ; Q_1 = 0

         multiply_loop:
               ; Check Q0 and Q_1
               mov esi, ebx       ; Copy multiplier to esi
               and esi, 1         ; Get Q0
               cmp esi, Q_1       ; Compare Q0 with Q_1
    
               ; Perform operations based on Q0Q_1
               je shift           ; If Q0Q_1 = 00 or 11, just shift
    
               cmp esi, 0         ; Check if Q0 = 0
               jne addition       ; If Q0 = 1, Q_1 = 0, then A = A + M
    
               ; Q0 = 0, Q_1 = 1, then A = A - M
               sub eax, multiplicand
               jmp shift
    
               addition:
                    add eax, multiplicand
    
               shift:
                    ; Arithmetic right shift of A:Q:Q_1
                    mov Q_1, ebx      ; Save LSB of Q as next Q_1
                    and Q_1, 1
    
                    shr ebx, 1        ; Shift right Q
                    rcr eax, 1        ; Shift right A with carry
    
               loop multiply_loop
    
        ; Store result
        mov result, eax
    
        ; Display result
        call WriteInt
        call Crlf
    
        exit
    main endp
end main
