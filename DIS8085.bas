10 '8085 DISASSEMBLER WRITTEN BY WALTER E. FLES
20 CLEAR1000:GOSUB 700:CLS:INPUT "Enter starting address for disassembly";ST$:
25 ST$=STRING$(4-LEN(ST$),48)+ST$:ST=FNHI(ST$)
27 PRINT "To stop disassembly, press break."
28 PRINT STRING$(5,13):PRINT "Press any key when ready.";
30 IF INKEY$=""THEN 30 ELSE CLS:T0$=CHR$(200):T1$=CHR$(201):T2$=CHR$(202)
40 GOSUB 50:PRINT OU$:IFPEEK(14331)=63 LPRINT OU$:GOTO 40:ELSE 40
50 OU$=FNIH$(ST)+T2$:B=PEEK(ST):ST=ST+1:OT$="":GOSUB70:OU$=OU$+OT$:RETURN
60 'DATA TRANSFER GROUP
70 IF (BAND192)=64 THENOT$="MOV"+T2$+RG$((BAND56)/8)+","+RG$(BAND7):RETURN
80 IF (BAND199)=6 THEN OT$="MVI"+T2$+RG$((BAND56)/B)+","+FNDH$(PEEK(ST))+"H":ST=ST+1:RETURN
90 IF (BAND207)=1 THEN OT$="LXI"+T2$+RP$((BAND48)/16)+","+FNST$(ST):ST=ST+2:RETURN
100 IFB=58 THEN OT$="LDA"+T2$+FNST$(ST):ST=ST+2:RETURN
110 IF B=50 THEN OT$="STA"+T2$+FNST$(ST):ST=ST+2:RETURN
120 IF B=42 THENOT$="LHLD"+T1$+FNST$(ST):ST=ST+2:RETURN
130 IF B=34THENOT$="SHLD"+T1$+FNST$(ST):ST=ST+2:RETURN
140 IF(BAND207)=10THEN OT$="LDAX"+T1$+RP$((BAND48)/16):RETURN
150 IF(BAND207)=2THEN OT$="STAX"+T1$+RP$((BAND48)/16):RETURN
160 IFB=235 THEN OT$="XCHG":RETURN
170 'Arithmetic Group
180 IF (BAND248)=128 THEN OT$="ADD"+T2$+RG$(BAND7):RETURN
190 IF B=198 THEN OT$="ADI"+T2$+FNDH$(PEEK(ST))+"H":ST=ST+1:RETURN
200 IF (BAND248)=136 THEN OT$="ADC"+T2$+RG$(BAND7):RETURN
210 IF B=206 THEN OT$="ACI"+T2$+FNDH(PEEK(ST))+"H":ST=ST+1:RETURN
220 IF (BAND248)=144 THEN OT$="SUB"+T2$+RG$(BAND7):RETURN
230 IF B = 214 THEN OT$="SUI"+T2$+FNDH$(PEEK(ST))+"H":ST=ST+1:RETURN
240 IF ( B AND 248)=152 THEN OT$="SBB"+T2$+REG$(BAND7):RETURN
250 IF B = 222 THEN OT$="SBI"+T2$+FNDH$(PEEK(ST))+"H":ST=ST+1:RETURN
260 IF ( B AND 199) = 4 THEN OT$="INR" + T2$ + RG$((BAND56)/8):RETURN
270 IF ( B AND 199 ) = 5 THEN OT$="DCR" + T2$ +RG$((BAND56)/8):RETURN
280 IF (B AND 207) = 3 THEN OT$="INX" + T2$ + RP$((BAND48)/16):RETURN
290 IF (B AND 207) = 11 THEN OT$="DCX" + T2$ + RP$((BAND48)/16):RETURN
300 IF ( B AND 207) = 9 THEN OT$="DAD" + T2$ + RP$((BAND48)/16):RETURN
310 IF B=39 THEN OT$="DAA":RETURN
320 'Logical Group
330 IF ( B AND 248) = 160 THEN OT$="ANA" + T2$ + RG$(BAND7):RETURN
340 IF B = 230 THEN OT$="ANI" + T2$ + FNDH$(PEEK(ST))+"H:ST=ST+1:RETURN
350 IF (B AND 248) = 168 THEN OT$="XRA" + T2$ + RG$(B AND 7):RETURN
360 IF B = 238 THEN OT$="XRI" + T2$ + FNDH$(PEEK(ST))"+H":ST=ST+1:RETURN
370 IF ( B AND 248) = 176 THEN OT$="ORA" + T2$ + RG$(BAND7):RETURN
380 IF B = 246 THEN OT$="ORI"+T2$+FNDH$(PEEK(ST))+"H":ST=ST+1:RETURN
390 IF ( B AND 248) = 184 THEN OT$="CMP" + T2$ + RG$(BAND7):RETURN
400 IF B = 254 THEN OT$="CPI"+T2$+FNDH$(PEEK(ST))+"H":ST=ST+1:RETURN
410 IFB=254 THEN OT$="RLC":RETURN
420 IF B=15 THEN OT$="RRC":RETURN
430 IF B=23 THEN OT$="RAL":RETURN
440 IF B=31 THEN OT$="RAR":RETURN
450 IF B=47 THEN OT$="CMA":RETURN
460 IF B=63 THEN OT$="CMC":RETURN
470 IFB=55 THEN OT$=:SRC":RETURN
480 'Branch Group
490 IFB=195 THEN OT$="JMP"+T2$+FNST$(ST):ST=ST+2:RETURN
500 IF (BAND199)=194 THEN OT$="J"+CC$((BAND56)/8)+T2$+FNST$(ST):ST=ST+2:RETURN
510 IF B=205 THEN OT$="CALL"+T1$+FNST$(ST):ST=ST+2:RETURN
520 IF (BAND199)=196THEN OT$="C"+CC$((BAND56)/8)+T2$+FNST$(ST):ST=ST+2:RETURN
530 IF B=201 THEN OT$="RET":RETURN
540 IF (BAND199)=192 THEN OT$="R"+CC$((BAND56)/8):RETURN
550 IF (BAND199)=199 THEN OT$="RST"+T2$+FBDH$((BAND56)/8):RETURN
560 IFB=233 THEN OT$="PCHL":RETURN
570 IF (BAND207)=197 THEN OT$="PUSH"+T1$:IF (BAND48)/16 = 3 THEN OT=OT$+"PSW":RETURN ELSE OT$=OT$+RP$((BAND48)/16):RETURN
580 IF(BAND207)=193 THEN OT$="POP"+T2$:IF (BAND48)/16=3 THEN OT$=OT$+"PSW":RETURN ELSE OT$=OT$+RP$((BAND48)/16):RETURN
590 IF B=227 THENOT$="XTHL":RETURN
600 IF B=249 THEN OT$="SPHL":RETURN
610 IFB=219 THEN OT$="IN "+T2$+FNDH$(PEEK(ST))+"H":ST=ST+1:RETURN
620 IF B=211 THEN OT$="OUT"+T2$+FNDH$(PEEK(ST))+"H":ST=ST+1:RETURN
630 IF B=251 THEN OT$="EI":RETURN
640 IF B=243 THEN OT$="DI":RETURN
650 IF B=118 THEN OT$="HLT":RETURN
660 IF B=0 THEN OT$="NOP":RETURN
670 IF B=32 THEN OT$="RIM":RETURN
680 IF B=48 THEN OT$="SIM":RETURN
690 OT$=FNDH$(B) + "        ??" : RETURN
700 HS$="0123456789ABCDEF":DEFFNIS(X)=X-65536*(X<0)
710 DEFFNSI(X)=X+65536*(X>32767)
720 DEFFNHD(A$)=(INSTR(HS$,MID$(A$,1,1))-1)*16+INSTR(HS$,MID$(A$,2,1))-1
730 DEFFNHI(A$)=FNSI(FNHD(MID$(A$,1,2))*256+FNHD(MID$(A$,3,2)))
740 DEFFNDH$(X)=MID$(HS$,INT(X/16)+1,1)+MID$(HS$,(X-INT(X/16)*16)+1,1)
750 DEFFNIH$(X)=FNDH$(FNIS(X)/256)+FNDH$(FNIS(X)-INT(FNIS(X)/256)*256)
760 DEFFNST$(X)=FNIH$(PEEK(X)+PEEK(X+1)*256)+"H"
770 FOR X = 0 TO 7:READ RG$(X):NEXT:DATA A,B,C,D,E,H,L,M,A
780 FOR X = 0 TO 3:READ RP$(X):NEXT:DATA B,D,H,SP
790 FOR X = 0 TO 7:READ CC$(X):NEXT:DATA NZ, Z , NC,C ,PO,PE,P ,M
800 RETURN
