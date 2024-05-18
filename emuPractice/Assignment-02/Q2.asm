include "emu8086.inc"
org 100h             


    ;taking input  
    mov ah, 1h      ;instruction for taking input
    int 21h         ;taking input  
    
    
    ;get ready for output
    mov ah, 2h      ;instruction for giving output
    mov dl, al      ;moving the content to output register  
    
    
    ;get ready for running loop
    sub al, '0'     ;decimal raw value
    mov ch, 0       ;making sure that entire cx is 0
    mov cl, al     
    
    print 10        ;printing new line
    print 13        
    
    print:
        int 21h     ;giving output
    loop print      
  
ret 