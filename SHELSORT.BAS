60 CLEAR 500: DEFINT I-N: CLS
70 READ N
80 PRINT"SHELL SORT OF"N"ELEMENTS. STANDBY . . ."
90 DIM A(N)
100 FOR I=1 TO N
110    READ A(I)
120 NEXT I
130 '
140 '
150 D = 1
160 D = 2*D: IF D<N THEN 160
170 D = INT((D-1)/2)
180 IF D=0 THEN 270
190 IT = N-D
200 FOR I=1 TO IT
210    J = I
220    L=J+D
230    IF A(L) < A(J) THEN TEMP=A(J):A(J)=A(L):A(L)=TEMP:J=J-D:IF J> 0 THEN 220
240 NEXT I
250 GOTO 170
260 END
270 '
280 '
290 PRINT: INPUT"PRESS 'ENTER' TO LIST SORTED ARRAY";A$
300 FOR I=1 TO N
310    PRINT A(I),
320 NEXT I
330 END
340 ' STORE NUMBER OF DATA ELEMENTS HERE
350 DATA 11
360 ' STORE ACTUAL DATA HERE
370 DATA 9.8,10.8,8.3,7.8,5.0,6.0,100.3,77,65,54,3.14
