include "emu8086.inc"
org 100h
    mov ah, 1h              ;instruction for taking input
    int 21h                 ;taking input
    sub al, '0'             
    mov cx, 0              
    mov cl, al              
    printing:
        call printString    ;calling procedure for printing string
    loop printing           ;loop until cx became zero
ret

printString proc            ;procedure for printing a string
    print 10                ;printing new line
    print 13                
    print "Hello World"     ;printing hello world
    ret
printString endp            ;end of the procedure