org 100h
    
    ;taking first input
    
    mov ah,1h
    int 21h
    sub al,'0'
    mov bl,al
    
    ;take second input
    
    int 21h
    sub al,'0'
    mov bh,al
    
    ;take third input
    int 21h
    sub al,'0'
    mov dh,al
    
    ;bl=bl+bh
    add bl,bh
    add bl,'0'
    
    ;bh=bh-dh
    sub bh,dh
    add bh,'0'
    
    
    ;instruction for output-1
    mov ah, 2h  
    
    ;printing new line
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
         
    ;printing the output-1
    mov dl, bl
    int 21h 
    ;printing the output-2    
    mov dl, bh
    int 21h 
    
ret 