include "emu8086.inc"
org 100h
 
    mov ah, 1h      ;instruction for taking input
    int 21h         ;taking input
    sub al, '0'     ;raw decimal value
    mov b.n, al    
    
    call newLine    ;for printing new line
    
    mov bx, 1       
    mov ah, 2h      ;instruction for giving output
    mov dl, '*'     
    
    outer_Loop:     ;outer loop start from here
        cmp bx, n   ;first checking the condition like while or for loop
        ja exit     
        mov cx, bx   
        
        inner_Loop: ;inner loop start here
            int 21h ;giving output            
        loop inner_loop ;loop until the cx became zero
        call newLine;for new line
        inc bx      ;increamenting same as for loop
    jmp outer_loop  ;unconditional jump to outer loop
    exit:           
ret

n dw 0              ;assiging a word size variable

newLine proc        
    print 10        ;printing new line
    print 13        
    ret
newLine endp        ;end of the procedure