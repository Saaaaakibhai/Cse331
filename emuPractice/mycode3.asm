org 100h

      mov ah,1h
      
      int 21h
      mov var,al
      
      mov ah,2h
      mov dl,var
      int 21h
      
      ret 
      
      var equ '5' 