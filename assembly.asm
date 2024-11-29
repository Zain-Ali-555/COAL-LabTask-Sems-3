.model small
.stack 100h
.data
.code
     main proc
     mov ax, 2
     add ax, 1
     mov dx, ax
     mov ax, 2
     int 21h
     mov ah, 4ch
     int 21h
     main endp
end main