.model small
.stack 100h
.data
 arr db 12h,37h,40h,17h,22h
 msg1 db " Search Unsuccessful$"
 msg2 db " Number found at position $"
 msg3 db "Key:$"
 
display macro msg
 mov dx,offset msg
 mov ah,09h
 int 21h
endm

.code
        mov ax,@data
        mov ds,ax

	display msg3

	mov ah,01h
	int 21h
	sub al,30h
	mov ah,00h
	mov dl,10h
	mul dl
	mov bl,al

	mov ah,01h
	int 21h
	sub al,30h
	add bl,al

	mov al,bl

	mov cl,05h
	mov si,0000h
L1:	cmp al,arr [si]
	jz L2
	add si,01
	loop L1
L2:	cmp si,05
	jz L3
	display msg2
	mov dx,si
	add dl,01h
	add dl,30h
	mov ah,02h
	int 21h
	jmp L4
L3:	display msg1

L4:	mov ah,4ch
	int 21h
	end
