.model small
.stack 100h
.data
msg1 db "num1 : $"
msg2 db "  num2 : $"
msg3 db "  ans : $"

.code
mov ax, @data
mov ds, ax

mov dx, offset msg1
mov ah, 09h
int 21h

mov ah,01h
int 21h
sub al,30H
mov bl,al

mov dx, offset msg2
mov ah, 09h
int 21h

mov ah,01h
int 21h
sub al,30H
add bl,al

mov dx, offset msg3
mov ah, 09h
int 21h

add bl,30H
mov dl,bl
mov ah, 02h
int 21h
mov ah, 4ch
int 21h
end
