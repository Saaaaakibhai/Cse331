;S. M. Mahedi Hasan
;2112370042

include "emu8086.inc"     ; Including emu8086 library
org 100h                  ; Setting the origin to 100h

mov ah, 1h                ; Initialize input function
lea si, str1              ; Load address of str1 into SI
lea di, str2              ; Load address of str2 into DI
mov ch, 0                 ; Clear high byte of CX register
 
mov bl, 0                 ; Clear BL register (counter for str1)
mov bh, 0                 ; Clear BH register (counter for str2)

; Input characters to str1
input_str1:
    int 21h               ; Input character from keyboard
    cmp al, 13            ; Check for Enter key (carriage return)
    jz new_line_str1      ; If Enter key, jump to new_line_str1
    mov [si], al          ; Store character in str1
    inc si                ; Move to next position in str1
    inc bl                ; Increment counter for str1
    jmp input_str1        ; Repeat input loop

new_line_str1:            ; Print new line
    print 10              ; Print ASCII character for line feed
    print 13              ; Print ASCII character for carriage return

; Input characters to str2
input_str2:
    int 21h               ; Input character from keyboard
    cmp al, 13            ; Check for Enter key (carriage return)
    jz new_line_str2      ; If Enter key, jump to new_line_str2
    mov [di], al          ; Store character in str2
    inc di                ; Move to next position in str2
    inc bh                ; Increment counter for str2
    jmp input_str2        ; Repeat input loop

new_line_str2:            ; Print new line
    print 10              ; Print ASCII character for line feed
    print 13              ; Print ASCII character for carriage return
    lea si, str1          ; Load address of str1 into SI
    lea di, str2          ; Load address of str2 into DI

    ; Initialize CX register for loop
    mov ch, 0             ; Clear high byte of CX register
    mov cl, bl            ; Load CL register with length of str1
    jmp compare           ; Jump to start of comparison loop

compare:                  ; Compare characters of str1 and str2
    mov dh, [si]          ; Load character from str1 into DH
    mov dl, [di]          ; Load character from str2 into DL
    cmp dh, dl            ; Compare characters
    jne exit_label        ; If not equal, jump to exit_label
    loop compare          ; Repeat comparison until all characters are compared

print "Same"              ; Print "equal" if strings are equal
ret                       ; Return from the program

exit_label:               ; Label for exit if strings are not equal
print "Not Same"          ; Print "not equal"
ret                       ; Return from the program

str1 db 100 dup(?)        ; Declare str1 with maximum length of 100 characters
str2 db 100 dup(?)        ; Declare str2 with maximum length of 100 characters
