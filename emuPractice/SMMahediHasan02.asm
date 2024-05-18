;S. M. Mahedi Hasan
;2112370042

include "emu8086.inc"     ; Including the emu8086 library
org 100h                  ; Setting the origin to 100h

    mov ah, 1h            ; Initialize input function
    int 21h               ; Trigger interrupt to read a character from standard input
    sub al, '0'           ; Convert ASCII character to numeric value
    mov b.n, al           ; Store the numeric value of the input in variable n
    mov cx, n             ; Initialize CX with the value of n

    ; Print new line
    mov ah, 1h            ; Set AH to 1 for character output
    print 10              ; Print ASCII character for line feed
    print 13              ; Print ASCII character for carriage return

    ; Take input to the array
    lea si, arr           ; Load address of arr into SI
input_loop:               ; Input loop
        mov ah, 1h        ; Set AH to 1 for character input
        int 21h           ; Trigger interrupt to read a character from standard input
        mov [si], al      ; Store the input character in the array
        inc si            ; Move to the next position in the array
        loop input_loop   ; Repeat until CX becomes zero
        mov [si], '$'    ; Null-terminate the array

    ; Print new line
    print 10              ; Print ASCII character for line feed
    print 13              ; Print ASCII character for carriage return

    int 21h               ; Trigger interrupt to read a character from standard input
    mov key, al           ; Assign the input character to the variable key

    lea si, arr           ; Load address of arr into SI
    mov cx, n             ; Initialize CX with the value of n

search_loop:              ; Search loop
        mov al, [si]      ; Load a character from the array
        cmp key, al       ; Compare the character with the key
        je found_label    ; If they match, jump to found_label
        inc si            ; Move to the next character in the array
        loop search_loop  ; Repeat until CX becomes zero
        jmp not_found_label  ; If key is not found, jump to not_found_label

found_label:              ; Label if key is found
        ; Print new line
        print 10          ; Print ASCII character for line feed
        print 13          ; Print ASCII character for carriage return
        print "Found"     ; Print "Found"
        ret               ; Return from the program

not_found_label:          ; Label if key is not found
        ; Print new line
        print 10          ; Print ASCII character for line feed
        print 13          ; Print ASCII character for carriage return
        print "Not Found" ; Print "Not Found"
        ret               ; Return from the program

ret                       ; End of program
n dw 1 dup (?)            ; Declare variable n with 1 word of storage
arr db 100 dup(?)         ; Declare array arr with 100 bytes of storage
key db ?                  ; Declare variable key with 1 byte of storage
