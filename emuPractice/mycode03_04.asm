org 100h
   
   lea si, s
   mov ah, 1h   ;insturtion call for input
   ;defining the body label
   work:
       int 21h
       ;exiting when enter is pressed
       cmp al ,13 ;it will work till we press enter 
       je done
       ;storing the input in the string accordingly 
       mov [si],al
       inc si
       ;calling the label
   jmp work
   ;defining the exit label
   done:
       ret 
       
       
s db 100 dup(?)
