org 100h
   mov ah,1h
   
   int 21h
   mov num[0],al;
 
   int 21h
   mov num[1],al;
   
   int 21h
   mov num[2],al;
   
   mov ah,2h 
   
   
   mov bh,num[0]
   mov dl,10
   int 21h
   mov dl,13
   int 21h
   mov dl,bh
   int 21h
   
     
   mov bh,num[1]
   mov dl,10
   int 21h
   mov dl,13
   int 21h
   mov dl,bh
   int 21h
   
      
   mov bh,num[2]
   mov dl,10
   int 21h
   mov dl,13
   int 21h
   mov dl,bh
   int 21h
    
   
ret 
num db 3 dup (?)
 
 