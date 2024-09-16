                                                      
10 REM 99 Bottles of Beer                                       
20 CLEAR 1000:X=99:LY$="BOTTLE":LX$="BOTTLES":LZ$=" OF BEER ON T
HE WALL.":LV$="TAKE ONE DOWN AND PASS IT AROUND."               
30 PRINTX;LX$+LZ$;X;LX$+LEFT$(LZ$,8)                            
40 PRINTLV$:X=X-1                                               
50 IFX=1THENLX$=LY$                                             
60 IF X=0 : PRINT "NO MORE BOTTLES OF BEER ON THE WALL":END     
70 IFX=0THEN END ELSE 30  
