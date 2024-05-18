;S. M. Mahedi Hasan
;2112370042

include "emu8086.inc"     ; Include emu8086 library
org 100h                  ; Set origin to 100h

mov ah, 1h                ; Initialize input function
lea si, str1              ; Load address of str1 into SI
mov ch, 0                 ; Clear high byte of CX register
 
mov bl, 0                 ; Clear BL register (counter for str1)

    input:                  ; Input characters to str1
        int 21h             ; Input character from keyboard
        cmp al, 13          ; Check for Enter key (carriage return)
        jz check            ; If Enter key, jump to check
        mov [si], al        ; Store character in str1
        inc si              ; Move to next position in str1
        inc bl              ; Increment counter for str1
        jmp input           ; Repeat input loop
       
   
    check:                  ; Check for end of input
        dec si              ; Move SI back to last character
        ;mov [si], 0       ; Null-terminate str1 (commented out)
        lea di, str2        ; Load address of str2 into DI
        mov ch, 0           ; Clear high byte of CX register
        mov cl, bl          ; Load CL register with length of str1
        jmp transfer        ; Jump to start transferring characters from str1 to str2
       
    transfer:               ; Transfer characters from str1 to str2 in reverse order
        mov al, [si]        ; Load character from str1 into AL
        mov [di], al        ; Store character in str2
        dec si              ; Move SI to previous character in str1
        inc di              ; Move DI to next position in str2
        ;mov ch, 0         ; Clear high byte of CX register (commented out)
        ;mov cl, bl        ; Load CL register with length of str1 (commented out)
        loop transfer       ; Repeat until all characters are transferred
       
   
    lea si, str1            ; Load address of str1 into SI
    lea di, str2            ; Load address of str2 into DI
    mov ch, 0               ; Clear high byte of CX register
    mov cl, bl              ; Load CL register with length of str1
    
    new_line:               ; Print new line
        print 10            ; Print ASCII character for line feed
        print 13            ; Print ASCII character for carriage return
        
    work:                   ; Compare characters of str1 and str2
        mov al, [si]        ; Load character from str1 into AL
        mov dl, [di]        ; Load character from str2 into DL
        cmp al, dl          ; Compare characters
        jne exit            ; If not equal, jump to exit
        inc si              ; Move SI to next character in str1
        inc di              ; Move DI to next character in str2
        loop work           ; Repeat until all characters are compared
       
    print "Yes"             ; Print "Yes" if strings are equal
    ret                      ; Return from the program
       
exit:                     ; Label for exit if strings are not equal
    print "No"            ; Print "No"
ret                       ; Return from the program

str1 db 100 dup(?)        ; Declare str1 with maximum length of 100 characters
str2 db 100 dup(?)        ; Declare str2 with maximum length of 100 characters
