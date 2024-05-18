;S. M. Mahedi Hasan
;2112370042

include "emu8086.inc"
org 100h        

; Initialize input
mov ah, 1h          

; Input for the first string (str1)
lea si, string1     ; Load the address of string1
mov bl, 0           ; Initialize the counter for string1 length
input1:
    int 21h         ; Input character
    cmp al, 13      ; Check if Enter key (carriage return)
    jz new_line     ; If yes, go to new line
    mov [si], al    ; Store character in string1
    inc si          ; Move to the next position in string1
    inc bl          ; Increment the length counter for string1
    jmp input1      ; Repeat the input loop

new_line:
    print 10        ; Print new line character
    print 13        ; Print carriage return character

; Copy data from string1 to result_string for concatenation
lea di, result_string
lea si, string1  
mov cx, bx          ; Set the loop counter to the length of string1
initial_concat:
    mov al, [si]    ; Load a character from string1
    mov [di], al    ; Store the character in result_string
    inc si          ; Move to the next character in string1
    inc di          ; Move to the next position in result_string
    loop initial_concat ; Repeat until all characters of string1 are copied to result_string

; Input for the second string (str2)
lea si, string2     ; Load the address of string2
mov bl, 0           ; Reset the counter for string2 length
input2:  
    int 21h         ; Input character
    cmp al, 13      ; Check if Enter key (carriage return)
    jz new_line2    ; If yes, go to new line for input3
    mov [si], al    ; Store character in string2
    inc si          ; Move to the next position in string2
    inc bl          ; Increment the length counter for string2
    jmp input2      ; Repeat the input loop for string2

new_line2:
    print 10        ; Print new line character
    print 13        ; Print carriage return character

; Add a space after the last character of result_string for separation
mov [di], 32        ; Store a space character in result_string
inc di              ; Move to the next position in result_string

; Concatenate string2 to result_string
lea si, string2     ; Load the address of string2
mov cx, bx          ; Set the loop counter to the length of string2
concat_2:
    mov al, [si]    ; Load a character from string2
    mov [di], al    ; Store the character in result_string
    inc si          ; Move to the next character in string2
    inc di          ; Move to the next position in result_string
    loop concat_2   ; Repeat until all characters of string2 are copied to result_string

; Null-terminate result_string
mov [di], '$'      ; Null-terminate result_string

; Print result_string
mov ah, 09h        ; Print string function
lea dx, result_string ; Load the address of result_string
int 21h            ; Print result_string

ret

string1 db 50 dup(?) ; Declare string1 with a maximum length of 50 characters
string2 db 50 dup(?) ; Declare string2 with a maximum length of 50 characters
result_string db 100 dup(?) ; Declare result_string with a maximum length of 100 characters
