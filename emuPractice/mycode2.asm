org 100h

mov ah,1h    

int 21h
sub al,'0'
mov bl,al     

int 21h
sub al,'0'
mov bh,al

add bl,bh
add bl,'0'


mov ah,2h

mov dl,10
int 21h
mov dl,13
int 21h

mov dl,bl
int 21h
ret


