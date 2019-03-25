.model small

.data

arr1 db 6, 5, 8, 3, 9, 2, 7, 4

len1 equ $-arr1

.code

mov ax, @data
mov ds, ax
mov ch, len1-1

a1:
mov cl, ch
lea si, arr1

rept1:
mov al, [si]
inc si
cmp al, [si]
jbe next1
xchg al, [si]
mov [si-1], al

next1:
dec cl
jnz rept1
dec ch
jnz a1

mov cx, len1-1
lea si, arr1
mov dl, [si]
add dl, 30h
mov ah, 02h
int 21h
inc si

print:

mov dl, 2ch
mov ah, 02h
int 21h

mov dl, 20h
mov ah, 02h
int 21h

mov dl, [si]
add dl, 30h
inc si
mov ah, 02h
int 21h

loop print


mov ah, 4ch
int 21h
end
