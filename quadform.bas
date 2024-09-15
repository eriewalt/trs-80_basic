                                                   
10 CLS:PRINT "FORMULA SOLVER"                                   
20 PRINT "(1) QUADRATIC FORMULA"                                
30 PRINT "(2) RLC PARALLEL RESPONSE CIRCUIT SOLVER"             
40 PRINT "(3) RLC SERIES RESPONSE CIRCUIT SOLVER"               
50 INPUT "ENTER CHOICE";C                                       
60 IF C<1 OR C>3 THEN GOTO 10                                   
70 ON C GOTO 80, 160,240                                        
80 CLS:PRINT "Quadratic Formula Solver"                         
90 I=0                                                          
100 INPUT "ENTER COEFFICIENT A";A                              
110 INPUT "ENTER COEFFICIENT B";B                               
120 INPUT "ENTER COEFFICENT C";C                                
130 GOSUB 310                                                   
140 IF I=0 THEN PRINT "ROOT1=";QA+P1;"ROOT2=";QA-P1:ELSE PRINT "
ROOT1=";QA;"+i*";P1;"ROOT2=";QA;"-i*";P1                        
150 END                                                         
160 PRINT "RLC PARALLEL RESPONSE CIRCUIT SOLVER"                
170 INPUT"ENTER RESISTOR VALUE";R                               
180 INPUT "ENTER INDUCTOR VALUE";L                              
190 INPUT "ENTER CAPACITOR VALUE";CA                            
200 A=1:B=1/(R*CA):C=1/(L*CA)                                                                             
210 GOSUB 310                                                   
220 GOSUB 370                                                   
230 END                                                         
240 PRINT "RLC SERIES RESPONSE CIRCUIT SOLVER"                  
250 INPUT "ENTER RESISTOR VALUE";R                              
260 INPUT "ENTER INDUCTOR VALUE";L                                                                
270 INPUT "ENTER CAPACITOR VALUE";CA                                                                                         
280 A=1:B=R/L:C=1/(L*CA):GOSUB 310                                                          
290 GOSUB 370                                               
300 END                                                         
310 QD=B*B-4*A*C                                                 
320 IF ( QD < 0 ) THEN PRINT "COMPLEX ROOTS!":QS=SQR(-1*QD):I=1 
330 TA=2*A                                                     
340 QA=-B/TA                                                    
350 P1=QS/TA                                                    
360 RETURN                                                       
370 IF I = 0 THEN PRINT "S1=";QA+P1;"S2=";QA-P1:ELSE PRINT "S1="
;QA;"+i*";P1;"S2=";QA;"-i*";P1:RETURN                           
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                            
                                                            
                                                        
                                                           
                                                       
