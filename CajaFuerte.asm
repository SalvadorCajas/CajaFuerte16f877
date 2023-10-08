
_main:

;CajaFuerte.c,22 :: 		void main() {
;CajaFuerte.c,23 :: 		trisa = 0x0;
	CLRF       TRISA+0
;CajaFuerte.c,24 :: 		porta.b1=0;
	BCF        PORTA+0, 1
;CajaFuerte.c,26 :: 		ANSEL  = 0;                        // CONFIGURAR LOS PINES COMO SALIDAS DIGITALES
	CLRF       ANSEL+0
;CajaFuerte.c,27 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;CajaFuerte.c,28 :: 		C1ON_bit = 0;                      // DESACTIVAR LOS COMPARADORES
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;CajaFuerte.c,29 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;CajaFuerte.c,32 :: 		Lcd_Init();                        // FUNCIÓN QUE INICIALIZA EL LCD
	CALL       _Lcd_Init+0
;CajaFuerte.c,33 :: 		Keypad_Init();                     //Inicialización Keypad
	CALL       _Keypad_Init+0
;CajaFuerte.c,34 :: 		do{
L_main0:
;CajaFuerte.c,35 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CajaFuerte.c,36 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;CajaFuerte.c,37 :: 		texto="Control  Acceso";
	MOVLW      ?lstr1_CajaFuerte+0
	MOVWF      _texto+0
;CajaFuerte.c,38 :: 		Lcd_Out(1,1,texto);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _texto+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CajaFuerte.c,39 :: 		texto="PIC 16F887";
	MOVLW      ?lstr2_CajaFuerte+0
	MOVWF      _texto+0
;CajaFuerte.c,40 :: 		Lcd_Out(2,1,texto);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _texto+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CajaFuerte.c,41 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;CajaFuerte.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CajaFuerte.c,43 :: 		Lcd_Out(1,3, "Contrasena");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_CajaFuerte+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CajaFuerte.c,44 :: 		Lcd_Out(2,5," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_CajaFuerte+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CajaFuerte.c,46 :: 		do {
L_main5:
;CajaFuerte.c,47 :: 		kp = 0;                                // se reinicio el valor de la variable a 0
	CLRF       _kp+0
;CajaFuerte.c,48 :: 		do
L_main8:
;CajaFuerte.c,49 :: 		kp = Keypad_Key_Click();             // almacena la tecla presionada del keypad
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;CajaFuerte.c,50 :: 		while (!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
;CajaFuerte.c,51 :: 		codigo[contador]= kp;
	MOVF       _contador+0, 0
	MOVWF      R0+0
	MOVF       _contador+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _codigo+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
	MOVLW      0
	BTFSC      _kp+0, 7
	MOVLW      255
	INCF       FSR, 1
	MOVWF      INDF+0
;CajaFuerte.c,53 :: 		Lcd_Chr_CP("*");
	MOVLW      ?lstr_5_CajaFuerte+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;CajaFuerte.c,54 :: 		contador++;
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;CajaFuerte.c,55 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
;CajaFuerte.c,57 :: 		while(contador<3);
	MOVLW      128
	XORWF      _contador+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      3
	SUBWF      _contador+0, 0
L__main20:
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;CajaFuerte.c,59 :: 		if (codigo[0]==1 && codigo[1]==5 && codigo[2]==9){
	MOVLW      0
	XORWF      _codigo+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      1
	XORWF      _codigo+0, 0
L__main21:
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	MOVLW      0
	XORWF      _codigo+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      5
	XORWF      _codigo+2, 0
L__main22:
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	MOVLW      0
	XORWF      _codigo+5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      9
	XORWF      _codigo+4, 0
L__main23:
	BTFSS      STATUS+0, 2
	GOTO       L_main14
L__main18:
;CajaFuerte.c,60 :: 		porta.b1=1;
	BSF        PORTA+0, 1
;CajaFuerte.c,61 :: 		contador=0;
	CLRF       _contador+0
	CLRF       _contador+1
;CajaFuerte.c,62 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CajaFuerte.c,63 :: 		Lcd_Out(1,2,"Acceso Correcto");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_CajaFuerte+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CajaFuerte.c,64 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
	NOP
;CajaFuerte.c,65 :: 		porta.B1=0;
	BCF        PORTA+0, 1
;CajaFuerte.c,66 :: 		}
	GOTO       L_main16
L_main14:
;CajaFuerte.c,68 :: 		codigo[1]=0;
	CLRF       _codigo+2
	CLRF       _codigo+3
;CajaFuerte.c,69 :: 		codigo[2]=0;
	CLRF       _codigo+4
	CLRF       _codigo+5
;CajaFuerte.c,70 :: 		codigo[3]=0;
	CLRF       _codigo+6
	CLRF       _codigo+7
;CajaFuerte.c,71 :: 		contador=0;
	CLRF       _contador+0
	CLRF       _contador+1
;CajaFuerte.c,72 :: 		Lcd_Out(1,1,"contraseña incorrecta");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_CajaFuerte+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CajaFuerte.c,73 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
	NOP
;CajaFuerte.c,74 :: 		}//fin else
L_main16:
;CajaFuerte.c,76 :: 		}while(1);
	GOTO       L_main0
;CajaFuerte.c,77 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
