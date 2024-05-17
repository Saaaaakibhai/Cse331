org 100h    

   mov ah,1h 
   
   int 21h
   sub al,'0'
   mov num[0],al   
   
   int 21h
   sub al,'0'
   mov num[1],al
   
   int 21h
   sub al,'0'
   mov num[2],al
   
   int 21h
   sub al,'0'
   mov num[3],al
   
   int 21h
   sub al,'0'
   mov num[4],al
   
   add bh,'0'
   add bh,num[0]
   add bh,num[1]
   add bh,num[2]
   add bh,num[3]
   add bh,num[4]
   
   mov ah,2h
   mov dl,10
   int 21h
   mov dl,13
   int 21h
   mov dl,bh
   int 21h
     
ret
num db 5 dup(?)  ;db 5 denote 5 
                 ;size of array and ? 
                 ;denote the random value 
                 ;that will take by user
