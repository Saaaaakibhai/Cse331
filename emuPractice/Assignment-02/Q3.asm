include "emu8086.inc"
org 100h
    mov ah, 1h      ;instruction for taking input
    int 21h         ;taking input
    sub al, '0'     
    mov bh, al      
    
    call newLine    ;calling procedure for printing new line
    
    int 21h         ;taking another input
    sub al, '0'     ;decimal raw
    mov bl, al      ;storing it on bl register
    
    call newLine    
    call addTwoNumbers  
    
    mov ah, 2h      ;instruction for giving output
    int 21h         ;giving output
ret

newLine proc        ;procedure for printing new line
    print 10        
    print 13       
    ret
newLine endp        ;end of the procedure

addTwoNumbers proc  ;procedure for adding two numbers
    mov dh, 0       
    add dh, bh      
    add dh, bl      
    add dh, '0'     
    mov dl, dh      ;moving the sum to output register
    ret
addTwoNumbers endp  ;end of the procedure