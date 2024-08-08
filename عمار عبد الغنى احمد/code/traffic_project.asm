
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;traffic_project.c,7 :: 		void interrupt(){
;traffic_project.c,9 :: 		if(INTF_BIT==1&&portb.b1==0){
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt2
	BTFSC      PORTB+0, 1
	GOTO       L_interrupt2
L__interrupt66:
;traffic_project.c,10 :: 		if(flag==0){leds_cond=portb;flag=1;}
	MOVF       _flag+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt3
	MOVF       PORTB+0, 0
	MOVWF      _leds_cond+0
	MOVLW      1
	MOVWF      _flag+0
L_interrupt3:
;traffic_project.c,11 :: 		portd.b6=portd.b7=1;
	BSF        PORTD+0, 7
	BTFSC      PORTD+0, 7
	GOTO       L__interrupt72
	BCF        PORTD+0, 6
	GOTO       L__interrupt73
L__interrupt72:
	BSF        PORTD+0, 6
L__interrupt73:
;traffic_project.c,12 :: 		portb.b5=portb.b6=portb.b7=0;
	BCF        PORTB+0, 7
	BTFSC      PORTB+0, 7
	GOTO       L__interrupt74
	BCF        PORTB+0, 6
	GOTO       L__interrupt75
L__interrupt74:
	BSF        PORTB+0, 6
L__interrupt75:
	BTFSC      PORTB+0, 6
	GOTO       L__interrupt76
	BCF        PORTB+0, 5
	GOTO       L__interrupt77
L__interrupt76:
	BSF        PORTB+0, 5
L__interrupt77:
;traffic_project.c,14 :: 		for(count=3;count>0;count--){
	MOVLW      3
	MOVWF      _count+0
L_interrupt4:
	MOVF       _count+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt5
;traffic_project.c,15 :: 		portb.b6=1;
	BSF        PORTB+0, 6
;traffic_project.c,16 :: 		portc=count;
	MOVF       _count+0, 0
	MOVWF      PORTC+0
;traffic_project.c,17 :: 		portc.b7=1;
	BSF        PORTC+0, 7
;traffic_project.c,18 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt7:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt7
	DECFSZ     R12+0, 1
	GOTO       L_interrupt7
	DECFSZ     R11+0, 1
	GOTO       L_interrupt7
	NOP
	NOP
;traffic_project.c,14 :: 		for(count=3;count>0;count--){
	DECF       _count+0, 1
;traffic_project.c,19 :: 		}
	GOTO       L_interrupt4
L_interrupt5:
;traffic_project.c,20 :: 		portb.b6=portb.b2=portb.b3=0;
	BCF        PORTB+0, 3
	BTFSC      PORTB+0, 3
	GOTO       L__interrupt78
	BCF        PORTB+0, 2
	GOTO       L__interrupt79
L__interrupt78:
	BSF        PORTB+0, 2
L__interrupt79:
	BTFSC      PORTB+0, 2
	GOTO       L__interrupt80
	BCF        PORTB+0, 6
	GOTO       L__interrupt81
L__interrupt80:
	BSF        PORTB+0, 6
L__interrupt81:
;traffic_project.c,21 :: 		portc.b6=portc.b7=portb.b4=portb.b5=1;
	BSF        PORTB+0, 5
	BTFSC      PORTB+0, 5
	GOTO       L__interrupt82
	BCF        PORTB+0, 4
	GOTO       L__interrupt83
L__interrupt82:
	BSF        PORTB+0, 4
L__interrupt83:
	BTFSC      PORTB+0, 4
	GOTO       L__interrupt84
	BCF        PORTC+0, 7
	GOTO       L__interrupt85
L__interrupt84:
	BSF        PORTC+0, 7
L__interrupt85:
	BTFSC      PORTC+0, 7
	GOTO       L__interrupt86
	BCF        PORTC+0, 6
	GOTO       L__interrupt87
L__interrupt86:
	BSF        PORTC+0, 6
L__interrupt87:
;traffic_project.c,23 :: 		while(portb.b0==1&&portb.b1==0){}
L_interrupt8:
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt9
	BTFSC      PORTB+0, 1
	GOTO       L_interrupt9
L__interrupt65:
	GOTO       L_interrupt8
L_interrupt9:
;traffic_project.c,24 :: 		if(portb.b1==1&&portb.b0==1){INTF_BIT=1;
	BTFSS      PORTB+0, 1
	GOTO       L_interrupt14
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt14
L__interrupt64:
	BSF        INTF_bit+0, BitPos(INTF_bit+0)
;traffic_project.c,25 :: 		}else{
	GOTO       L_interrupt15
L_interrupt14:
;traffic_project.c,26 :: 		portb=leds_cond;
	MOVF       _leds_cond+0, 0
	MOVWF      PORTB+0
;traffic_project.c,27 :: 		leds_cond=0;flag=0;
	CLRF       _leds_cond+0
	CLRF       _flag+0
;traffic_project.c,28 :: 		portc.b6=portd.b6=portd.b7=0;
	BCF        PORTD+0, 7
	BTFSC      PORTD+0, 7
	GOTO       L__interrupt88
	BCF        PORTD+0, 6
	GOTO       L__interrupt89
L__interrupt88:
	BSF        PORTD+0, 6
L__interrupt89:
	BTFSC      PORTD+0, 6
	GOTO       L__interrupt90
	BCF        PORTC+0, 6
	GOTO       L__interrupt91
L__interrupt90:
	BSF        PORTC+0, 6
L__interrupt91:
;traffic_project.c,29 :: 		INTF_BIT=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;traffic_project.c,30 :: 		}
L_interrupt15:
;traffic_project.c,33 :: 		}else if(INTF_BIT==1&&portb.b1==1){
	GOTO       L_interrupt16
L_interrupt2:
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt19
	BTFSS      PORTB+0, 1
	GOTO       L_interrupt19
L__interrupt63:
;traffic_project.c,35 :: 		if(flag==0){leds_cond=portb;flag=1;}
	MOVF       _flag+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt20
	MOVF       PORTB+0, 0
	MOVWF      _leds_cond+0
	MOVLW      1
	MOVWF      _flag+0
L_interrupt20:
;traffic_project.c,36 :: 		portc.b6=portc.b7=1;
	BSF        PORTC+0, 7
	BTFSC      PORTC+0, 7
	GOTO       L__interrupt92
	BCF        PORTC+0, 6
	GOTO       L__interrupt93
L__interrupt92:
	BSF        PORTC+0, 6
L__interrupt93:
;traffic_project.c,37 :: 		portb.b2=portb.b3=portb.b4=0;
	BCF        PORTB+0, 4
	BTFSC      PORTB+0, 4
	GOTO       L__interrupt94
	BCF        PORTB+0, 3
	GOTO       L__interrupt95
L__interrupt94:
	BSF        PORTB+0, 3
L__interrupt95:
	BTFSC      PORTB+0, 3
	GOTO       L__interrupt96
	BCF        PORTB+0, 2
	GOTO       L__interrupt97
L__interrupt96:
	BSF        PORTB+0, 2
L__interrupt97:
;traffic_project.c,39 :: 		for(count=3;count>0;count--){
	MOVLW      3
	MOVWF      _count+0
L_interrupt21:
	MOVF       _count+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt22
;traffic_project.c,40 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;traffic_project.c,41 :: 		portd=count;
	MOVF       _count+0, 0
	MOVWF      PORTD+0
;traffic_project.c,42 :: 		portd.b7=1 ;
	BSF        PORTD+0, 7
;traffic_project.c,43 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt24:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt24
	DECFSZ     R12+0, 1
	GOTO       L_interrupt24
	DECFSZ     R11+0, 1
	GOTO       L_interrupt24
	NOP
	NOP
;traffic_project.c,39 :: 		for(count=3;count>0;count--){
	DECF       _count+0, 1
;traffic_project.c,44 :: 		}
	GOTO       L_interrupt21
L_interrupt22:
;traffic_project.c,45 :: 		portb.b3=portb.b5=portb.b6=0;
	BCF        PORTB+0, 6
	BTFSC      PORTB+0, 6
	GOTO       L__interrupt98
	BCF        PORTB+0, 5
	GOTO       L__interrupt99
L__interrupt98:
	BSF        PORTB+0, 5
L__interrupt99:
	BTFSC      PORTB+0, 5
	GOTO       L__interrupt100
	BCF        PORTB+0, 3
	GOTO       L__interrupt101
L__interrupt100:
	BSF        PORTB+0, 3
L__interrupt101:
;traffic_project.c,46 :: 		portd.b6=portb.b2=portb.b7=1;
	BSF        PORTB+0, 7
	BTFSC      PORTB+0, 7
	GOTO       L__interrupt102
	BCF        PORTB+0, 2
	GOTO       L__interrupt103
L__interrupt102:
	BSF        PORTB+0, 2
L__interrupt103:
	BTFSC      PORTB+0, 2
	GOTO       L__interrupt104
	BCF        PORTD+0, 6
	GOTO       L__interrupt105
L__interrupt104:
	BSF        PORTD+0, 6
L__interrupt105:
;traffic_project.c,48 :: 		while(portb.b0==1&&portb.b1==1){}
L_interrupt25:
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt26
	BTFSS      PORTB+0, 1
	GOTO       L_interrupt26
L__interrupt62:
	GOTO       L_interrupt25
L_interrupt26:
;traffic_project.c,49 :: 		if(portb.b1==0&&portb.b0==1){INTF_BIT=1;
	BTFSC      PORTB+0, 1
	GOTO       L_interrupt31
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt31
L__interrupt61:
	BSF        INTF_bit+0, BitPos(INTF_bit+0)
;traffic_project.c,50 :: 		}else{
	GOTO       L_interrupt32
L_interrupt31:
;traffic_project.c,51 :: 		portb=leds_cond;
	MOVF       _leds_cond+0, 0
	MOVWF      PORTB+0
;traffic_project.c,52 :: 		leds_cond=0;flag=0;
	CLRF       _leds_cond+0
	CLRF       _flag+0
;traffic_project.c,53 :: 		portc.b6=portc.b7=portd.b6=portd.b7=0;
	BCF        PORTD+0, 7
	BTFSC      PORTD+0, 7
	GOTO       L__interrupt106
	BCF        PORTD+0, 6
	GOTO       L__interrupt107
L__interrupt106:
	BSF        PORTD+0, 6
L__interrupt107:
	BTFSC      PORTD+0, 6
	GOTO       L__interrupt108
	BCF        PORTC+0, 7
	GOTO       L__interrupt109
L__interrupt108:
	BSF        PORTC+0, 7
L__interrupt109:
	BTFSC      PORTC+0, 7
	GOTO       L__interrupt110
	BCF        PORTC+0, 6
	GOTO       L__interrupt111
L__interrupt110:
	BSF        PORTC+0, 6
L__interrupt111:
;traffic_project.c,54 :: 		INTF_BIT=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;traffic_project.c,55 :: 		}
L_interrupt32:
;traffic_project.c,56 :: 		}
L_interrupt19:
L_interrupt16:
;traffic_project.c,57 :: 		}
L_end_interrupt:
L__interrupt71:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;traffic_project.c,58 :: 		void main() {
;traffic_project.c,59 :: 		adcon1=0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;traffic_project.c,60 :: 		trisb=0b00000011;
	MOVLW      3
	MOVWF      TRISB+0
;traffic_project.c,61 :: 		trisc=trisd=trisa=trise=0;
	CLRF       TRISE+0
	MOVF       TRISE+0, 0
	MOVWF      TRISA+0
	MOVF       TRISA+0, 0
	MOVWF      TRISD+0
	MOVF       TRISD+0, 0
	MOVWF      TRISC+0
;traffic_project.c,62 :: 		portc=portd=porta=0;
	CLRF       PORTA+0
	MOVF       PORTA+0, 0
	MOVWF      PORTD+0
	MOVF       PORTD+0, 0
	MOVWF      PORTC+0
;traffic_project.c,63 :: 		GIE_BIT=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;traffic_project.c,64 :: 		INTE_BIT=1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;traffic_project.c,65 :: 		INTEDG_BIT=1;
	BSF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;traffic_project.c,67 :: 		for(;;){
L_main33:
;traffic_project.c,68 :: 		portb=0;
	CLRF       PORTB+0
;traffic_project.c,69 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;traffic_project.c,70 :: 		portb.B2=1;
	BSF        PORTB+0, 2
;traffic_project.c,71 :: 		porte=1;
	MOVLW      1
	MOVWF      PORTE+0
;traffic_project.c,72 :: 		porta=1;
	MOVLW      1
	MOVWF      PORTA+0
;traffic_project.c,74 :: 		for(seg1=5,seg3=8;seg1<12;seg1++,seg3++){
	MOVLW      5
	MOVWF      _seg1+0
	MOVLW      8
	MOVWF      _seg3+0
L_main36:
	MOVLW      12
	SUBWF      _seg1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main37
;traffic_project.c,75 :: 		if(seg1==11){seg1=1;porta--;}
	MOVF       _seg1+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_main39
	MOVLW      1
	MOVWF      _seg1+0
	DECF       PORTA+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTA+0
L_main39:
;traffic_project.c,76 :: 		if(seg3==11){seg3=1;porte--;}
	MOVF       _seg3+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_main40
	MOVLW      1
	MOVWF      _seg3+0
	DECF       PORTE+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTE+0
L_main40:
;traffic_project.c,77 :: 		if(seg1==7&&porta==0){
	MOVF       _seg1+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_main43
	MOVF       PORTA+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main43
L__main69:
;traffic_project.c,78 :: 		seg3=7;
	MOVLW      7
	MOVWF      _seg3+0
;traffic_project.c,79 :: 		portb.b7=0;
	BCF        PORTB+0, 7
;traffic_project.c,80 :: 		portb.b6=1;
	BSF        PORTB+0, 6
;traffic_project.c,81 :: 		}
L_main43:
;traffic_project.c,82 :: 		if(seg1==10&&porta==0){
	MOVF       _seg1+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main46
	MOVF       PORTA+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main46
L__main68:
;traffic_project.c,83 :: 		break;
	GOTO       L_main37
;traffic_project.c,84 :: 		}
L_main46:
;traffic_project.c,85 :: 		portd=10-seg1;
	MOVF       _seg1+0, 0
	SUBLW      10
	MOVWF      PORTD+0
;traffic_project.c,86 :: 		portc=10-seg3;
	MOVF       _seg3+0, 0
	SUBLW      10
	MOVWF      PORTC+0
;traffic_project.c,87 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main47:
	DECFSZ     R13+0, 1
	GOTO       L_main47
	DECFSZ     R12+0, 1
	GOTO       L_main47
	DECFSZ     R11+0, 1
	GOTO       L_main47
	NOP
	NOP
;traffic_project.c,74 :: 		for(seg1=5,seg3=8;seg1<12;seg1++,seg3++){
	INCF       _seg1+0, 1
	INCF       _seg3+0, 1
;traffic_project.c,88 :: 		}
	GOTO       L_main36
L_main37:
;traffic_project.c,90 :: 		seg1=seg3=0;
	CLRF       _seg3+0
	CLRF       _seg1+0
;traffic_project.c,92 :: 		portb.B5=1;
	BSF        PORTB+0, 5
;traffic_project.c,93 :: 		portb.b6=0 ;
	BCF        PORTB+0, 6
;traffic_project.c,94 :: 		portb.b2=0;
	BCF        PORTB+0, 2
;traffic_project.c,95 :: 		portb.b4=1;
	BSF        PORTB+0, 4
;traffic_project.c,96 :: 		porta=2;
	MOVLW      2
	MOVWF      PORTA+0
;traffic_project.c,97 :: 		porte=2;
	MOVLW      2
	MOVWF      PORTE+0
;traffic_project.c,99 :: 		for(seg1=10,seg3=7;seg1<12;seg1++,seg3++){
	MOVLW      10
	MOVWF      _seg1+0
	MOVLW      7
	MOVWF      _seg3+0
L_main48:
	MOVLW      12
	SUBWF      _seg1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main49
;traffic_project.c,100 :: 		if(seg1==11){seg1=1;porta--;}
	MOVF       _seg1+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_main51
	MOVLW      1
	MOVWF      _seg1+0
	DECF       PORTA+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTA+0
L_main51:
;traffic_project.c,101 :: 		if(seg3==11){seg3=1;porte--;}
	MOVF       _seg3+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_main52
	MOVLW      1
	MOVWF      _seg3+0
	DECF       PORTE+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTE+0
L_main52:
;traffic_project.c,102 :: 		portd=10-seg1;
	MOVF       _seg1+0, 0
	SUBLW      10
	MOVWF      PORTD+0
;traffic_project.c,103 :: 		portc=10-seg3;
	MOVF       _seg3+0, 0
	SUBLW      10
	MOVWF      PORTC+0
;traffic_project.c,104 :: 		if(seg1==10&&porta==0){
	MOVF       _seg1+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main55
	MOVF       PORTA+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main55
L__main67:
;traffic_project.c,105 :: 		break;
	GOTO       L_main49
;traffic_project.c,106 :: 		}
L_main55:
;traffic_project.c,107 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main56:
	DECFSZ     R13+0, 1
	GOTO       L_main56
	DECFSZ     R12+0, 1
	GOTO       L_main56
	DECFSZ     R11+0, 1
	GOTO       L_main56
	NOP
	NOP
;traffic_project.c,99 :: 		for(seg1=10,seg3=7;seg1<12;seg1++,seg3++){
	INCF       _seg1+0, 1
	INCF       _seg3+0, 1
;traffic_project.c,108 :: 		}
	GOTO       L_main48
L_main49:
;traffic_project.c,110 :: 		portb.b4=0;
	BCF        PORTB+0, 4
;traffic_project.c,111 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;traffic_project.c,112 :: 		porta=0;
	CLRF       PORTA+0
;traffic_project.c,113 :: 		for(seg1=7;seg1<10;seg1++,seg3++){
	MOVLW      7
	MOVWF      _seg1+0
L_main57:
	MOVLW      10
	SUBWF      _seg1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main58
;traffic_project.c,114 :: 		portd=10-seg1;
	MOVF       _seg1+0, 0
	SUBLW      10
	MOVWF      PORTD+0
;traffic_project.c,115 :: 		portc=10-seg3;
	MOVF       _seg3+0, 0
	SUBLW      10
	MOVWF      PORTC+0
;traffic_project.c,116 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main60:
	DECFSZ     R13+0, 1
	GOTO       L_main60
	DECFSZ     R12+0, 1
	GOTO       L_main60
	DECFSZ     R11+0, 1
	GOTO       L_main60
	NOP
	NOP
;traffic_project.c,113 :: 		for(seg1=7;seg1<10;seg1++,seg3++){
	INCF       _seg1+0, 1
	INCF       _seg3+0, 1
;traffic_project.c,117 :: 		}
	GOTO       L_main57
L_main58:
;traffic_project.c,118 :: 		}
	GOTO       L_main33
;traffic_project.c,119 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
