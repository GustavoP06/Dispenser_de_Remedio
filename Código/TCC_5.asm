
_interrupt:

;TCC_5.c,169 :: 		void interrupt()                          //interrupção
;TCC_5.c,171 :: 		if(TMR1IF_bit)                       //overflow em 100ms
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt0
;TCC_5.c,173 :: 		TMR1IF_bit  =  0x00;                //zera flag do timer1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;TCC_5.c,174 :: 		TMR1H       =  0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;TCC_5.c,175 :: 		TMR1L       =  0xB0;                //seta timer1 em 15536
	MOVLW       176
	MOVWF       TMR1L+0 
;TCC_5.c,176 :: 		temp_led++;                         //incrementa temp_led
	INFSNZ      _temp_led+0, 1 
	INCF        _temp_led+1, 1 
;TCC_5.c,177 :: 		temp_led2++;                        //incrementa temp_led2
	INFSNZ      _temp_led2+0, 1 
	INCF        _temp_led2+1, 1 
;TCC_5.c,178 :: 		temp_led3++;                        //incrementa temp_led3
	INFSNZ      _temp_led3+0, 1 
	INCF        _temp_led3+1, 1 
;TCC_5.c,179 :: 		temp_led4++;                        //incrementa temp_led4
	INFSNZ      _temp_led4+0, 1 
	INCF        _temp_led4+1, 1 
;TCC_5.c,180 :: 		temp_led5++;                        //incrementa temp_led5
	INFSNZ      _temp_led5+0, 1 
	INCF        _temp_led5+1, 1 
;TCC_5.c,181 :: 		temp_disp++;                        //incrementa temp_disp
	INFSNZ      _temp_disp+0, 1 
	INCF        _temp_disp+1, 1 
;TCC_5.c,182 :: 		temp_som++;                         //incrementa temp_som
	INFSNZ      _temp_som+0, 1 
	INCF        _temp_som+1, 1 
;TCC_5.c,183 :: 		temp_inc++;                         //incrementa temp_inc
	INFSNZ      _temp_inc+0, 1 
	INCF        _temp_inc+1, 1 
;TCC_5.c,184 :: 		temp_num++;                         //icrementa temp_num
	INFSNZ      _temp_num+0, 1 
	INCF        _temp_num+1, 1 
;TCC_5.c,185 :: 		}
L_interrupt0:
;TCC_5.c,187 :: 		if(TMR0IF_bit)                        //overflow em 100ms overflow
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt1
;TCC_5.c,189 :: 		TMR0IF_bit =  0x00;                  //zera flag do timer0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;TCC_5.c,190 :: 		TMR0H      =  0x3C;
	MOVLW       60
	MOVWF       TMR0H+0 
;TCC_5.c,191 :: 		TMR0L      =  0xB0;                  //seta timer0 em 15536
	MOVLW       176
	MOVWF       TMR0L+0 
;TCC_5.c,192 :: 		temp++;                              //incrementa temp
	INFSNZ      _temp+0, 1 
	INCF        _temp+1, 1 
;TCC_5.c,193 :: 		temp2++;                             //incrementa temp2
	INFSNZ      _temp2+0, 1 
	INCF        _temp2+1, 1 
;TCC_5.c,194 :: 		temp3++;                             //incrementa temp3
	INFSNZ      _temp3+0, 1 
	INCF        _temp3+1, 1 
;TCC_5.c,195 :: 		temp4++;                             //incrementa temp4
	INFSNZ      _temp4+0, 1 
	INCF        _temp4+1, 1 
;TCC_5.c,197 :: 		}                                     //end if TMR0IF
L_interrupt1:
;TCC_5.c,201 :: 		piscaLED();                           //executa piscaLED
	CALL        _piscaLED+0, 0
;TCC_5.c,202 :: 		timebase();                           //executa timebase
	CALL        _timebase+0, 0
;TCC_5.c,203 :: 		timebase2();                          //executa timebase2
	CALL        _timebase2+0, 0
;TCC_5.c,204 :: 		timebase3();                          //executa timebase3
	CALL        _timebase3+0, 0
;TCC_5.c,205 :: 		timebase4();                          //executa timebase4
	CALL        _timebase4+0, 0
;TCC_5.c,208 :: 		}                                          //end interrupt()
L_end_interrupt:
L__interrupt424:
	RETFIE      1
; end of _interrupt

_main:

;TCC_5.c,214 :: 		void main (void)
;TCC_5.c,219 :: 		ADCON1        =   0x0F;                   //Define os pinos como digital
	MOVLW       15
	MOVWF       ADCON1+0 
;TCC_5.c,220 :: 		CMCON         =   0x07;                   //Desativa os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;TCC_5.c,222 :: 		TMR0H         =   0x3C;
	MOVLW       60
	MOVWF       TMR0H+0 
;TCC_5.c,223 :: 		TMR0L         =   0xB0;                   //Inicia timer0 em 15536
	MOVLW       176
	MOVWF       TMR0L+0 
;TCC_5.c,224 :: 		TMR1H         =   0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;TCC_5.c,225 :: 		TMR1L         =   0xB0;                   //Inicia TMR1 em 15536
	MOVLW       176
	MOVWF       TMR1L+0 
;TCC_5.c,228 :: 		INTCON.GIE    =   0x01;                   //Ativa interrupção global
	BSF         INTCON+0, 7 
;TCC_5.c,229 :: 		INTCON.PEIE   =   0x01;                   //Ativa interrupção por periféricos
	BSF         INTCON+0, 6 
;TCC_5.c,230 :: 		INTCON.TMR0IE =   0x01;                   //Ativa interrupção por overflow
	BSF         INTCON+0, 5 
;TCC_5.c,232 :: 		TMR0IF_bit    =   0x00;                   //zera a flag do timer0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;TCC_5.c,233 :: 		TMR1IF_bit    =   0x00;                   //zera a flag do timer1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;TCC_5.c,236 :: 		INTCON2.RBPU  =   0x01;                   //Desliga os resistores de pull-ups do portB
	BSF         INTCON2+0, 7 
;TCC_5.c,237 :: 		T0CON         =   0x81;                   //TMR0 16 bits, prescaler 1:4
	MOVLW       129
	MOVWF       T0CON+0 
;TCC_5.c,238 :: 		T1CON         =   0xA1;                   //TMR1 16 bits, prescaler 1:4
	MOVLW       161
	MOVWF       T1CON+0 
;TCC_5.c,241 :: 		ligar         =   0x00;                   //     |
	BCF         _ligar+0, BitPos(_ligar+0) 
;TCC_5.c,242 :: 		b1_flag       =   0x00;                   //     |
	BCF         _b1_flag+0, BitPos(_b1_flag+0) 
;TCC_5.c,243 :: 		b2_flag       =   0x00;                   //     |
	BCF         _b2_flag+0, BitPos(_b2_flag+0) 
;TCC_5.c,244 :: 		b3_flag       =   0x00;                   //     |
	BCF         _b3_flag+0, BitPos(_b3_flag+0) 
;TCC_5.c,245 :: 		b4_flag       =   0x00;                   //     |
	BCF         _b4_flag+0, BitPos(_b4_flag+0) 
;TCC_5.c,246 :: 		b5_flag       =   0x00;                   //     |
	BCF         _b5_flag+0, BitPos(_b5_flag+0) 
;TCC_5.c,247 :: 		display       =   0x00;                   //     |
	BCF         _display+0, BitPos(_display+0) 
;TCC_5.c,248 :: 		fast_inc      =   0x00;                   //     |
	BCF         _fast_inc+0, BitPos(_fast_inc+0) 
;TCC_5.c,249 :: 		toque         =   0x00;                   //     |
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,250 :: 		toque2        =   0x00;                   //     |
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,251 :: 		toque3        =   0x00;                   //     |
	BCF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,252 :: 		toque4        =   0x00;                   //     |
	BCF         _toque4+0, BitPos(_toque4+0) 
;TCC_5.c,253 :: 		open_bit      =   0x00;                   //     |
	BCF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,254 :: 		open_bit2     =   0x00;                   //     |
	BCF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,255 :: 		open_bit3     =   0x00;                   //     |
	BCF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,256 :: 		open_bit4     =   0x00;                   //     |
	BCF         _open_bit4+0, BitPos(_open_bit4+0) 
;TCC_5.c,257 :: 		close_bit     =   0x00;                   //     |
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,258 :: 		close_bit2    =   0x00;                   //     |
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,259 :: 		close_bit3    =   0x00;                   //     |
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,260 :: 		close_bit4    =   0x00;                   //     |
	BCF         _close_bit4+0, BitPos(_close_bit4+0) 
;TCC_5.c,261 :: 		atv_mot       =   0x00;                   //     |
	BCF         _atv_mot+0, BitPos(_atv_mot+0) 
;TCC_5.c,262 :: 		atv_mot2      =   0x00;                   //     |
	BCF         _atv_mot2+0, BitPos(_atv_mot2+0) 
;TCC_5.c,263 :: 		atv_mot3      =   0x00;                   //     |
	BCF         _atv_mot3+0, BitPos(_atv_mot3+0) 
;TCC_5.c,264 :: 		atv_mot4      =   0x00;                   //    \ /
	BCF         _atv_mot4+0, BitPos(_atv_mot4+0) 
;TCC_5.c,266 :: 		SM            =   0x00;                   //zerando todos os bits
	BCF         PORTA+0, 1 
;TCC_5.c,267 :: 		SM2           =   0x00;
	BCF         PORTA+0, 4 
;TCC_5.c,268 :: 		SM3           =   0x00;
	BCF         PORTA+0, 5 
;TCC_5.c,269 :: 		SM4           =   0x00;
	BCF         PORTB+0, 2 
;TCC_5.c,271 :: 		num           =   EEPROM_Read(0x01);      //lê os dados da EEPROM para variável num
	MOVLW       1
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVLW       0
	MOVWF       _num+1 
;TCC_5.c,272 :: 		un            =   EEPROM_Read(0x03);      //lê os dados da EEPROM para variável un
	MOVLW       3
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main426
	BCF         _un+0, BitPos(_un+0) 
	GOTO        L__main427
L__main426:
	BSF         _un+0, BitPos(_un+0) 
L__main427:
;TCC_5.c,273 :: 		num2          =   EEPROM_Read(0x02);      //lê os dados da EEPROM para variável num2
	MOVLW       2
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num2+0 
	MOVLW       0
	MOVWF       _num2+1 
;TCC_5.c,274 :: 		un2           =   EEPROM_Read(0x04);      //lê os dados da EEPROM para variável un2
	MOVLW       4
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main428
	BCF         _un2+0, BitPos(_un2+0) 
	GOTO        L__main429
L__main428:
	BSF         _un2+0, BitPos(_un2+0) 
L__main429:
;TCC_5.c,275 :: 		num3          =   EEPROM_Read(0x05);      //lê os dados da EEPROM para variável num3
	MOVLW       5
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num3+0 
	MOVLW       0
	MOVWF       _num3+1 
;TCC_5.c,276 :: 		un3           =   EEPROM_Read(0x06);      //lê os dados da EEPROM para variável un3
	MOVLW       6
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main430
	BCF         _un3+0, BitPos(_un3+0) 
	GOTO        L__main431
L__main430:
	BSF         _un3+0, BitPos(_un3+0) 
L__main431:
;TCC_5.c,277 :: 		num4          =   EEPROM_Read(0x07);      //lê os dados da EEPROM para variável num4
	MOVLW       7
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num4+0 
	MOVLW       0
	MOVWF       _num4+1 
;TCC_5.c,278 :: 		un4           =   EEPROM_Read(0x08);      //lê os dados da EEPROM para variável un4
	MOVLW       8
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main432
	BCF         _un4+0, BitPos(_un4+0) 
	GOTO        L__main433
L__main432:
	BSF         _un4+0, BitPos(_un4+0) 
L__main433:
;TCC_5.c,279 :: 		qtd_comp      =   EEPROM_Read(0x09);      //lê os dados da EEPROM para variavel qtd_comp
	MOVLW       9
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _qtd_comp+0 
	MOVLW       0
	MOVWF       _qtd_comp+1 
;TCC_5.c,280 :: 		qtd_comp2     =   EEPROM_Read(0x0A);      //lê os dados da EEPROM para variavel qtd_comp2
	MOVLW       10
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _qtd_comp2+0 
	MOVLW       0
	MOVWF       _qtd_comp2+1 
;TCC_5.c,281 :: 		qtd_comp3     =   EEPROM_Read(0x0B);      //lê os dados da EEPROM para variavel qtd_comp3
	MOVLW       11
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _qtd_comp3+0 
	MOVLW       0
	MOVWF       _qtd_comp3+1 
;TCC_5.c,282 :: 		qtd_comp4     =   EEPROM_Read(0x0C);      //lê os dados da EEPROM para variavel qtd_comp4
	MOVLW       12
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _qtd_comp4+0 
	MOVLW       0
	MOVWF       _qtd_comp4+1 
;TCC_5.c,284 :: 		if(qtd_comp==0xFF)qtd_comp=0x01;
	MOVLW       0
	XORWF       _qtd_comp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main434
	MOVLW       255
	XORWF       _qtd_comp+0, 0 
L__main434:
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
	MOVLW       1
	MOVWF       _qtd_comp+0 
	MOVLW       0
	MOVWF       _qtd_comp+1 
L_main2:
;TCC_5.c,285 :: 		if(qtd_comp2==0xFF)qtd_comp2=0x01;
	MOVLW       0
	XORWF       _qtd_comp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main435
	MOVLW       255
	XORWF       _qtd_comp2+0, 0 
L__main435:
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	MOVLW       1
	MOVWF       _qtd_comp2+0 
	MOVLW       0
	MOVWF       _qtd_comp2+1 
L_main3:
;TCC_5.c,286 :: 		if(qtd_comp3==0xFF)qtd_comp3=0x01;
	MOVLW       0
	XORWF       _qtd_comp3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main436
	MOVLW       255
	XORWF       _qtd_comp3+0, 0 
L__main436:
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
	MOVLW       1
	MOVWF       _qtd_comp3+0 
	MOVLW       0
	MOVWF       _qtd_comp3+1 
L_main4:
;TCC_5.c,287 :: 		if(qtd_comp4==0xFF)qtd_comp4=0x01;
	MOVLW       0
	XORWF       _qtd_comp4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main437
	MOVLW       255
	XORWF       _qtd_comp4+0, 0 
L__main437:
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
	MOVLW       1
	MOVWF       _qtd_comp4+0 
	MOVLW       0
	MOVWF       _qtd_comp4+1 
L_main5:
;TCC_5.c,289 :: 		TRISA = 0x00;                             //seta todos os bits do TRISA como saída
	CLRF        TRISA+0 
;TCC_5.c,290 :: 		TRISC = 0x3F;                             //seta os bits 0,1,2,3,5 como entrada
	MOVLW       63
	MOVWF       TRISC+0 
;TCC_5.c,291 :: 		TRISB = 0x00;                             //seta todos os bits do TRISB como saída
	CLRF        TRISB+0 
;TCC_5.c,293 :: 		LCD_Init();                               //inicia o LCD
	CALL        _Lcd_Init+0, 0
;TCC_5.c,294 :: 		LCD_Cmd(_LCD_CLEAR);                      //limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,295 :: 		LCD_Cmd(_LCD_CURSOR_OFF);                 //desliga cursor do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,297 :: 		while(1)                                         //loop infinito
L_main6:
;TCC_5.c,299 :: 		ler_bot();                                     //executa ler_bot
	CALL        _ler_bot+0, 0
;TCC_5.c,301 :: 		disp();                                        //executa disp
	CALL        _disp+0, 0
;TCC_5.c,302 :: 		}                                                //end while
	GOTO        L_main6
;TCC_5.c,304 :: 		}                                                 //end main
L_end_main:
	GOTO        $+0
; end of _main

_ler_bot:

;TCC_5.c,309 :: 		void ler_bot()
;TCC_5.c,312 :: 		if(!BOTAO1) b1_flag=0x01;                       //se botão1 for pressionado, flag do botão1 = 1
	BTFSC       PORTC+0, 0 
	GOTO        L_ler_bot8
	BSF         _b1_flag+0, BitPos(_b1_flag+0) 
L_ler_bot8:
;TCC_5.c,314 :: 		if(BOTAO1 && b1_flag)                           //se botão1 estiver solto e flag do botão1 = 1
	BTFSS       PORTC+0, 0 
	GOTO        L_ler_bot11
	BTFSS       _b1_flag+0, BitPos(_b1_flag+0) 
	GOTO        L_ler_bot11
L__ler_bot385:
;TCC_5.c,316 :: 		LCD_Cmd(_LCD_CLEAR);                           //limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,317 :: 		b1_flag = 0x00;                                //lmpa a flag do botão1
	BCF         _b1_flag+0, BitPos(_b1_flag+0) 
;TCC_5.c,318 :: 		if(!ligar)                                     //se bit ligar = 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot12
;TCC_5.c,320 :: 		prog++;                                       //incrementa prog, muda a programação
	INFSNZ      _prog+0, 1 
	INCF        _prog+1, 1 
;TCC_5.c,321 :: 		if(prog==4)                                   //se prog = 3
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot439
	MOVLW       4
	XORWF       _prog+0, 0 
L__ler_bot439:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot13
;TCC_5.c,323 :: 		prog=0x00;                                   //zera a variável prog
	CLRF        _prog+0 
	CLRF        _prog+1 
;TCC_5.c,324 :: 		EEPROM_Write(0x01,num);                      //grava num na EEPROM
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,325 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot14:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot14
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot14
	NOP
;TCC_5.c,326 :: 		EEPROM_Write(0x03,un);                       //grava un na EEPROM
	MOVLW       3
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un+0, BitPos(_un+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,327 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot15:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot15
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot15
	NOP
;TCC_5.c,328 :: 		EEPROM_Write(0x02,num2);                     //grava num2 na EEPROM
	MOVLW       2
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num2+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,329 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot16:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot16
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot16
	NOP
;TCC_5.c,330 :: 		EEPROM_Write(0x04,un2);                      //grava un2 na EEPROM
	MOVLW       4
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un2+0, BitPos(_un2+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,331 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot17:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot17
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot17
	NOP
;TCC_5.c,332 :: 		EEPROM_Write(0x05,num3);                     //grava num3 na EEPROM
	MOVLW       5
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num3+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,333 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot18:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot18
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot18
	NOP
;TCC_5.c,334 :: 		EEPROM_Write(0x06,un3);                      //grava un3 na EEPROM
	MOVLW       6
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un3+0, BitPos(_un3+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,335 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot19:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot19
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot19
	NOP
;TCC_5.c,336 :: 		EEPROM_Write(0x07,num4);                     //grava num4 na EEPROM
	MOVLW       7
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num4+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,337 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot20:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot20
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot20
	NOP
;TCC_5.c,338 :: 		EEPROM_Write(0x08,un4);                      //grava un4 na EEPROM
	MOVLW       8
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un4+0, BitPos(_un4+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,339 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot21:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot21
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot21
	NOP
;TCC_5.c,340 :: 		EEPROM_Write(0x09,qtd_comp);                 //grava qtd_comp na EEPROM
	MOVLW       9
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _qtd_comp+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,341 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot22:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot22
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot22
	NOP
;TCC_5.c,342 :: 		EEPROM_Write(0x0A,qtd_comp2);                //grava qtd_comp2 na EEPROM
	MOVLW       10
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _qtd_comp2+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,343 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot23:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot23
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot23
	NOP
;TCC_5.c,344 :: 		EEPROM_Write(0x0B,qtd_comp3);                //grava qtd_comp3 na EEPROM
	MOVLW       11
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _qtd_comp3+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,345 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot24:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot24
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot24
	NOP
;TCC_5.c,346 :: 		EEPROM_Write(0x0C,qtd_comp4);                //grava qtd_comp4 na EEPROM
	MOVLW       12
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _qtd_comp4+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,347 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot25:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot25
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot25
	NOP
;TCC_5.c,348 :: 		display=0x01;                                //bit display em 1
	BSF         _display+0, BitPos(_display+0) 
;TCC_5.c,350 :: 		}                                             //end if prog = 3
L_ler_bot13:
;TCC_5.c,352 :: 		}                                              //end if !ligar
L_ler_bot12:
;TCC_5.c,354 :: 		}                                               //end if BOTAO1 && b1_flag
L_ler_bot11:
;TCC_5.c,359 :: 		if(!BOTAO2)
	BTFSC       PORTC+0, 1 
	GOTO        L_ler_bot26
;TCC_5.c,361 :: 		b2_flag=0x01;                                  //se botão2 for pressionado, flag do botão2 = 1
	BSF         _b2_flag+0, BitPos(_b2_flag+0) 
;TCC_5.c,362 :: 		fast_incr();                                   //executa fast_incr
	CALL        _fast_incr+0, 0
;TCC_5.c,363 :: 		}
L_ler_bot26:
;TCC_5.c,365 :: 		if(BOTAO2 && b2_flag)                           //se botão2 for solto e flag do botão2 for 1
	BTFSS       PORTC+0, 1 
	GOTO        L_ler_bot29
	BTFSS       _b2_flag+0, BitPos(_b2_flag+0) 
	GOTO        L_ler_bot29
L__ler_bot384:
;TCC_5.c,367 :: 		LCD_Cmd(_LCD_CLEAR);                          //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,368 :: 		b2_flag    =  0x00;                           //limpa flag do botão
	BCF         _b2_flag+0, BitPos(_b2_flag+0) 
;TCC_5.c,369 :: 		fast_inc   =  0x00;                           //limpa bit de incremento rápido
	BCF         _fast_inc+0, BitPos(_fast_inc+0) 
;TCC_5.c,370 :: 		if(option==0)                                  //dispenser n°1
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot440
	MOVLW       0
	XORWF       _option+0, 0 
L__ler_bot440:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot30
;TCC_5.c,372 :: 		if(prog==1)                                   //programação de numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot441
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot441:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot31
;TCC_5.c,374 :: 		num++;                                       //incrementa num
	INFSNZ      _num+0, 1 
	INCF        _num+1, 1 
;TCC_5.c,375 :: 		}
L_ler_bot31:
;TCC_5.c,376 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot442
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot442:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot32
;TCC_5.c,378 :: 		un = ~un;                                   //inverte un
	BTG         _un+0, BitPos(_un+0) 
;TCC_5.c,379 :: 		}                                             //end if prog==2
L_ler_bot32:
;TCC_5.c,381 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot443
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot443:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot33
;TCC_5.c,383 :: 		qtd_comp++;                                  //incrementa qtd_comp
	INFSNZ      _qtd_comp+0, 1 
	INCF        _qtd_comp+1, 1 
;TCC_5.c,384 :: 		}
L_ler_bot33:
;TCC_5.c,386 :: 		if(qtd_comp>4) qtd_comp = 0x01;               //se quantidade de comprimidos passar de 4, retorna para 1
	MOVLW       0
	MOVWF       R0 
	MOVF        _qtd_comp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot444
	MOVF        _qtd_comp+0, 0 
	SUBLW       4
L__ler_bot444:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot34
	MOVLW       1
	MOVWF       _qtd_comp+0 
	MOVLW       0
	MOVWF       _qtd_comp+1 
L_ler_bot34:
;TCC_5.c,387 :: 		if(num>24) num=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot445
	MOVF        _num+0, 0 
	SUBLW       24
L__ler_bot445:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot35
	CLRF        _num+0 
	CLRF        _num+1 
L_ler_bot35:
;TCC_5.c,389 :: 		}                                              //end if option==0
L_ler_bot30:
;TCC_5.c,391 :: 		if(option==1)                                  //dispenser n°2
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot446
	MOVLW       1
	XORWF       _option+0, 0 
L__ler_bot446:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot36
;TCC_5.c,393 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot447
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot447:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot37
;TCC_5.c,395 :: 		num2++;                                      //incrementa num2
	INFSNZ      _num2+0, 1 
	INCF        _num2+1, 1 
;TCC_5.c,396 :: 		}
L_ler_bot37:
;TCC_5.c,397 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot448
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot448:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot38
;TCC_5.c,399 :: 		un2 = ~un2;                                 //inverte un2
	BTG         _un2+0, BitPos(_un2+0) 
;TCC_5.c,400 :: 		}
L_ler_bot38:
;TCC_5.c,401 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot449
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot449:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot39
;TCC_5.c,403 :: 		qtd_comp2++;                                 //incrementa qtd_comp2
	INFSNZ      _qtd_comp2+0, 1 
	INCF        _qtd_comp2+1, 1 
;TCC_5.c,404 :: 		}
L_ler_bot39:
;TCC_5.c,406 :: 		if(qtd_comp2>4) qtd_comp2 = 0x01;             //se quantidade de comprimidos passar de 4, retorna para 1
	MOVLW       0
	MOVWF       R0 
	MOVF        _qtd_comp2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot450
	MOVF        _qtd_comp2+0, 0 
	SUBLW       4
L__ler_bot450:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot40
	MOVLW       1
	MOVWF       _qtd_comp2+0 
	MOVLW       0
	MOVWF       _qtd_comp2+1 
L_ler_bot40:
;TCC_5.c,407 :: 		if(num2>24) num2=0x00;                        //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot451
	MOVF        _num2+0, 0 
	SUBLW       24
L__ler_bot451:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot41
	CLRF        _num2+0 
	CLRF        _num2+1 
L_ler_bot41:
;TCC_5.c,409 :: 		}                                              //end if option==1
L_ler_bot36:
;TCC_5.c,411 :: 		if(option==2)                                  //dispenser n°3
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot452
	MOVLW       2
	XORWF       _option+0, 0 
L__ler_bot452:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot42
;TCC_5.c,413 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot453
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot453:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot43
;TCC_5.c,415 :: 		num3++;                                      //incrementa num3
	INFSNZ      _num3+0, 1 
	INCF        _num3+1, 1 
;TCC_5.c,416 :: 		}
L_ler_bot43:
;TCC_5.c,417 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot454
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot454:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot44
;TCC_5.c,419 :: 		un3 = ~un3;                                 //inverte un3
	BTG         _un3+0, BitPos(_un3+0) 
;TCC_5.c,420 :: 		}
L_ler_bot44:
;TCC_5.c,421 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot455
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot455:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot45
;TCC_5.c,423 :: 		qtd_comp3++;                                 //incrementa qtd_comp3
	INFSNZ      _qtd_comp3+0, 1 
	INCF        _qtd_comp3+1, 1 
;TCC_5.c,424 :: 		}
L_ler_bot45:
;TCC_5.c,426 :: 		if(qtd_comp3>4) qtd_comp3 = 0x01;             //se quantidade de comprimidos passar de 4, retorna para 1
	MOVLW       0
	MOVWF       R0 
	MOVF        _qtd_comp3+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot456
	MOVF        _qtd_comp3+0, 0 
	SUBLW       4
L__ler_bot456:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot46
	MOVLW       1
	MOVWF       _qtd_comp3+0 
	MOVLW       0
	MOVWF       _qtd_comp3+1 
L_ler_bot46:
;TCC_5.c,427 :: 		if(num3>24) num3=0x00;                        //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num3+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot457
	MOVF        _num3+0, 0 
	SUBLW       24
L__ler_bot457:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot47
	CLRF        _num3+0 
	CLRF        _num3+1 
L_ler_bot47:
;TCC_5.c,429 :: 		}                                              //end if option==2
L_ler_bot42:
;TCC_5.c,431 :: 		if(option==3)                                  //dispenser n°4
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot458
	MOVLW       3
	XORWF       _option+0, 0 
L__ler_bot458:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot48
;TCC_5.c,433 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot459
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot459:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot49
;TCC_5.c,435 :: 		num4++;                                      //incrementa num4
	INFSNZ      _num4+0, 1 
	INCF        _num4+1, 1 
;TCC_5.c,436 :: 		}
L_ler_bot49:
;TCC_5.c,437 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot460
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot460:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot50
;TCC_5.c,439 :: 		un4 = ~un4;                                 //inverte un4
	BTG         _un4+0, BitPos(_un4+0) 
;TCC_5.c,440 :: 		}
L_ler_bot50:
;TCC_5.c,441 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot461
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot461:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot51
;TCC_5.c,443 :: 		qtd_comp4++;                                 //incrementa qtd_comp4
	INFSNZ      _qtd_comp4+0, 1 
	INCF        _qtd_comp4+1, 1 
;TCC_5.c,444 :: 		}
L_ler_bot51:
;TCC_5.c,446 :: 		if(qtd_comp4>4) qtd_comp4 = 0x01;             //se quantidade de comprimidos passar de 4, retorna para 1
	MOVLW       0
	MOVWF       R0 
	MOVF        _qtd_comp4+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot462
	MOVF        _qtd_comp4+0, 0 
	SUBLW       4
L__ler_bot462:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot52
	MOVLW       1
	MOVWF       _qtd_comp4+0 
	MOVLW       0
	MOVWF       _qtd_comp4+1 
L_ler_bot52:
;TCC_5.c,447 :: 		if(num4>24) num4=0x00;                        //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num4+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot463
	MOVF        _num4+0, 0 
	SUBLW       24
L__ler_bot463:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot53
	CLRF        _num4+0 
	CLRF        _num4+1 
L_ler_bot53:
;TCC_5.c,449 :: 		}                                              //end if option==3
L_ler_bot48:
;TCC_5.c,451 :: 		comp  = qtd_comp;
	MOVF        _qtd_comp+0, 0 
	MOVWF       _comp+0 
	MOVF        _qtd_comp+1, 0 
	MOVWF       _comp+1 
;TCC_5.c,452 :: 		comp2 = qtd_comp2;
	MOVF        _qtd_comp2+0, 0 
	MOVWF       _comp2+0 
	MOVF        _qtd_comp2+1, 0 
	MOVWF       _comp2+1 
;TCC_5.c,453 :: 		comp3 = qtd_comp3;
	MOVF        _qtd_comp3+0, 0 
	MOVWF       _comp3+0 
	MOVF        _qtd_comp3+1, 0 
	MOVWF       _comp3+1 
;TCC_5.c,454 :: 		comp4 = qtd_comp4;                             //igualando as variaveis para despejar o numero certo de comprimidos
	MOVF        _qtd_comp4+0, 0 
	MOVWF       _comp4+0 
	MOVF        _qtd_comp4+1, 0 
	MOVWF       _comp4+1 
;TCC_5.c,456 :: 		}                                               //end if BOTAO2 e b2_flag
L_ler_bot29:
;TCC_5.c,459 :: 		if(!BOTAO3) b3_flag=0x01;                       //se botão3 for pressionado, flag do botão3 = 1
	BTFSC       PORTC+0, 2 
	GOTO        L_ler_bot54
	BSF         _b3_flag+0, BitPos(_b3_flag+0) 
L_ler_bot54:
;TCC_5.c,461 :: 		if(BOTAO3 && b3_flag)                           //se botão3 for solto e flag do botão3 for 1
	BTFSS       PORTC+0, 2 
	GOTO        L_ler_bot57
	BTFSS       _b3_flag+0, BitPos(_b3_flag+0) 
	GOTO        L_ler_bot57
L__ler_bot383:
;TCC_5.c,463 :: 		LCD_Cmd(_LCD_CLEAR);                           //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,464 :: 		b3_flag     =  0x00;                           //limpa flag do botão3
	BCF         _b3_flag+0, BitPos(_b3_flag+0) 
;TCC_5.c,465 :: 		if(option==0)                                  //dispenser n°1
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot464
	MOVLW       0
	XORWF       _option+0, 0 
L__ler_bot464:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot58
;TCC_5.c,467 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot465
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot465:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot59
;TCC_5.c,469 :: 		num--;                                       //decrementa num
	MOVLW       1
	SUBWF       _num+0, 1 
	MOVLW       0
	SUBWFB      _num+1, 1 
;TCC_5.c,471 :: 		}
L_ler_bot59:
;TCC_5.c,472 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot466
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot466:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot60
;TCC_5.c,474 :: 		un = ~un;                                    //inverte un
	BTG         _un+0, BitPos(_un+0) 
;TCC_5.c,475 :: 		}
L_ler_bot60:
;TCC_5.c,476 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot467
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot467:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot61
;TCC_5.c,478 :: 		qtd_comp--;                                  //decrementa qtd_comp3
	MOVLW       1
	SUBWF       _qtd_comp+0, 1 
	MOVLW       0
	SUBWFB      _qtd_comp+1, 1 
;TCC_5.c,479 :: 		}
L_ler_bot61:
;TCC_5.c,481 :: 		if(qtd_comp<1) qtd_comp = 0x04;               //se quantidade de comprimidos passar de 1, retorna para 4
	MOVLW       0
	SUBWF       _qtd_comp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot468
	MOVLW       1
	SUBWF       _qtd_comp+0, 0 
L__ler_bot468:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot62
	MOVLW       4
	MOVWF       _qtd_comp+0 
	MOVLW       0
	MOVWF       _qtd_comp+1 
L_ler_bot62:
;TCC_5.c,482 :: 		if(num>24) num=24;                            //se o numero for maior que 24, vai para 24
	MOVLW       0
	MOVWF       R0 
	MOVF        _num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot469
	MOVF        _num+0, 0 
	SUBLW       24
L__ler_bot469:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot63
	MOVLW       24
	MOVWF       _num+0 
	MOVLW       0
	MOVWF       _num+1 
L_ler_bot63:
;TCC_5.c,483 :: 		}                                              //end if option==0
L_ler_bot58:
;TCC_5.c,485 :: 		if(option==1)                                  //dispenser n°2
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot470
	MOVLW       1
	XORWF       _option+0, 0 
L__ler_bot470:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot64
;TCC_5.c,487 :: 		if(prog==1)                                   //programação do número
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot471
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot471:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot65
;TCC_5.c,489 :: 		num2--;                                      //decrementa num2
	MOVLW       1
	SUBWF       _num2+0, 1 
	MOVLW       0
	SUBWFB      _num2+1, 1 
;TCC_5.c,491 :: 		}
L_ler_bot65:
;TCC_5.c,492 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot472
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot472:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot66
;TCC_5.c,494 :: 		un2 = ~un2;                                  //inverte un2
	BTG         _un2+0, BitPos(_un2+0) 
;TCC_5.c,495 :: 		}
L_ler_bot66:
;TCC_5.c,496 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot473
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot473:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot67
;TCC_5.c,498 :: 		qtd_comp2--;                                 //decrementa qtd_comp2
	MOVLW       1
	SUBWF       _qtd_comp2+0, 1 
	MOVLW       0
	SUBWFB      _qtd_comp2+1, 1 
;TCC_5.c,499 :: 		}
L_ler_bot67:
;TCC_5.c,501 :: 		if(qtd_comp2<1) qtd_comp2 = 0x04;             //se quantidade de comprimidos passar de 1, retorna para 4
	MOVLW       0
	SUBWF       _qtd_comp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot474
	MOVLW       1
	SUBWF       _qtd_comp2+0, 0 
L__ler_bot474:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot68
	MOVLW       4
	MOVWF       _qtd_comp2+0 
	MOVLW       0
	MOVWF       _qtd_comp2+1 
L_ler_bot68:
;TCC_5.c,502 :: 		if(num2>24) num2=24;                          //se o numero for maior que 24, vai para 24
	MOVLW       0
	MOVWF       R0 
	MOVF        _num2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot475
	MOVF        _num2+0, 0 
	SUBLW       24
L__ler_bot475:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot69
	MOVLW       24
	MOVWF       _num2+0 
	MOVLW       0
	MOVWF       _num2+1 
L_ler_bot69:
;TCC_5.c,504 :: 		}                                              //end if option==1
L_ler_bot64:
;TCC_5.c,506 :: 		if(option==2)                                  //dispenser n°3
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot476
	MOVLW       2
	XORWF       _option+0, 0 
L__ler_bot476:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot70
;TCC_5.c,508 :: 		if(prog==1)                                   //programação do número
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot477
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot477:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot71
;TCC_5.c,510 :: 		num3--;                                      //decrementa num3
	MOVLW       1
	SUBWF       _num3+0, 1 
	MOVLW       0
	SUBWFB      _num3+1, 1 
;TCC_5.c,512 :: 		}
L_ler_bot71:
;TCC_5.c,513 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot478
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot478:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot72
;TCC_5.c,515 :: 		un3 = ~un3;                                  //inverte un3
	BTG         _un3+0, BitPos(_un3+0) 
;TCC_5.c,516 :: 		}
L_ler_bot72:
;TCC_5.c,517 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot479
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot479:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot73
;TCC_5.c,519 :: 		qtd_comp3--;                                 //decrementa qtd_comp3
	MOVLW       1
	SUBWF       _qtd_comp3+0, 1 
	MOVLW       0
	SUBWFB      _qtd_comp3+1, 1 
;TCC_5.c,520 :: 		}
L_ler_bot73:
;TCC_5.c,522 :: 		if(qtd_comp3<1) qtd_comp3 = 0x04;             //se quantidade de comprimidos passar de 1, retorna para 4
	MOVLW       0
	SUBWF       _qtd_comp3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot480
	MOVLW       1
	SUBWF       _qtd_comp3+0, 0 
L__ler_bot480:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot74
	MOVLW       4
	MOVWF       _qtd_comp3+0 
	MOVLW       0
	MOVWF       _qtd_comp3+1 
L_ler_bot74:
;TCC_5.c,523 :: 		if(num3>24) num3=24;                          //se o numero for maior que 24, vai para 24
	MOVLW       0
	MOVWF       R0 
	MOVF        _num3+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot481
	MOVF        _num3+0, 0 
	SUBLW       24
L__ler_bot481:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot75
	MOVLW       24
	MOVWF       _num3+0 
	MOVLW       0
	MOVWF       _num3+1 
L_ler_bot75:
;TCC_5.c,525 :: 		}                                              //end if option==2
L_ler_bot70:
;TCC_5.c,527 :: 		if(option==3)                                  //dispenser n°4
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot482
	MOVLW       3
	XORWF       _option+0, 0 
L__ler_bot482:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot76
;TCC_5.c,529 :: 		if(prog==1)                                   //programação do número
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot483
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot483:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot77
;TCC_5.c,531 :: 		num4--;                                      //decrementa num4
	MOVLW       1
	SUBWF       _num4+0, 1 
	MOVLW       0
	SUBWFB      _num4+1, 1 
;TCC_5.c,533 :: 		}
L_ler_bot77:
;TCC_5.c,534 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot484
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot484:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot78
;TCC_5.c,536 :: 		un4 = ~un4;                                  //inverte un4
	BTG         _un4+0, BitPos(_un4+0) 
;TCC_5.c,537 :: 		}
L_ler_bot78:
;TCC_5.c,538 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot485
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot485:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot79
;TCC_5.c,540 :: 		qtd_comp4--;                                 //decrementa qtd_comp4
	MOVLW       1
	SUBWF       _qtd_comp4+0, 1 
	MOVLW       0
	SUBWFB      _qtd_comp4+1, 1 
;TCC_5.c,541 :: 		}
L_ler_bot79:
;TCC_5.c,543 :: 		if(qtd_comp4<1) qtd_comp4 = 0x04;             //se quantidade de comprimidos passar de 1, retorna para 4
	MOVLW       0
	SUBWF       _qtd_comp4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot486
	MOVLW       1
	SUBWF       _qtd_comp4+0, 0 
L__ler_bot486:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot80
	MOVLW       4
	MOVWF       _qtd_comp4+0 
	MOVLW       0
	MOVWF       _qtd_comp4+1 
L_ler_bot80:
;TCC_5.c,545 :: 		if(num4>24) num4=24;                          //se o numero for maior que 24, vai para 24
	MOVLW       0
	MOVWF       R0 
	MOVF        _num4+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot487
	MOVF        _num4+0, 0 
	SUBLW       24
L__ler_bot487:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot81
	MOVLW       24
	MOVWF       _num4+0 
	MOVLW       0
	MOVWF       _num4+1 
L_ler_bot81:
;TCC_5.c,547 :: 		}                                              //end if option==3
L_ler_bot76:
;TCC_5.c,549 :: 		comp  = qtd_comp;
	MOVF        _qtd_comp+0, 0 
	MOVWF       _comp+0 
	MOVF        _qtd_comp+1, 0 
	MOVWF       _comp+1 
;TCC_5.c,550 :: 		comp2 = qtd_comp2;
	MOVF        _qtd_comp2+0, 0 
	MOVWF       _comp2+0 
	MOVF        _qtd_comp2+1, 0 
	MOVWF       _comp2+1 
;TCC_5.c,551 :: 		comp3 = qtd_comp3;
	MOVF        _qtd_comp3+0, 0 
	MOVWF       _comp3+0 
	MOVF        _qtd_comp3+1, 0 
	MOVWF       _comp3+1 
;TCC_5.c,552 :: 		comp4 = qtd_comp4;                             //igualando as variaveis para despejar o numero certo de comprimidos
	MOVF        _qtd_comp4+0, 0 
	MOVWF       _comp4+0 
	MOVF        _qtd_comp4+1, 0 
	MOVWF       _comp4+1 
;TCC_5.c,554 :: 		}                                               //end if botão3 e b3_flag
L_ler_bot57:
;TCC_5.c,557 :: 		if(!BOTAO4) b4_flag=0x01;                       //se botão4 for pressionado, flag do botão4 = 1
	BTFSC       PORTC+0, 4 
	GOTO        L_ler_bot82
	BSF         _b4_flag+0, BitPos(_b4_flag+0) 
L_ler_bot82:
;TCC_5.c,559 :: 		if(BOTAO4 && b4_flag)                           //se botão4 for solto e flag do botão4 for 1
	BTFSS       PORTC+0, 4 
	GOTO        L_ler_bot85
	BTFSS       _b4_flag+0, BitPos(_b4_flag+0) 
	GOTO        L_ler_bot85
L__ler_bot382:
;TCC_5.c,561 :: 		LCD_Cmd(_LCD_CLEAR);                          //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,562 :: 		b4_flag    =  0x00;                           //limpa flag do botão4
	BCF         _b4_flag+0, BitPos(_b4_flag+0) 
;TCC_5.c,563 :: 		if(num!=0 || num2!=0 || num3!=0 || num4!=0)    //se num, num2, num3 ou num4 for diferente 0
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot488
	MOVLW       0
	XORWF       _num+0, 0 
L__ler_bot488:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot381
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot489
	MOVLW       0
	XORWF       _num2+0, 0 
L__ler_bot489:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot381
	MOVLW       0
	XORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot490
	MOVLW       0
	XORWF       _num3+0, 0 
L__ler_bot490:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot381
	MOVLW       0
	XORWF       _num4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot491
	MOVLW       0
	XORWF       _num4+0, 0 
L__ler_bot491:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot381
	GOTO        L_ler_bot88
L__ler_bot381:
;TCC_5.c,565 :: 		if(prog==0)                                   //se prog = 0
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot492
	MOVLW       0
	XORWF       _prog+0, 0 
L__ler_bot492:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot89
;TCC_5.c,567 :: 		if(!toque && !toque2 && !toque3 && !toque4)  //se nenhum contador tiver finalizado...
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L_ler_bot92
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_ler_bot92
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_ler_bot92
	BTFSC       _toque4+0, BitPos(_toque4+0) 
	GOTO        L_ler_bot92
L__ler_bot380:
;TCC_5.c,569 :: 		if(!ligar)                                  //se bit de ligar = 0 (desligado)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot93
;TCC_5.c,571 :: 		temp =0x00;                                //zera temp
	CLRF        _temp+0 
	CLRF        _temp+1 
;TCC_5.c,572 :: 		temp2=0x00;                                //zera temp2
	CLRF        _temp2+0 
	CLRF        _temp2+1 
;TCC_5.c,573 :: 		temp3=0x00;                                //zera temp3
	CLRF        _temp3+0 
	CLRF        _temp3+1 
;TCC_5.c,574 :: 		temp4=0x00;                                //zera temp4
	CLRF        _temp4+0 
	CLRF        _temp4+1 
;TCC_5.c,576 :: 		}                                           //end if !ligar
L_ler_bot93:
;TCC_5.c,577 :: 		ligar = ~ligar;                              //inverte ligar
	BTG         _ligar+0, BitPos(_ligar+0) 
;TCC_5.c,578 :: 		if(!ligar) display2 = 0x01;                  //se ligar for 0, bit display2 = 1
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot94
	BSF         _display2+0, BitPos(_display2+0) 
L_ler_bot94:
;TCC_5.c,580 :: 		}                                            //end if !toque && !toque2 && !toque3 && !toque4
L_ler_bot92:
;TCC_5.c,582 :: 		}                                             //end if prog==0
L_ler_bot89:
;TCC_5.c,584 :: 		}                                              //end if num!=0 || num2!=0 ||num3!=0 || num4!=0
L_ler_bot88:
;TCC_5.c,586 :: 		}                                               //end if BOTAO4 && b4_flag
L_ler_bot85:
;TCC_5.c,588 :: 		if(!un)                                         //se un = 0
	BTFSC       _un+0, BitPos(_un+0) 
	GOTO        L_ler_bot95
;TCC_5.c,590 :: 		mult = num * 1;                                //mult é num * 3600 (hora)
	MOVF        _num+0, 0 
	MOVWF       _mult+0 
	MOVF        _num+1, 0 
	MOVWF       _mult+1 
;TCC_5.c,591 :: 		}
L_ler_bot95:
;TCC_5.c,592 :: 		if(un)                                          //se un = 1
	BTFSS       _un+0, BitPos(_un+0) 
	GOTO        L_ler_bot96
;TCC_5.c,594 :: 		mult = num * 5;                                //mult é num * 86400 (dia)
	MOVF        _num+0, 0 
	MOVWF       R0 
	MOVF        _num+1, 0 
	MOVWF       R1 
	MOVLW       5
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _mult+0 
	MOVF        R1, 0 
	MOVWF       _mult+1 
;TCC_5.c,595 :: 		}
L_ler_bot96:
;TCC_5.c,597 :: 		if(!un2)                                        //se un2 = 0
	BTFSC       _un2+0, BitPos(_un2+0) 
	GOTO        L_ler_bot97
;TCC_5.c,599 :: 		mult2 = num2 * 1;                              //mult2 é num2 * 3600 (hora)
	MOVF        _num2+0, 0 
	MOVWF       _mult2+0 
	MOVF        _num2+1, 0 
	MOVWF       _mult2+1 
;TCC_5.c,600 :: 		}
L_ler_bot97:
;TCC_5.c,601 :: 		if(un2)                                         //se un2 = 1
	BTFSS       _un2+0, BitPos(_un2+0) 
	GOTO        L_ler_bot98
;TCC_5.c,603 :: 		mult2 = num2 * 5;                              //mult2 é num2 * 86400 (dia)
	MOVF        _num2+0, 0 
	MOVWF       R0 
	MOVF        _num2+1, 0 
	MOVWF       R1 
	MOVLW       5
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _mult2+0 
	MOVF        R1, 0 
	MOVWF       _mult2+1 
;TCC_5.c,604 :: 		}
L_ler_bot98:
;TCC_5.c,606 :: 		if(!un3)                                        //se un3 = 0
	BTFSC       _un3+0, BitPos(_un3+0) 
	GOTO        L_ler_bot99
;TCC_5.c,608 :: 		mult3 = num3 * 1;                              //mult3 é num3 * 3600 (hora)
	MOVF        _num3+0, 0 
	MOVWF       _mult3+0 
	MOVF        _num3+1, 0 
	MOVWF       _mult3+1 
;TCC_5.c,609 :: 		}
L_ler_bot99:
;TCC_5.c,610 :: 		if(un3)                                         //se un3 = 1
	BTFSS       _un3+0, BitPos(_un3+0) 
	GOTO        L_ler_bot100
;TCC_5.c,612 :: 		mult3 = num3 * 5;                              //mult3 é num3 * 86400 (dia)
	MOVF        _num3+0, 0 
	MOVWF       R0 
	MOVF        _num3+1, 0 
	MOVWF       R1 
	MOVLW       5
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _mult3+0 
	MOVF        R1, 0 
	MOVWF       _mult3+1 
;TCC_5.c,613 :: 		}
L_ler_bot100:
;TCC_5.c,615 :: 		if(!un4)                                        //se un4 = 0
	BTFSC       _un4+0, BitPos(_un4+0) 
	GOTO        L_ler_bot101
;TCC_5.c,617 :: 		mult4 = num4 * 1;                              //mult4 é num4 * 3600 (hora)
	MOVF        _num4+0, 0 
	MOVWF       _mult4+0 
	MOVF        _num4+1, 0 
	MOVWF       _mult4+1 
;TCC_5.c,618 :: 		}
L_ler_bot101:
;TCC_5.c,619 :: 		if(un4)                                         //se un4 = 1
	BTFSS       _un4+0, BitPos(_un4+0) 
	GOTO        L_ler_bot102
;TCC_5.c,621 :: 		mult4 = num4 * 5;                              //mult4 é num4 * 86400 (dia)
	MOVF        _num4+0, 0 
	MOVWF       R0 
	MOVF        _num4+1, 0 
	MOVWF       R1 
	MOVLW       5
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _mult4+0 
	MOVF        R1, 0 
	MOVWF       _mult4+1 
;TCC_5.c,622 :: 		}
L_ler_bot102:
;TCC_5.c,625 :: 		if(!BOTAO5) b5_flag = 0x01;                     //se botão5 for pressionado, flag do botão5 = 1
	BTFSC       PORTC+0, 5 
	GOTO        L_ler_bot103
	BSF         _b5_flag+0, BitPos(_b5_flag+0) 
L_ler_bot103:
;TCC_5.c,627 :: 		if(BOTAO5 && b5_flag)                           //se botão5 for solto e flag do botão5 for 1
	BTFSS       PORTC+0, 5 
	GOTO        L_ler_bot106
	BTFSS       _b5_flag+0, BitPos(_b5_flag+0) 
	GOTO        L_ler_bot106
L__ler_bot379:
;TCC_5.c,629 :: 		LCD_Cmd(_LCD_CLEAR);                           //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,630 :: 		b5_flag = 0x00;                                //limpa flag do botão5
	BCF         _b5_flag+0, BitPos(_b5_flag+0) 
;TCC_5.c,631 :: 		if(prog != 0)                                  //se prog for diferente de 0
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot493
	MOVLW       0
	XORWF       _prog+0, 0 
L__ler_bot493:
	BTFSC       STATUS+0, 2 
	GOTO        L_ler_bot107
;TCC_5.c,633 :: 		option++;                                     //incrementa option
	INFSNZ      _option+0, 1 
	INCF        _option+1, 1 
;TCC_5.c,634 :: 		if(option == 4) option=0x00;                  //se option for 4, option = 0
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot494
	MOVLW       4
	XORWF       _option+0, 0 
L__ler_bot494:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot108
	CLRF        _option+0 
	CLRF        _option+1 
L_ler_bot108:
;TCC_5.c,635 :: 		}
L_ler_bot107:
;TCC_5.c,637 :: 		if(toque || toque2 || toque3 || toque4)       //se algum comando do SOM estiver ativado...
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L__ler_bot378
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L__ler_bot378
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L__ler_bot378
	BTFSC       _toque4+0, BitPos(_toque4+0) 
	GOTO        L__ler_bot378
	GOTO        L_ler_bot111
L__ler_bot378:
;TCC_5.c,639 :: 		if(toque)temp_ligado=0x00;                    //se for o toque 1, zera o contador 1
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_ler_bot112
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
L_ler_bot112:
;TCC_5.c,640 :: 		if(toque2)temp_ligado2=0x00;                  //se for o toque 2, zera o contador 2
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_ler_bot113
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
L_ler_bot113:
;TCC_5.c,641 :: 		if(toque3)temp_ligado3=0x00;                  //se for o toque 3, zera o contador 3
	BTFSS       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_ler_bot114
	CLRF        _temp_ligado3+0 
	CLRF        _temp_ligado3+1 
L_ler_bot114:
;TCC_5.c,642 :: 		if(toque4)temp_ligado4=0x00;                  //se for o toque 4, zera o contador 4
	BTFSS       _toque4+0, BitPos(_toque4+0) 
	GOTO        L_ler_bot115
	CLRF        _temp_ligado4+0 
	CLRF        _temp_ligado4+1 
L_ler_bot115:
;TCC_5.c,643 :: 		toque =0x00;
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,644 :: 		toque2=0x00;
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,645 :: 		toque3=0x00;
	BCF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,646 :: 		toque4=0x00;                                 //zera todos os bits de SOM
	BCF         _toque4+0, BitPos(_toque4+0) 
;TCC_5.c,647 :: 		SOM=0x00;
	BCF         PORTA+0, 2 
;TCC_5.c,649 :: 		}                                             //end if toque || toque2 || toque3 || toque4
L_ler_bot111:
;TCC_5.c,651 :: 		}                                               //end if BOTAO5 && b5_flag
L_ler_bot106:
;TCC_5.c,653 :: 		}                                                 //end ler_bot()
L_end_ler_bot:
	RETURN      0
; end of _ler_bot

_fast_incr:

;TCC_5.c,659 :: 		void fast_incr()
;TCC_5.c,661 :: 		if(temp_inc>7)temp_inc=0x00;                     //se temp_inc maior que 7, zera temp_inc
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_inc+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr496
	MOVF        _temp_inc+0, 0 
	SUBLW       7
L__fast_incr496:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr116
	CLRF        _temp_inc+0 
	CLRF        _temp_inc+1 
L_fast_incr116:
;TCC_5.c,662 :: 		if(temp_inc==7)                                  //conta 700ms...
	MOVLW       0
	XORWF       _temp_inc+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr497
	MOVLW       7
	XORWF       _temp_inc+0, 0 
L__fast_incr497:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr117
;TCC_5.c,664 :: 		temp_inc=0x00;                                  //zera temp_inc
	CLRF        _temp_inc+0 
	CLRF        _temp_inc+1 
;TCC_5.c,665 :: 		fast_inc=0x01;                                  //ativa fast_inc
	BSF         _fast_inc+0, BitPos(_fast_inc+0) 
;TCC_5.c,666 :: 		}                                                //end if temp_inc==7
L_fast_incr117:
;TCC_5.c,668 :: 		if(fast_inc)                                     //se fast_inc for ativado...
	BTFSS       _fast_inc+0, BitPos(_fast_inc+0) 
	GOTO        L_fast_incr118
;TCC_5.c,670 :: 		if(option==0 && prog==1)                        //se dispenser n°1 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr498
	MOVLW       0
	XORWF       _option+0, 0 
L__fast_incr498:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr121
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr499
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr499:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr121
L__fast_incr389:
;TCC_5.c,672 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr500
	MOVF        _temp_num+0, 0 
	SUBLW       5
L__fast_incr500:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr122
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr122:
;TCC_5.c,673 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr501
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr501:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr123
;TCC_5.c,675 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,676 :: 		num += 2;                                     //acrescenta 2 em num
	MOVLW       2
	ADDWF       _num+0, 1 
	MOVLW       0
	ADDWFC      _num+1, 1 
;TCC_5.c,678 :: 		}                                              //end if temp_num==5
L_fast_incr123:
;TCC_5.c,680 :: 		}                                               //end if option==0 && prog=1
L_fast_incr121:
;TCC_5.c,683 :: 		if(option==1 && prog==1)                        //se dispenser n°2 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr502
	MOVLW       1
	XORWF       _option+0, 0 
L__fast_incr502:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr126
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr503
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr503:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr126
L__fast_incr388:
;TCC_5.c,685 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr504
	MOVF        _temp_num+0, 0 
	SUBLW       5
L__fast_incr504:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr127
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr127:
;TCC_5.c,686 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr505
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr505:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr128
;TCC_5.c,688 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,689 :: 		num2 += 2;                                    //acrescenta 2 em num2
	MOVLW       2
	ADDWF       _num2+0, 1 
	MOVLW       0
	ADDWFC      _num2+1, 1 
;TCC_5.c,691 :: 		}                                              //end if temp_num==5
L_fast_incr128:
;TCC_5.c,693 :: 		}                                               //end if option==1 && prog=1
L_fast_incr126:
;TCC_5.c,695 :: 		if(option==2 && prog==1)                       //se dispenser n°3 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr506
	MOVLW       2
	XORWF       _option+0, 0 
L__fast_incr506:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr131
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr507
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr507:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr131
L__fast_incr387:
;TCC_5.c,697 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr508
	MOVF        _temp_num+0, 0 
	SUBLW       5
L__fast_incr508:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr132
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr132:
;TCC_5.c,698 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr509
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr509:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr133
;TCC_5.c,700 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,701 :: 		num3 += 2;                                    //acrescenta 2 em num3
	MOVLW       2
	ADDWF       _num3+0, 1 
	MOVLW       0
	ADDWFC      _num3+1, 1 
;TCC_5.c,703 :: 		}                                              //end if temp_num==5
L_fast_incr133:
;TCC_5.c,705 :: 		}                                               //end if option==2 && prog=1
L_fast_incr131:
;TCC_5.c,707 :: 		if(option==3 && prog==1)                       //se dispenser n°4 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr510
	MOVLW       3
	XORWF       _option+0, 0 
L__fast_incr510:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr136
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr511
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr511:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr136
L__fast_incr386:
;TCC_5.c,709 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr512
	MOVF        _temp_num+0, 0 
	SUBLW       5
L__fast_incr512:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr137
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr137:
;TCC_5.c,710 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr513
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr513:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr138
;TCC_5.c,712 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,713 :: 		num4 += 2;                                    //acrescenta 2 em num4
	MOVLW       2
	ADDWF       _num4+0, 1 
	MOVLW       0
	ADDWFC      _num4+1, 1 
;TCC_5.c,715 :: 		}                                              //end if temp_num==5
L_fast_incr138:
;TCC_5.c,717 :: 		}                                               //end if option==3 && prog=1
L_fast_incr136:
;TCC_5.c,719 :: 		if(num >24) num =0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr514
	MOVF        _num+0, 0 
	SUBLW       24
L__fast_incr514:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr139
	CLRF        _num+0 
	CLRF        _num+1 
L_fast_incr139:
;TCC_5.c,720 :: 		if(num2>24) num2=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr515
	MOVF        _num2+0, 0 
	SUBLW       24
L__fast_incr515:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr140
	CLRF        _num2+0 
	CLRF        _num2+1 
L_fast_incr140:
;TCC_5.c,721 :: 		if(num3>24) num3=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num3+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr516
	MOVF        _num3+0, 0 
	SUBLW       24
L__fast_incr516:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr141
	CLRF        _num3+0 
	CLRF        _num3+1 
L_fast_incr141:
;TCC_5.c,722 :: 		if(num4>24) num4=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num4+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr517
	MOVF        _num4+0, 0 
	SUBLW       24
L__fast_incr517:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr142
	CLRF        _num4+0 
	CLRF        _num4+1 
L_fast_incr142:
;TCC_5.c,724 :: 		}                                                //end if fast_inc
L_fast_incr118:
;TCC_5.c,729 :: 		}                                                 //end void fast_incr()
L_end_fast_incr:
	RETURN      0
; end of _fast_incr

_disp:

;TCC_5.c,735 :: 		void disp()
;TCC_5.c,737 :: 		if(!ligar && prog==0)                           //se ligar for 0 e prog for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_disp145
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp519
	MOVLW       0
	XORWF       _prog+0, 0 
L__disp519:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp145
L__disp393:
;TCC_5.c,739 :: 		if(!display && !display2)                      //se os bits diplay e display2 forem 0
	BTFSC       _display+0, BitPos(_display+0) 
	GOTO        L_disp148
	BTFSC       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp148
L__disp392:
;TCC_5.c,741 :: 		LCD_Out(1,1,"  DISPENSER DE  ");             //exibe "DISPENSER DE"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,742 :: 		LCD_Out(2,1,"    REMEDIOS    ");             //      "  REMEDIOS  "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,743 :: 		}
	GOTO        L_disp149
L_disp148:
;TCC_5.c,746 :: 		if(display && !display2)                      //se bits display for 1 e display2 for 0
	BTFSS       _display+0, BitPos(_display+0) 
	GOTO        L_disp152
	BTFSC       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp152
L__disp391:
;TCC_5.c,748 :: 		display=0x00;                                //limpa bit display
	BCF         _display+0, BitPos(_display+0) 
;TCC_5.c,749 :: 		LCD_Out(1,1,"ETEC LAURO GOMES");             //exibe "ETEC LAURO GOMES"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,750 :: 		LCD_Out(2,1,"  3A MECA 2021  ");             //      "  3A MECA 2021  "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,751 :: 		delay_ms(1000);                              //espera 1 segundo
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_disp153:
	DECFSZ      R13, 1, 1
	BRA         L_disp153
	DECFSZ      R12, 1, 1
	BRA         L_disp153
	DECFSZ      R11, 1, 1
	BRA         L_disp153
	NOP
	NOP
;TCC_5.c,752 :: 		}
L_disp152:
;TCC_5.c,753 :: 		if(!display && display2)                      //se os bits display for 0 e display2 for 1
	BTFSC       _display+0, BitPos(_display+0) 
	GOTO        L_disp156
	BTFSS       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp156
L__disp390:
;TCC_5.c,755 :: 		display2=0x00;                               //limpa bit display2
	BCF         _display2+0, BitPos(_display2+0) 
;TCC_5.c,756 :: 		LCD_Out(1,1,"     PARANDO    ");             //exibe "     PARANDO    "
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,757 :: 		LCD_Out(2,1,"     CONTAGEM   ");             //      "     CONTAGEM   "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,758 :: 		delay_ms(1000);                              //espera 1 segundo
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_disp157:
	DECFSZ      R13, 1, 1
	BRA         L_disp157
	DECFSZ      R12, 1, 1
	BRA         L_disp157
	DECFSZ      R11, 1, 1
	BRA         L_disp157
	NOP
	NOP
;TCC_5.c,759 :: 		}
L_disp156:
;TCC_5.c,760 :: 		}                                              //end else
L_disp149:
;TCC_5.c,761 :: 		}                                               //end if !ligar && prog==0
L_disp145:
;TCC_5.c,763 :: 		if(prog==1)                                     //programação de numeros
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp520
	MOVLW       1
	XORWF       _prog+0, 0 
L__disp520:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp158
;TCC_5.c,765 :: 		LCD_Out(1,1,"PROGRAME NUMERO:");               //exibe "PROGRAME NUMERO:
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,766 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,767 :: 		if(option==0) LCD_Chr(2,1,'1');               //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp521
	MOVLW       0
	XORWF       _option+0, 0 
L__disp521:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp159
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp159:
;TCC_5.c,768 :: 		if(option==1) LCD_Chr(2,1,'2');               //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp522
	MOVLW       1
	XORWF       _option+0, 0 
L__disp522:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp160
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp160:
;TCC_5.c,769 :: 		if(option==2) LCD_Chr(2,1,'3');               //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp523
	MOVLW       2
	XORWF       _option+0, 0 
L__disp523:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp161
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp161:
;TCC_5.c,770 :: 		if(option==3) LCD_Chr(2,1,'4');               //se option for 2, exibe "4"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp524
	MOVLW       3
	XORWF       _option+0, 0 
L__disp524:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp162
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       52
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp162:
;TCC_5.c,771 :: 		}
L_disp158:
;TCC_5.c,773 :: 		if(prog==2)                                     //se prog for 2
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp525
	MOVLW       2
	XORWF       _prog+0, 0 
L__disp525:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp163
;TCC_5.c,775 :: 		LCD_Out(1,1,"PROGRAME Un.:");                  //exibe "PROGRAME Un.:"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,776 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,777 :: 		if(option==0) LCD_Chr(2,1,'1');               //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp526
	MOVLW       0
	XORWF       _option+0, 0 
L__disp526:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp164
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp164:
;TCC_5.c,778 :: 		if(option==1) LCD_Chr(2,1,'2');               //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp527
	MOVLW       1
	XORWF       _option+0, 0 
L__disp527:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp165
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp165:
;TCC_5.c,779 :: 		if(option==2) LCD_Chr(2,1,'3');               //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp528
	MOVLW       2
	XORWF       _option+0, 0 
L__disp528:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp166
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp166:
;TCC_5.c,780 :: 		if(option==3) LCD_Chr(2,1,'4');               //se option for 2, exibe "4"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp529
	MOVLW       3
	XORWF       _option+0, 0 
L__disp529:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp167
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       52
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp167:
;TCC_5.c,781 :: 		}
L_disp163:
;TCC_5.c,783 :: 		if(prog==3)                                     //programação de quantidade de comprimidos
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp530
	MOVLW       3
	XORWF       _prog+0, 0 
L__disp530:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp168
;TCC_5.c,785 :: 		LCD_Out(1,1,"Qtd. COMPRIMIDOS");               //exibe "Qtd. COMPRIMIDOS"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,786 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,787 :: 		if(option==0) LCD_Chr(2,1,'1');               //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp531
	MOVLW       0
	XORWF       _option+0, 0 
L__disp531:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp169
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp169:
;TCC_5.c,788 :: 		if(option==1) LCD_Chr(2,1,'2');               //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp532
	MOVLW       1
	XORWF       _option+0, 0 
L__disp532:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp170
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp170:
;TCC_5.c,789 :: 		if(option==2) LCD_Chr(2,1,'3');               //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp533
	MOVLW       2
	XORWF       _option+0, 0 
L__disp533:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp171
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp171:
;TCC_5.c,790 :: 		if(option==3) LCD_Chr(2,1,'4');               //se option for 2, exibe "4"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp534
	MOVLW       3
	XORWF       _option+0, 0 
L__disp534:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp172
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       52
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp172:
;TCC_5.c,791 :: 		}
L_disp168:
;TCC_5.c,793 :: 		if(ligar)                                       //se ligar for 1 (ligado)
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_disp173
;TCC_5.c,795 :: 		LCD_Out(1,1,"DISP  TEMPO  Qtd");               //exibe "CONTANDO:   DISP";
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,796 :: 		if(temp_disp>20) temp_disp=0x00;               //se temp_disp for maior que 20, zera temp_disp
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_disp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp535
	MOVF        _temp_disp+0, 0 
	SUBLW       20
L__disp535:
	BTFSC       STATUS+0, 0 
	GOTO        L_disp174
	CLRF        _temp_disp+0 
	CLRF        _temp_disp+1 
L_disp174:
;TCC_5.c,797 :: 		if(temp_disp == 20)                            //se temp_disp for 20 (2 segundos)
	MOVLW       0
	XORWF       _temp_disp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp536
	MOVLW       20
	XORWF       _temp_disp+0, 0 
L__disp536:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp175
;TCC_5.c,799 :: 		temp_disp=0x00;                               //zera temp_disp
	CLRF        _temp_disp+0 
	CLRF        _temp_disp+1 
;TCC_5.c,800 :: 		option++;                                     //incrementa option
	INFSNZ      _option+0, 1 
	INCF        _option+1, 1 
;TCC_5.c,801 :: 		if(option == 4) option=0x00;                  //se option for 3, option = 0
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp537
	MOVLW       4
	XORWF       _option+0, 0 
L__disp537:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp176
	CLRF        _option+0 
	CLRF        _option+1 
L_disp176:
;TCC_5.c,802 :: 		if(option==0) LCD_Chr(2,1,'1');              //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp538
	MOVLW       0
	XORWF       _option+0, 0 
L__disp538:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp177
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp177:
;TCC_5.c,803 :: 		if(option==1) LCD_Chr(2,1,'2');              //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp539
	MOVLW       1
	XORWF       _option+0, 0 
L__disp539:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp178
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp178:
;TCC_5.c,804 :: 		if(option==2) LCD_Chr(2,1,'3');              //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp540
	MOVLW       2
	XORWF       _option+0, 0 
L__disp540:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp179
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp179:
;TCC_5.c,805 :: 		if(option==3) LCD_Chr(2,1,'4');              //se option for 2, exibe "4"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp541
	MOVLW       3
	XORWF       _option+0, 0 
L__disp541:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp180
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       52
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp180:
;TCC_5.c,806 :: 		}
L_disp175:
;TCC_5.c,807 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,808 :: 		}
L_disp173:
;TCC_5.c,810 :: 		}                                                 //end disp()
L_end_disp:
	RETURN      0
; end of _disp

_num_un:

;TCC_5.c,816 :: 		void num_un()
;TCC_5.c,820 :: 		if(option==0)                                    //se option for 0 (dispenser n° 1 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un543
	MOVLW       0
	XORWF       _option+0, 0 
L__num_un543:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un181
;TCC_5.c,822 :: 		dig2 = num/10;                                  //dígito 2 é igual a num dividido por 10
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _num+0, 0 
	MOVWF       R0 
	MOVF        _num+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__num_un+0 
	MOVF        R1, 0 
	MOVWF       FLOC__num_un+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _num+0, 0 
	MOVWF       R0 
	MOVF        _num+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
;TCC_5.c,823 :: 		dig1 = num%10;                                  //digito 1 é igual a sobra da divisão de num por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,825 :: 		LCD_Chr(2,7,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,826 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,828 :: 		if(!un) LCD_Out(2,10,hora);                      //se un for zero, exibe "hora"
	BTFSC       _un+0, BitPos(_un+0) 
	GOTO        L_num_un182
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un182:
;TCC_5.c,830 :: 		if(un) LCD_Out(2,10,dia);                        //se un for um, exibe "dia"
	BTFSS       _un+0, BitPos(_un+0) 
	GOTO        L_num_un183
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un183:
;TCC_5.c,832 :: 		}                                                //end if option==0
L_num_un181:
;TCC_5.c,835 :: 		if(option==1)                                    //se option for 1 (dispenser n°2 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un544
	MOVLW       1
	XORWF       _option+0, 0 
L__num_un544:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un184
;TCC_5.c,837 :: 		dig2 = num2/10;                                 //digito 2 é igual a num2 dividido por 10
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _num2+0, 0 
	MOVWF       R0 
	MOVF        _num2+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__num_un+0 
	MOVF        R1, 0 
	MOVWF       FLOC__num_un+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _num2+0, 0 
	MOVWF       R0 
	MOVF        _num2+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
;TCC_5.c,838 :: 		dig1 = num2%10;                                 //digito 1 é igual a sobra da divisão de num2 por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,840 :: 		LCD_Chr(2,7,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,841 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,843 :: 		if(!un2) LCD_Out(2,10,hora);                     //se un2 for zero, exibe "hora"
	BTFSC       _un2+0, BitPos(_un2+0) 
	GOTO        L_num_un185
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un185:
;TCC_5.c,845 :: 		if(un2) LCD_Out(2,10,dia);                       //se un2 for um, exibe "dia"
	BTFSS       _un2+0, BitPos(_un2+0) 
	GOTO        L_num_un186
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un186:
;TCC_5.c,847 :: 		}                                                //end if option==1
L_num_un184:
;TCC_5.c,849 :: 		if(option==2)                                    //se option for 2 (dispenser n°3 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un545
	MOVLW       2
	XORWF       _option+0, 0 
L__num_un545:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un187
;TCC_5.c,851 :: 		dig2 = num3/10;                                 //digito 2 é igual a num3 dividido por 10
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _num3+0, 0 
	MOVWF       R0 
	MOVF        _num3+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__num_un+0 
	MOVF        R1, 0 
	MOVWF       FLOC__num_un+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _num3+0, 0 
	MOVWF       R0 
	MOVF        _num3+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
;TCC_5.c,852 :: 		dig1 = num3%10;                                 //digito 1 é igual a sobra da divisão de num3 por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,854 :: 		LCD_Chr(2,7,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,855 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,857 :: 		if(!un3) LCD_Out(2,10,hora);                     //se un3 for zero, exibe "hora"
	BTFSC       _un3+0, BitPos(_un3+0) 
	GOTO        L_num_un188
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un188:
;TCC_5.c,859 :: 		if(un3) LCD_Out(2,10,dia);                       //se un3 for um, exibe "dia"
	BTFSS       _un3+0, BitPos(_un3+0) 
	GOTO        L_num_un189
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un189:
;TCC_5.c,861 :: 		}                                                //end if option==2
L_num_un187:
;TCC_5.c,863 :: 		if(option==3)                                    //se option for 3 (dispenser n°4 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un546
	MOVLW       3
	XORWF       _option+0, 0 
L__num_un546:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un190
;TCC_5.c,865 :: 		dig2 = num4/10;                                 //digito 2 é igual a num4 dividido por 10
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _num4+0, 0 
	MOVWF       R0 
	MOVF        _num4+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__num_un+0 
	MOVF        R1, 0 
	MOVWF       FLOC__num_un+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _num4+0, 0 
	MOVWF       R0 
	MOVF        _num4+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
;TCC_5.c,866 :: 		dig1 = num4%10;                                 //digito 1 é igual a sobra da divisão de num4 por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,868 :: 		LCD_Chr(2,7,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,869 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,871 :: 		if(!un4) LCD_Out(2,10,hora);                     //se u4 for zero, exibe "hora"
	BTFSC       _un4+0, BitPos(_un4+0) 
	GOTO        L_num_un191
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un191:
;TCC_5.c,873 :: 		if(un4) LCD_Out(2,10,dia);                       //se un4 for um, exibe "dia"
	BTFSS       _un4+0, BitPos(_un4+0) 
	GOTO        L_num_un192
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un192:
;TCC_5.c,875 :: 		}                                                //end if option==3
L_num_un190:
;TCC_5.c,878 :: 		if(option==0)                                   //se dispenser n°1 selecionado
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un547
	MOVLW       0
	XORWF       _option+0, 0 
L__num_un547:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un193
;TCC_5.c,881 :: 		LCD_Chr(2,15,digcomp+0x30);                    //soma digito 1 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _qtd_comp+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,882 :: 		}
L_num_un193:
;TCC_5.c,884 :: 		if(option==1)                                   //se dispenser n°2 selecionado
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un548
	MOVLW       1
	XORWF       _option+0, 0 
L__num_un548:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un194
;TCC_5.c,887 :: 		LCD_Chr(2,15,digcomp+0x30);                    //soma digito 1 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _qtd_comp2+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,888 :: 		}
L_num_un194:
;TCC_5.c,890 :: 		if(option==2)                                   //se dispenser n°3 selecionado
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un549
	MOVLW       2
	XORWF       _option+0, 0 
L__num_un549:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un195
;TCC_5.c,893 :: 		LCD_Chr(2,15,digcomp+0x30);                    //soma digito 1 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _qtd_comp3+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,894 :: 		}
L_num_un195:
;TCC_5.c,896 :: 		if(option==3)                                   //se dispenser n°4 selecionado
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un550
	MOVLW       3
	XORWF       _option+0, 0 
L__num_un550:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un196
;TCC_5.c,899 :: 		LCD_Chr(2,15,digcomp+0x30);                    //soma digito 1 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _qtd_comp4+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,900 :: 		}
L_num_un196:
;TCC_5.c,903 :: 		}                                                 //end num_un()
L_end_num_un:
	RETURN      0
; end of _num_un

_piscaLED:

;TCC_5.c,909 :: 		void piscaLED()
;TCC_5.c,912 :: 		if(ligar && !toque && num!=0)                   //se ligar for um(ligado), toque for zero e num diferente de zero...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED199
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L_piscaLED199
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED552
	MOVLW       0
	XORWF       _num+0, 0 
L__piscaLED552:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED199
L__piscaLED405:
;TCC_5.c,914 :: 		if(temp_led>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED553
	MOVLW       10
	SUBWF       _temp_led+0, 0 
L__piscaLED553:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED200
;TCC_5.c,916 :: 		temp_led = 0x00;                      //zera temp_led
	CLRF        _temp_led+0 
	CLRF        _temp_led+1 
;TCC_5.c,917 :: 		LED  = ~LED;                          //inverte LED de indicação do dispenser n°1
	BTG         PORTA+0, 0 
;TCC_5.c,918 :: 		}                                              //end if temp_led>=10
L_piscaLED200:
;TCC_5.c,920 :: 		}                                               //end if ligar && !toque && num!=0
	GOTO        L_piscaLED201
L_piscaLED199:
;TCC_5.c,924 :: 		if(ligar && toque)                             //se ligar for 1 e toque for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED204
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_piscaLED204
L__piscaLED404:
;TCC_5.c,926 :: 		if(temp_led>=2)                               //conta 200ms
	MOVLW       0
	SUBWF       _temp_led+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED554
	MOVLW       2
	SUBWF       _temp_led+0, 0 
L__piscaLED554:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED205
;TCC_5.c,928 :: 		temp_led=0x00;                               //zera temp_led
	CLRF        _temp_led+0 
	CLRF        _temp_led+1 
;TCC_5.c,929 :: 		LED = ~LED;                                  //inverte LED de indicação do dispenser n°1
	BTG         PORTA+0, 0 
;TCC_5.c,931 :: 		}                                             //end if temp_led>=2
L_piscaLED205:
;TCC_5.c,933 :: 		}                                              //end if ligar && toque
	GOTO        L_piscaLED206
L_piscaLED204:
;TCC_5.c,936 :: 		if(prog>0 && option==0)                       //se estiver em programação e dispenser n°1 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED555
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED555:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED209
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED556
	MOVLW       0
	XORWF       _option+0, 0 
L__piscaLED556:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED209
L__piscaLED403:
;TCC_5.c,938 :: 		LED = 0x01;                                  //LED do dispenser n°1 aceso
	BSF         PORTA+0, 0 
;TCC_5.c,939 :: 		}                                             //end if prog>0 && option==0
	GOTO        L_piscaLED210
L_piscaLED209:
;TCC_5.c,941 :: 		else LED = 0x00;                              //senão, LED do dispenser n°1 desligado
	BCF         PORTA+0, 0 
L_piscaLED210:
;TCC_5.c,943 :: 		}                                              //end else
L_piscaLED206:
;TCC_5.c,945 :: 		}                                               //end else
L_piscaLED201:
;TCC_5.c,949 :: 		if(temp_led2 ==5)                                //conta 500ms
	MOVLW       0
	XORWF       _temp_led2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED557
	MOVLW       5
	XORWF       _temp_led2+0, 0 
L__piscaLED557:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED211
;TCC_5.c,951 :: 		temp_led2=0x00;                                 //zera temp_led2
	CLRF        _temp_led2+0 
	CLRF        _temp_led2+1 
;TCC_5.c,952 :: 		LED2 = ~LED2;                                   //inverte estado do LED de indicação geral
	BTG         PORTA+0, 3 
;TCC_5.c,954 :: 		}                                                //end if temp_led==5
L_piscaLED211:
;TCC_5.c,956 :: 		if(ligar && !toque2 && num2!=0)                  //se ligar for 1, toque 2 for 0 e num2 diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED214
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_piscaLED214
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED558
	MOVLW       0
	XORWF       _num2+0, 0 
L__piscaLED558:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED214
L__piscaLED402:
;TCC_5.c,958 :: 		if(temp_led3>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED559
	MOVLW       10
	SUBWF       _temp_led3+0, 0 
L__piscaLED559:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED215
;TCC_5.c,960 :: 		temp_led3 = 0x00;                              //zera temp_led3
	CLRF        _temp_led3+0 
	CLRF        _temp_led3+1 
;TCC_5.c,961 :: 		LED3 = ~LED3;                                  //inverte estado do LED de indicação do dispenser n°2
	BTG         PORTB+0, 0 
;TCC_5.c,963 :: 		}                                               //end if temp_led3>=10
L_piscaLED215:
;TCC_5.c,965 :: 		}                                                //end if ligar && !toque2 && num2!=0
	GOTO        L_piscaLED216
L_piscaLED214:
;TCC_5.c,969 :: 		if(ligar && toque2)                             //se ligar e toque2 for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED219
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_piscaLED219
L__piscaLED401:
;TCC_5.c,971 :: 		if(temp_led3>=2)                               //conta 200 milisegundos
	MOVLW       0
	SUBWF       _temp_led3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED560
	MOVLW       2
	SUBWF       _temp_led3+0, 0 
L__piscaLED560:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED220
;TCC_5.c,973 :: 		temp_led3=0x00;                               //zera temp_led3
	CLRF        _temp_led3+0 
	CLRF        _temp_led3+1 
;TCC_5.c,974 :: 		LED3 = ~LED3;                                 //inverte estado do LED de indicação do dispenser n°2
	BTG         PORTB+0, 0 
;TCC_5.c,976 :: 		}                                              //end if temp_led3>=2
L_piscaLED220:
;TCC_5.c,978 :: 		}                                               //end if ligar && toque2
	GOTO        L_piscaLED221
L_piscaLED219:
;TCC_5.c,982 :: 		if(prog>0 && option==1)                        //se estiver em programação e dispenser n°2 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED561
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED561:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED224
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED562
	MOVLW       1
	XORWF       _option+0, 0 
L__piscaLED562:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED224
L__piscaLED400:
;TCC_5.c,984 :: 		LED3 = 0x01;                                  //LED do dispenser n°2 aceso
	BSF         PORTB+0, 0 
;TCC_5.c,985 :: 		}                                              //end if prog>0 && option==1
	GOTO        L_piscaLED225
L_piscaLED224:
;TCC_5.c,987 :: 		else LED3 = 0x00;                               //senão, LED do dispenser n°2 desligado
	BCF         PORTB+0, 0 
L_piscaLED225:
;TCC_5.c,989 :: 		}                                               //end else
L_piscaLED221:
;TCC_5.c,991 :: 		}                                                //end else
L_piscaLED216:
;TCC_5.c,993 :: 		if(ligar && !toque3 && num3!=0)                  //se ligar for 1, toque3 for 0 e num3 diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED228
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_piscaLED228
	MOVLW       0
	XORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED563
	MOVLW       0
	XORWF       _num3+0, 0 
L__piscaLED563:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED228
L__piscaLED399:
;TCC_5.c,995 :: 		if(temp_led4>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED564
	MOVLW       10
	SUBWF       _temp_led4+0, 0 
L__piscaLED564:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED229
;TCC_5.c,997 :: 		temp_led4 = 0x00;                              //zera temp_led4
	CLRF        _temp_led4+0 
	CLRF        _temp_led4+1 
;TCC_5.c,998 :: 		LED4 = ~LED4;                                  //inverte estado do LED de indicação do dispenser n°3
	BTG         PORTB+0, 1 
;TCC_5.c,1000 :: 		}                                               //end if temp_led4>=10
L_piscaLED229:
;TCC_5.c,1002 :: 		}                                                //end if ligar && !toque3 && num3!=0
	GOTO        L_piscaLED230
L_piscaLED228:
;TCC_5.c,1006 :: 		if(ligar && toque3)                             //se ligar e toque3 for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED233
	BTFSS       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_piscaLED233
L__piscaLED398:
;TCC_5.c,1008 :: 		if(temp_led4>=2)                               //conta 200 milisegundos
	MOVLW       0
	SUBWF       _temp_led4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED565
	MOVLW       2
	SUBWF       _temp_led4+0, 0 
L__piscaLED565:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED234
;TCC_5.c,1010 :: 		temp_led4=0x00;                               //zera temp_led4
	CLRF        _temp_led4+0 
	CLRF        _temp_led4+1 
;TCC_5.c,1011 :: 		LED4 = ~LED4;                                 //inverte estado do LED de indicação do dispenser n°3
	BTG         PORTB+0, 1 
;TCC_5.c,1013 :: 		}                                              //end if temp_led4>=2
L_piscaLED234:
;TCC_5.c,1015 :: 		}                                               //end if ligar && toque3
	GOTO        L_piscaLED235
L_piscaLED233:
;TCC_5.c,1019 :: 		if(prog>0 && option==2)                        //se estiver em programação e dispenser n°3 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED566
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED566:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED238
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED567
	MOVLW       2
	XORWF       _option+0, 0 
L__piscaLED567:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED238
L__piscaLED397:
;TCC_5.c,1021 :: 		LED4 = 0x01;                                  //LED do dispenser n°3 aceso
	BSF         PORTB+0, 1 
;TCC_5.c,1022 :: 		}                                              //end if prog>0 && option==2
	GOTO        L_piscaLED239
L_piscaLED238:
;TCC_5.c,1024 :: 		else LED4 = 0x00;                               //senão, LED do dispenser n°3 desligado
	BCF         PORTB+0, 1 
L_piscaLED239:
;TCC_5.c,1026 :: 		}                                               //end else
L_piscaLED235:
;TCC_5.c,1028 :: 		}                                                //end else
L_piscaLED230:
;TCC_5.c,1031 :: 		if(ligar && !toque4 && num4!=0)                  //se ligar for 1, toque4 for 0 e num4 diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED242
	BTFSC       _toque4+0, BitPos(_toque4+0) 
	GOTO        L_piscaLED242
	MOVLW       0
	XORWF       _num4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED568
	MOVLW       0
	XORWF       _num4+0, 0 
L__piscaLED568:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED242
L__piscaLED396:
;TCC_5.c,1033 :: 		if(temp_led5>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED569
	MOVLW       10
	SUBWF       _temp_led5+0, 0 
L__piscaLED569:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED243
;TCC_5.c,1035 :: 		temp_led5 = 0x00;                              //zera temp_led5
	CLRF        _temp_led5+0 
	CLRF        _temp_led5+1 
;TCC_5.c,1036 :: 		LED5 = ~LED5;                                  //inverte estado do LED de indicação do dispenser n°4
	BTG         PORTB+0, 3 
;TCC_5.c,1038 :: 		}                                               //end if temp_led5>=10
L_piscaLED243:
;TCC_5.c,1040 :: 		}                                                //end if ligar && !toque4 && num4!=0
	GOTO        L_piscaLED244
L_piscaLED242:
;TCC_5.c,1044 :: 		if(ligar && toque4)                             //se ligar e toque4 for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED247
	BTFSS       _toque4+0, BitPos(_toque4+0) 
	GOTO        L_piscaLED247
L__piscaLED395:
;TCC_5.c,1046 :: 		if(temp_led5>=2)                               //conta 200 milisegundos
	MOVLW       0
	SUBWF       _temp_led5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED570
	MOVLW       2
	SUBWF       _temp_led5+0, 0 
L__piscaLED570:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED248
;TCC_5.c,1048 :: 		temp_led5=0x00;                               //zera temp_led5
	CLRF        _temp_led5+0 
	CLRF        _temp_led5+1 
;TCC_5.c,1049 :: 		LED5 = ~LED5;                                 //inverte estado do LED de indicação do dispenser n°4
	BTG         PORTB+0, 3 
;TCC_5.c,1051 :: 		}                                              //end if temp_led5>=2
L_piscaLED248:
;TCC_5.c,1053 :: 		}                                               //end if ligar && toque4
	GOTO        L_piscaLED249
L_piscaLED247:
;TCC_5.c,1057 :: 		if(prog>0 && option==3)                        //se estiver em programação e dispenser n°4 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED571
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED571:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED252
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED572
	MOVLW       3
	XORWF       _option+0, 0 
L__piscaLED572:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED252
L__piscaLED394:
;TCC_5.c,1059 :: 		LED5 = 0x01;                                  //LED do dispenser n°4 aceso
	BSF         PORTB+0, 3 
;TCC_5.c,1060 :: 		}                                              //end if prog>0 && option==3
	GOTO        L_piscaLED253
L_piscaLED252:
;TCC_5.c,1062 :: 		else LED5 = 0x00;                               //senão, LED do dispenser n°4 desligado
	BCF         PORTB+0, 3 
L_piscaLED253:
;TCC_5.c,1064 :: 		}                                               //end else
L_piscaLED249:
;TCC_5.c,1066 :: 		}                                                //end else
L_piscaLED244:
;TCC_5.c,1068 :: 		}                                                 //end piscaLED()
L_end_piscaLED:
	RETURN      0
; end of _piscaLED

_timebase:

;TCC_5.c,1075 :: 		void timebase()
;TCC_5.c,1077 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase254
;TCC_5.c,1079 :: 		temp_ligado = 0x00;                            //zera temp_ligado
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
;TCC_5.c,1080 :: 		}
L_timebase254:
;TCC_5.c,1081 :: 		if(ligar && num!=0)                             //se ligar for 1 e num diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase257
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase574
	MOVLW       0
	XORWF       _num+0, 0 
L__timebase574:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase257
L__timebase406:
;TCC_5.c,1083 :: 		if(temp==10)                                   //conta 1 segundo
	MOVLW       0
	XORWF       _temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase575
	MOVLW       10
	XORWF       _temp+0, 0 
L__timebase575:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase258
;TCC_5.c,1085 :: 		temp = 0x00;                                  //zera temp
	CLRF        _temp+0 
	CLRF        _temp+1 
;TCC_5.c,1086 :: 		temp_ligado++;                                //incrementa temp_ligado a cada 1 segundo
	INFSNZ      _temp_ligado+0, 1 
	INCF        _temp_ligado+1, 1 
;TCC_5.c,1088 :: 		}                                              //end if temp==10
L_timebase258:
;TCC_5.c,1090 :: 		if(temp_ligado==mult)                          //compara a igualdade de temp_ligado com mult
	MOVF        _temp_ligado+1, 0 
	XORWF       _mult+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase576
	MOVF        _mult+0, 0 
	XORWF       _temp_ligado+0, 0 
L__timebase576:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase259
;TCC_5.c,1092 :: 		toque = 0x01;                                 //liga o bit toque
	BSF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,1093 :: 		atv_mot = 0x01;                               //liga o bit de ativação do motor
	BSF         _atv_mot+0, BitPos(_atv_mot+0) 
;TCC_5.c,1094 :: 		comp = qtd_comp;
	MOVF        _qtd_comp+0, 0 
	MOVWF       _comp+0 
	MOVF        _qtd_comp+1, 0 
	MOVWF       _comp+1 
;TCC_5.c,1095 :: 		abre_mot();                                   //define os bits de controle do motor para abri-lo
	CALL        _abre_mot+0, 0
;TCC_5.c,1097 :: 		}                                              //end if temp_ligado==mult
L_timebase259:
;TCC_5.c,1099 :: 		if(atv_mot)                                    //se ativação do motor for ligada...
	BTFSS       _atv_mot+0, BitPos(_atv_mot+0) 
	GOTO        L_timebase260
;TCC_5.c,1101 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,1103 :: 		}                                              //end if atv_mot
	GOTO        L_timebase261
L_timebase260:
;TCC_5.c,1107 :: 		alarme();                                     //executa o alarme
	CALL        _alarme+0, 0
;TCC_5.c,1108 :: 		}
L_timebase261:
;TCC_5.c,1109 :: 		}                                               //end if ligar
L_timebase257:
;TCC_5.c,1111 :: 		}                                                 //end timebase()
L_end_timebase:
	RETURN      0
; end of _timebase

_timebase2:

;TCC_5.c,1118 :: 		void timebase2()
;TCC_5.c,1120 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase2262
;TCC_5.c,1122 :: 		temp_ligado2 = 0x00;                           //zera temp_ligado2
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
;TCC_5.c,1123 :: 		}
L_timebase2262:
;TCC_5.c,1125 :: 		if(ligar && num2!=0)                            //se ligar for 1 e num2 diferente de 0
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase2265
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2578
	MOVLW       0
	XORWF       _num2+0, 0 
L__timebase2578:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase2265
L__timebase2407:
;TCC_5.c,1127 :: 		if(temp2==10)                                  //conta 1 segundo
	MOVLW       0
	XORWF       _temp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2579
	MOVLW       10
	XORWF       _temp2+0, 0 
L__timebase2579:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase2266
;TCC_5.c,1129 :: 		temp2 = 0x00;                                 //zera temp2
	CLRF        _temp2+0 
	CLRF        _temp2+1 
;TCC_5.c,1130 :: 		temp_ligado2++;                               //incrementa temp_ligado2 a cada 1 segundo
	INFSNZ      _temp_ligado2+0, 1 
	INCF        _temp_ligado2+1, 1 
;TCC_5.c,1132 :: 		}                                              //end if temp2==10
L_timebase2266:
;TCC_5.c,1134 :: 		if(temp_ligado2==mult2)                        //compara igualdade entre temp_ligado2 e mult2
	MOVF        _temp_ligado2+1, 0 
	XORWF       _mult2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2580
	MOVF        _mult2+0, 0 
	XORWF       _temp_ligado2+0, 0 
L__timebase2580:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase2267
;TCC_5.c,1136 :: 		toque2 = 0x01;                                //liga o bit toque2
	BSF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,1137 :: 		atv_mot2 = 0x01;                              //liga o bit de aativação do motor 2
	BSF         _atv_mot2+0, BitPos(_atv_mot2+0) 
;TCC_5.c,1138 :: 		comp2 = qtd_comp2;
	MOVF        _qtd_comp2+0, 0 
	MOVWF       _comp2+0 
	MOVF        _qtd_comp2+1, 0 
	MOVWF       _comp2+1 
;TCC_5.c,1139 :: 		abre_mot2();                                  //define os bits de controle do motor 2 para abrir
	CALL        _abre_mot2+0, 0
;TCC_5.c,1141 :: 		}                                              //end if temp_ligado2==mult2
L_timebase2267:
;TCC_5.c,1143 :: 		if(atv_mot2)                                   //se ativação do motor 2 ligada...
	BTFSS       _atv_mot2+0, BitPos(_atv_mot2+0) 
	GOTO        L_timebase2268
;TCC_5.c,1145 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,1147 :: 		}                                              //end if atv_mot2
	GOTO        L_timebase2269
L_timebase2268:
;TCC_5.c,1151 :: 		alarme();                                     //aciona o alarme
	CALL        _alarme+0, 0
;TCC_5.c,1153 :: 		}                                              //end else
L_timebase2269:
;TCC_5.c,1155 :: 		}                                               //end if ligar && num2!=0
L_timebase2265:
;TCC_5.c,1157 :: 		}                                                 //end timebase2()
L_end_timebase2:
	RETURN      0
; end of _timebase2

_timebase3:

;TCC_5.c,1164 :: 		void timebase3()
;TCC_5.c,1166 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase3270
;TCC_5.c,1168 :: 		temp_ligado3 = 0x00;                           //zera temp_ligado3
	CLRF        _temp_ligado3+0 
	CLRF        _temp_ligado3+1 
;TCC_5.c,1169 :: 		}
L_timebase3270:
;TCC_5.c,1171 :: 		if(ligar && num3!=0)                            //se ligar for 1 e num3 diferente de 0
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase3273
	MOVLW       0
	XORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3582
	MOVLW       0
	XORWF       _num3+0, 0 
L__timebase3582:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase3273
L__timebase3408:
;TCC_5.c,1173 :: 		if(temp3==10)                                  //conta 1 segundo
	MOVLW       0
	XORWF       _temp3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3583
	MOVLW       10
	XORWF       _temp3+0, 0 
L__timebase3583:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase3274
;TCC_5.c,1175 :: 		temp3 = 0x00;                                 //zera temp3
	CLRF        _temp3+0 
	CLRF        _temp3+1 
;TCC_5.c,1176 :: 		temp_ligado3++;                               //incrementa temp_ligado3 a cada 1 segundo
	INFSNZ      _temp_ligado3+0, 1 
	INCF        _temp_ligado3+1, 1 
;TCC_5.c,1178 :: 		}                                              //end if temp3==10
L_timebase3274:
;TCC_5.c,1180 :: 		if(temp_ligado3==mult3)                        //compara igualdade entre temp_ligado3 e mult3
	MOVF        _temp_ligado3+1, 0 
	XORWF       _mult3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3584
	MOVF        _mult3+0, 0 
	XORWF       _temp_ligado3+0, 0 
L__timebase3584:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase3275
;TCC_5.c,1182 :: 		toque3 = 0x01;                                //liga o bit toque3
	BSF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,1183 :: 		atv_mot3 = 0x01;                              //liga o bit de aativação do motor 3
	BSF         _atv_mot3+0, BitPos(_atv_mot3+0) 
;TCC_5.c,1184 :: 		comp3 = qtd_comp3;
	MOVF        _qtd_comp3+0, 0 
	MOVWF       _comp3+0 
	MOVF        _qtd_comp3+1, 0 
	MOVWF       _comp3+1 
;TCC_5.c,1185 :: 		abre_mot3();                                  //define os bits de controle do motor 3 para abrir
	CALL        _abre_mot3+0, 0
;TCC_5.c,1187 :: 		}                                              //end if temp_ligado3==mult3
L_timebase3275:
;TCC_5.c,1189 :: 		if(atv_mot3)                                   //se ativação do motor 3 ligada...
	BTFSS       _atv_mot3+0, BitPos(_atv_mot3+0) 
	GOTO        L_timebase3276
;TCC_5.c,1191 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,1193 :: 		}                                              //end if atv_mot3
	GOTO        L_timebase3277
L_timebase3276:
;TCC_5.c,1197 :: 		alarme();                                     //aciona o alarme
	CALL        _alarme+0, 0
;TCC_5.c,1199 :: 		}                                              //end else
L_timebase3277:
;TCC_5.c,1201 :: 		}                                               //end if ligar && num3!=0
L_timebase3273:
;TCC_5.c,1203 :: 		}                                                 //end timebase3()
L_end_timebase3:
	RETURN      0
; end of _timebase3

_timebase4:

;TCC_5.c,1210 :: 		void timebase4()
;TCC_5.c,1212 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase4278
;TCC_5.c,1214 :: 		temp_ligado4 = 0x00;                           //zera temp_ligado4
	CLRF        _temp_ligado4+0 
	CLRF        _temp_ligado4+1 
;TCC_5.c,1215 :: 		}
L_timebase4278:
;TCC_5.c,1217 :: 		if(ligar && num4!=0)                            //se ligar for 1 e num4 diferente de 0
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase4281
	MOVLW       0
	XORWF       _num4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase4586
	MOVLW       0
	XORWF       _num4+0, 0 
L__timebase4586:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase4281
L__timebase4409:
;TCC_5.c,1219 :: 		if(temp4==10)                                  //conta 1 segundo
	MOVLW       0
	XORWF       _temp4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase4587
	MOVLW       10
	XORWF       _temp4+0, 0 
L__timebase4587:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase4282
;TCC_5.c,1221 :: 		temp4 = 0x00;                                 //zera temp4
	CLRF        _temp4+0 
	CLRF        _temp4+1 
;TCC_5.c,1222 :: 		temp_ligado4++;                               //incrementa temp_ligado4 a cada 1 segundo
	INFSNZ      _temp_ligado4+0, 1 
	INCF        _temp_ligado4+1, 1 
;TCC_5.c,1224 :: 		}                                              //end if temp3==10
L_timebase4282:
;TCC_5.c,1226 :: 		if(temp_ligado4==mult4)                        //compara igualdade entre temp_ligado4 e mult4
	MOVF        _temp_ligado4+1, 0 
	XORWF       _mult4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase4588
	MOVF        _mult4+0, 0 
	XORWF       _temp_ligado4+0, 0 
L__timebase4588:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase4283
;TCC_5.c,1228 :: 		toque4 = 0x01;                                //liga o bit toque4
	BSF         _toque4+0, BitPos(_toque4+0) 
;TCC_5.c,1229 :: 		atv_mot4 = 0x01;                              //liga o bit de ativação do motor 4
	BSF         _atv_mot4+0, BitPos(_atv_mot4+0) 
;TCC_5.c,1230 :: 		comp4 = qtd_comp4;
	MOVF        _qtd_comp4+0, 0 
	MOVWF       _comp4+0 
	MOVF        _qtd_comp4+1, 0 
	MOVWF       _comp4+1 
;TCC_5.c,1231 :: 		abre_mot4();                                  //define os bits de controle do motor 4 para abrir
	CALL        _abre_mot4+0, 0
;TCC_5.c,1233 :: 		}                                              //end if temp_ligado4==mult4
L_timebase4283:
;TCC_5.c,1235 :: 		if(atv_mot4)                                   //se ativação do motor 4 ligada...
	BTFSS       _atv_mot4+0, BitPos(_atv_mot4+0) 
	GOTO        L_timebase4284
;TCC_5.c,1237 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,1239 :: 		}                                              //end if atv_mot4
	GOTO        L_timebase4285
L_timebase4284:
;TCC_5.c,1243 :: 		alarme();                                     //aciona o alarme
	CALL        _alarme+0, 0
;TCC_5.c,1245 :: 		}                                              //end else
L_timebase4285:
;TCC_5.c,1247 :: 		}                                               //end if ligar && num4!=0
L_timebase4281:
;TCC_5.c,1249 :: 		}                                                 //end timebase4()
L_end_timebase4:
	RETURN      0
; end of _timebase4

_alarme:

;TCC_5.c,1255 :: 		void alarme()
;TCC_5.c,1257 :: 		if(toque || toque2 || toque3 || toque4)          //se toque, toque2, toque3 ou toque4 for 1
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L__alarme410
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L__alarme410
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L__alarme410
	BTFSC       _toque4+0, BitPos(_toque4+0) 
	GOTO        L__alarme410
	GOTO        L_alarme288
L__alarme410:
;TCC_5.c,1259 :: 		if(vezes <200)                                 //se vezes for menor que 200 (toca por 1 minuto)
	MOVLW       0
	SUBWF       _vezes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__alarme590
	MOVLW       200
	SUBWF       _vezes+0, 0 
L__alarme590:
	BTFSC       STATUS+0, 0 
	GOTO        L_alarme289
;TCC_5.c,1261 :: 		toca_som();                                   //executa a toca do SOM
	CALL        _toca_som+0, 0
;TCC_5.c,1262 :: 		}                                              //end if vezes<10
	GOTO        L_alarme290
L_alarme289:
;TCC_5.c,1266 :: 		if(toque)                                     //se toque for 1
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_alarme291
;TCC_5.c,1268 :: 		toque=0x00;                                  //limpa o bit toque
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,1269 :: 		temp_ligado=0x00;                            //zera temp_ligado para recomeçar a contagem
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
;TCC_5.c,1271 :: 		}                                             //end if toque
L_alarme291:
;TCC_5.c,1273 :: 		if(toque2)                                    //se toque2 for 1
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_alarme292
;TCC_5.c,1275 :: 		toque2=0x00;                                 //limpa o bit toque 2
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,1276 :: 		temp_ligado2=0x00;                           //zera temp_ligado2 para recomeçar a contagem
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
;TCC_5.c,1278 :: 		}                                             //end if toque2
L_alarme292:
;TCC_5.c,1280 :: 		if(toque3)                                    //se toque3 for 1
	BTFSS       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_alarme293
;TCC_5.c,1282 :: 		toque3=0x00;                                 //limpa o bit toque3
	BCF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,1283 :: 		temp_ligado3=0x00;                           //zera temp_ligado3 para recomeçar a contagem
	CLRF        _temp_ligado3+0 
	CLRF        _temp_ligado3+1 
;TCC_5.c,1285 :: 		}                                             //end if toque3
L_alarme293:
;TCC_5.c,1287 :: 		if(toque4)                                    //se toque4 for 1
	BTFSS       _toque4+0, BitPos(_toque4+0) 
	GOTO        L_alarme294
;TCC_5.c,1289 :: 		toque4=0x00;                                 //limpa o bit toque4
	BCF         _toque4+0, BitPos(_toque4+0) 
;TCC_5.c,1290 :: 		temp_ligado4=0x00;                           //zera temp_ligado4 para recomeçar a contagem
	CLRF        _temp_ligado4+0 
	CLRF        _temp_ligado4+1 
;TCC_5.c,1292 :: 		}                                             //end if toque4
L_alarme294:
;TCC_5.c,1294 :: 		vezes=0x00;                                  //zera vezes
	CLRF        _vezes+0 
	CLRF        _vezes+1 
;TCC_5.c,1295 :: 		SOM = 0x00;                                  //desliga o som
	BCF         PORTA+0, 2 
;TCC_5.c,1297 :: 		}                                              //end else
L_alarme290:
;TCC_5.c,1299 :: 		}                                                //end if toque || toque2 || toque3 || toque4
L_alarme288:
;TCC_5.c,1301 :: 		}                                                 //end alarme()
L_end_alarme:
	RETURN      0
; end of _alarme

_toca_som:

;TCC_5.c,1307 :: 		void toca_som()
;TCC_5.c,1309 :: 		if(temp_som>3) temp_som=0x00;                    //se temp_som for maior que 3, zera temp_som
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_som+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__toca_som592
	MOVF        _temp_som+0, 0 
	SUBLW       3
L__toca_som592:
	BTFSC       STATUS+0, 0 
	GOTO        L_toca_som295
	CLRF        _temp_som+0 
	CLRF        _temp_som+1 
L_toca_som295:
;TCC_5.c,1310 :: 		if(temp_som==3)                               //conta 300 milisegundos...
	MOVLW       0
	XORWF       _temp_som+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__toca_som593
	MOVLW       3
	XORWF       _temp_som+0, 0 
L__toca_som593:
	BTFSS       STATUS+0, 2 
	GOTO        L_toca_som296
;TCC_5.c,1312 :: 		temp_som = 0x00;                             //zera temp_som
	CLRF        _temp_som+0 
	CLRF        _temp_som+1 
;TCC_5.c,1313 :: 		SOM = ~SOM;                                  //inverte o estado do buzzer
	BTG         PORTA+0, 2 
;TCC_5.c,1314 :: 		vezes++;                                     //incrementa vezes
	INFSNZ      _vezes+0, 1 
	INCF        _vezes+1, 1 
;TCC_5.c,1316 :: 		if(!ligar)                                   //se ligar for 0 (desligado)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_toca_som297
;TCC_5.c,1318 :: 		vezes = 0x00;                               //zera vezes
	CLRF        _vezes+0 
	CLRF        _vezes+1 
;TCC_5.c,1319 :: 		SOM   = 0x00;                               //desliga o buzzer
	BCF         PORTA+0, 2 
;TCC_5.c,1321 :: 		}                                            //end if !ligar
L_toca_som297:
;TCC_5.c,1323 :: 		}                                             //end if temp_som==3
L_toca_som296:
;TCC_5.c,1325 :: 		}                                                 //end toca_som()
L_end_toca_som:
	RETURN      0
; end of _toca_som

_abre_mot:

;TCC_5.c,1332 :: 		void abre_mot()
;TCC_5.c,1334 :: 		open_bit  = 0x01;                                //seta bit de abertura
	BSF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,1335 :: 		close_bit = 0x00;                                //limpa bit de fechamento
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,1336 :: 		x_mot     = 0x00;                                //zera x_mot
	CLRF        _x_mot+0 
	CLRF        _x_mot+1 
;TCC_5.c,1338 :: 		}                                                 //end abre_mot()
L_end_abre_mot:
	RETURN      0
; end of _abre_mot

_abre_mot2:

;TCC_5.c,1345 :: 		void abre_mot2()
;TCC_5.c,1347 :: 		open_bit2  = 0x01;                               //seta bit de abertura
	BSF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,1348 :: 		close_bit2 = 0x00;                               //limpa bit de fechamento
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,1349 :: 		x_mot2     = 0x00;                               //zera x_mot
	CLRF        _x_mot2+0 
	CLRF        _x_mot2+1 
;TCC_5.c,1351 :: 		}                                                 //end abre_mot2()
L_end_abre_mot2:
	RETURN      0
; end of _abre_mot2

_abre_mot3:

;TCC_5.c,1358 :: 		void abre_mot3()
;TCC_5.c,1360 :: 		open_bit3  = 0x01;                               //seta bit de abertura
	BSF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,1361 :: 		close_bit3 = 0x00;                               //limpa bit de fechamento
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1362 :: 		x_mot3     = 0x00;                               //zera x_mot
	CLRF        _x_mot3+0 
	CLRF        _x_mot3+1 
;TCC_5.c,1364 :: 		}                                                 //end abre_mot3()
L_end_abre_mot3:
	RETURN      0
; end of _abre_mot3

_abre_mot4:

;TCC_5.c,1371 :: 		void abre_mot4()
;TCC_5.c,1373 :: 		open_bit4  = 0x01;                               //seta bit de abertura
	BSF         _open_bit4+0, BitPos(_open_bit4+0) 
;TCC_5.c,1374 :: 		close_bit4 = 0x00;                               //limpa bit de fechamento
	BCF         _close_bit4+0, BitPos(_close_bit4+0) 
;TCC_5.c,1375 :: 		x_mot4     = 0x00;                               //zera x_mot
	CLRF        _x_mot4+0 
	CLRF        _x_mot4+1 
;TCC_5.c,1377 :: 		}                                                 //end abre_mot4()
L_end_abre_mot4:
	RETURN      0
; end of _abre_mot4

_mot_aberto:

;TCC_5.c,1383 :: 		void mot_aberto()
;TCC_5.c,1385 :: 		if(comp!=0)                                      //se a quantidade de comprimidos a serem despejados
	MOVLW       0
	XORWF       _comp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto599
	MOVLW       0
	XORWF       _comp+0, 0 
L__mot_aberto599:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_aberto298
;TCC_5.c,1388 :: 		if(x_mot<20)                                     //se x_mot for menor que 10...
	MOVLW       0
	SUBWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto600
	MOVLW       20
	SUBWF       _x_mot+0, 0 
L__mot_aberto600:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto299
;TCC_5.c,1390 :: 		SM=0;                                         //  ||
	BCF         PORTA+0, 1 
;TCC_5.c,1391 :: 		delay_us(18000);                              //  ||
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto300:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto300
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto300
	NOP
	NOP
;TCC_5.c,1392 :: 		SM=1;                                         //  ||
	BSF         PORTA+0, 1 
;TCC_5.c,1393 :: 		delay_us(2000);                               //  \/
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto301:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto301
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto301
	NOP
;TCC_5.c,1394 :: 		SM=0;                                         // liga motor 1 no sentido horário
	BCF         PORTA+0, 1 
;TCC_5.c,1395 :: 		x_mot ++;                                     //incrementa x_mot
	INFSNZ      _x_mot+0, 1 
	INCF        _x_mot+1, 1 
;TCC_5.c,1397 :: 		}                                               //end if x_mot<10
L_mot_aberto299:
;TCC_5.c,1399 :: 		if(x_mot == 20)                                 //se x_mot for 10...
	MOVLW       0
	XORWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto601
	MOVLW       20
	XORWF       _x_mot+0, 0 
L__mot_aberto601:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto302
;TCC_5.c,1401 :: 		fecha_mot();                                  //executa a configuração dos bits de controle do motor 1 para fechar
	CALL        _fecha_mot+0, 0
;TCC_5.c,1403 :: 		}                                              //end if x_mot==10
L_mot_aberto302:
;TCC_5.c,1405 :: 		}                                                //end if comp!=0
	GOTO        L_mot_aberto303
L_mot_aberto298:
;TCC_5.c,1408 :: 		open_bit = 0x00;                                //limpa bit de abertura
	BCF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,1409 :: 		close_bit= 0x00;                                //limpa bit de fechamento
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,1410 :: 		}
L_mot_aberto303:
;TCC_5.c,1412 :: 		}                                                 //end mot_aberto()
L_end_mot_aberto:
	RETURN      0
; end of _mot_aberto

_mot_aberto2:

;TCC_5.c,1418 :: 		void mot_aberto2()
;TCC_5.c,1420 :: 		if(comp2!=0)                                      //se a quantidade de comprimidos a serem despejados
	MOVLW       0
	XORWF       _comp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2603
	MOVLW       0
	XORWF       _comp2+0, 0 
L__mot_aberto2603:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_aberto2304
;TCC_5.c,1422 :: 		if(x_mot2<20)                                    //se x_mot2 for menor que 10...
	MOVLW       0
	SUBWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2604
	MOVLW       20
	SUBWF       _x_mot2+0, 0 
L__mot_aberto2604:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto2305
;TCC_5.c,1424 :: 		SM2=0;                                        //  ||
	BCF         PORTA+0, 4 
;TCC_5.c,1425 :: 		delay_us(18000);                              //  ||
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto2306:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto2306
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto2306
	NOP
	NOP
;TCC_5.c,1426 :: 		SM2=1;                                        //  ||
	BSF         PORTA+0, 4 
;TCC_5.c,1427 :: 		delay_us(2000);                               //  \/
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto2307:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto2307
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto2307
	NOP
;TCC_5.c,1428 :: 		SM2=0;                                        //liga motor 2 no sentido horário
	BCF         PORTA+0, 4 
;TCC_5.c,1429 :: 		x_mot2 ++;                                    //incrementa x_mot2
	INFSNZ      _x_mot2+0, 1 
	INCF        _x_mot2+1, 1 
;TCC_5.c,1431 :: 		}                                               //end if x_mot2<10
L_mot_aberto2305:
;TCC_5.c,1433 :: 		if(x_mot2 == 20)                                //se x_mot2 for 10...
	MOVLW       0
	XORWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2605
	MOVLW       20
	XORWF       _x_mot2+0, 0 
L__mot_aberto2605:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto2308
;TCC_5.c,1435 :: 		fecha_mot2();                                 //executa a configuração dos bits de controle do motor 2 para fechar
	CALL        _fecha_mot2+0, 0
;TCC_5.c,1437 :: 		}                                              //end if x_mot2==10
L_mot_aberto2308:
;TCC_5.c,1438 :: 		}                                                //end if comp!=0
	GOTO        L_mot_aberto2309
L_mot_aberto2304:
;TCC_5.c,1441 :: 		open_bit2 = 0x00;                                //limpa bit de abertura
	BCF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,1442 :: 		close_bit2= 0x00;                                //limpa bit de fechamento
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,1443 :: 		}
L_mot_aberto2309:
;TCC_5.c,1445 :: 		}                                                 //end mot_aberto2()
L_end_mot_aberto2:
	RETURN      0
; end of _mot_aberto2

_mot_aberto3:

;TCC_5.c,1451 :: 		void mot_aberto3()
;TCC_5.c,1453 :: 		if(comp3!=0)                                     //se a quantidade de comprimidos a serem despejados
	MOVLW       0
	XORWF       _comp3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto3607
	MOVLW       0
	XORWF       _comp3+0, 0 
L__mot_aberto3607:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_aberto3310
;TCC_5.c,1455 :: 		if(x_mot3<20)                                    //se x_mot3 for menor que 10...
	MOVLW       0
	SUBWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto3608
	MOVLW       20
	SUBWF       _x_mot3+0, 0 
L__mot_aberto3608:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto3311
;TCC_5.c,1457 :: 		SM3=0;                                        //  ||
	BCF         PORTA+0, 5 
;TCC_5.c,1458 :: 		delay_us(18000);                              //  ||
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto3312:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto3312
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto3312
	NOP
	NOP
;TCC_5.c,1459 :: 		SM3=1;                                        //  ||
	BSF         PORTA+0, 5 
;TCC_5.c,1460 :: 		delay_us(2000);                               //  \/
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto3313:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto3313
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto3313
	NOP
;TCC_5.c,1461 :: 		SM3=0;                                        // liga motor 1 no sentido horário
	BCF         PORTA+0, 5 
;TCC_5.c,1462 :: 		x_mot3 ++;                                    //incrementa x_mot3
	INFSNZ      _x_mot3+0, 1 
	INCF        _x_mot3+1, 1 
;TCC_5.c,1464 :: 		}                                               //end if x_mot3<10
L_mot_aberto3311:
;TCC_5.c,1466 :: 		if(x_mot3 == 20)                                //se x_mot3 for 10...
	MOVLW       0
	XORWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto3609
	MOVLW       20
	XORWF       _x_mot3+0, 0 
L__mot_aberto3609:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto3314
;TCC_5.c,1468 :: 		fecha_mot3();                                 //executa a configuração dos bits de controle do motor 3 para fechar
	CALL        _fecha_mot3+0, 0
;TCC_5.c,1470 :: 		}                                              //end if x_mot3==10
L_mot_aberto3314:
;TCC_5.c,1471 :: 		}                                                //end if comp!=0
	GOTO        L_mot_aberto3315
L_mot_aberto3310:
;TCC_5.c,1474 :: 		open_bit3 = 0x00;                               //limpa bit de abertura
	BCF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,1475 :: 		close_bit3= 0x00;                               //limpa bit de fechamento
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1476 :: 		}
L_mot_aberto3315:
;TCC_5.c,1478 :: 		}                                                 //end mot_aberto3()
L_end_mot_aberto3:
	RETURN      0
; end of _mot_aberto3

_mot_aberto4:

;TCC_5.c,1484 :: 		void mot_aberto4()
;TCC_5.c,1486 :: 		if(comp4!=0)                                      //se a quantidade de comprimidos a serem despejados
	MOVLW       0
	XORWF       _comp4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto4611
	MOVLW       0
	XORWF       _comp4+0, 0 
L__mot_aberto4611:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_aberto4316
;TCC_5.c,1488 :: 		if(x_mot4<20)                                    //se x_mot4 for menor que 10...
	MOVLW       0
	SUBWF       _x_mot4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto4612
	MOVLW       20
	SUBWF       _x_mot4+0, 0 
L__mot_aberto4612:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto4317
;TCC_5.c,1490 :: 		SM4=0;                                        //  ||
	BCF         PORTB+0, 2 
;TCC_5.c,1491 :: 		delay_us(18000);                              //  ||
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto4318:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto4318
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto4318
	NOP
	NOP
;TCC_5.c,1492 :: 		SM4=1;                                        //  ||
	BSF         PORTB+0, 2 
;TCC_5.c,1493 :: 		delay_us(2000);                               //  \/
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto4319:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto4319
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto4319
	NOP
;TCC_5.c,1494 :: 		SM4=0;                                        // liga motor 1 no sentido horário
	BCF         PORTB+0, 2 
;TCC_5.c,1495 :: 		x_mot4 ++;                                    //incrementa x_mot4
	INFSNZ      _x_mot4+0, 1 
	INCF        _x_mot4+1, 1 
;TCC_5.c,1497 :: 		}                                               //end if x_mot4<10
L_mot_aberto4317:
;TCC_5.c,1499 :: 		if(x_mot4 == 20)                                //se x_mot4 for 10...
	MOVLW       0
	XORWF       _x_mot4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto4613
	MOVLW       20
	XORWF       _x_mot4+0, 0 
L__mot_aberto4613:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto4320
;TCC_5.c,1501 :: 		fecha_mot4();                                 //executa a configuração dos bits de controle do motor 4 para fechar
	CALL        _fecha_mot4+0, 0
;TCC_5.c,1503 :: 		}                                              //end if x_mot4==10
L_mot_aberto4320:
;TCC_5.c,1504 :: 		}                                                //end if comp!=0
	GOTO        L_mot_aberto4321
L_mot_aberto4316:
;TCC_5.c,1507 :: 		open_bit4 = 0x00;                                //limpa bit de abertura
	BCF         _open_bit4+0, BitPos(_open_bit4+0) 
;TCC_5.c,1508 :: 		close_bit4= 0x00;                                //limpa bit de fechamento
	BCF         _close_bit4+0, BitPos(_close_bit4+0) 
;TCC_5.c,1509 :: 		}
L_mot_aberto4321:
;TCC_5.c,1511 :: 		}                                                 //end mot_aberto4()
L_end_mot_aberto4:
	RETURN      0
; end of _mot_aberto4

_fecha_mot:

;TCC_5.c,1518 :: 		void fecha_mot()
;TCC_5.c,1520 :: 		open_bit  = 0x00;                                //limpa o bit de abertura
	BCF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,1521 :: 		close_bit = 0x01;                                //seta o bit de fechamento
	BSF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,1522 :: 		x_mot     = 0x00;                                //zera x_mot
	CLRF        _x_mot+0 
	CLRF        _x_mot+1 
;TCC_5.c,1524 :: 		}                                                 //end fecha_mot()
L_end_fecha_mot:
	RETURN      0
; end of _fecha_mot

_fecha_mot2:

;TCC_5.c,1531 :: 		void fecha_mot2()
;TCC_5.c,1533 :: 		open_bit2  = 0x00;                               //limpa o bit de abertura
	BCF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,1534 :: 		close_bit2 = 0x01;                               //seta o bit de fechamento
	BSF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,1535 :: 		x_mot2     = 0x00;                               //zera x_mot2
	CLRF        _x_mot2+0 
	CLRF        _x_mot2+1 
;TCC_5.c,1537 :: 		}                                                 //end fecha_mot2()
L_end_fecha_mot2:
	RETURN      0
; end of _fecha_mot2

_fecha_mot3:

;TCC_5.c,1544 :: 		void fecha_mot3()
;TCC_5.c,1546 :: 		open_bit3  = 0x00;                               //limpa o bit de abertura
	BCF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,1547 :: 		close_bit3 = 0x01;                               //seta o bit de fechamento
	BSF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1548 :: 		x_mot3     = 0x00;                               //zera x_mot3
	CLRF        _x_mot3+0 
	CLRF        _x_mot3+1 
;TCC_5.c,1550 :: 		}                                                 //end fecha_mot3()
L_end_fecha_mot3:
	RETURN      0
; end of _fecha_mot3

_fecha_mot4:

;TCC_5.c,1557 :: 		void fecha_mot4()
;TCC_5.c,1559 :: 		open_bit4  = 0x00;                               //limpa o bit de abertura
	BCF         _open_bit4+0, BitPos(_open_bit4+0) 
;TCC_5.c,1560 :: 		close_bit4 = 0x01;                               //seta o bit de fechamento
	BSF         _close_bit4+0, BitPos(_close_bit4+0) 
;TCC_5.c,1561 :: 		x_mot4     = 0x00;                               //zera x_mot4
	CLRF        _x_mot4+0 
	CLRF        _x_mot4+1 
;TCC_5.c,1563 :: 		}                                                 //end fecha_mot4()
L_end_fecha_mot4:
	RETURN      0
; end of _fecha_mot4

_mot_fechado:

;TCC_5.c,1569 :: 		void mot_fechado()
;TCC_5.c,1571 :: 		if(comp!=0)                                      //se a quantidade de comprimidos à despejar
	MOVLW       0
	XORWF       _comp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado619
	MOVLW       0
	XORWF       _comp+0, 0 
L__mot_fechado619:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_fechado322
;TCC_5.c,1573 :: 		if(x_mot<20)                                     //se x_mot for menor que 10
	MOVLW       0
	SUBWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado620
	MOVLW       20
	SUBWF       _x_mot+0, 0 
L__mot_fechado620:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado323
;TCC_5.c,1575 :: 		SM=0;                                         //  ||
	BCF         PORTA+0, 1 
;TCC_5.c,1576 :: 		delay_us(18500);                              //  ||
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado324:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado324
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado324
	NOP
	NOP
;TCC_5.c,1577 :: 		SM=1;                                         //  ||
	BSF         PORTA+0, 1 
;TCC_5.c,1578 :: 		delay_us(1500);                               //  \/
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado325:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado325
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado325
	NOP
;TCC_5.c,1579 :: 		SM=0;                                         //leva o motor para a posição inicial
	BCF         PORTA+0, 1 
;TCC_5.c,1580 :: 		x_mot++;                                      //incrementa x_mot
	INFSNZ      _x_mot+0, 1 
	INCF        _x_mot+1, 1 
;TCC_5.c,1582 :: 		}                                               //end if x_mot<10
L_mot_fechado323:
;TCC_5.c,1584 :: 		if(x_mot==20)                                   //se x_mot for 10
	MOVLW       0
	XORWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado621
	MOVLW       20
	XORWF       _x_mot+0, 0 
L__mot_fechado621:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado326
;TCC_5.c,1586 :: 		abre_mot();                                  //define os bit de controle do motor para abrir
	CALL        _abre_mot+0, 0
;TCC_5.c,1587 :: 		comp--;                                      //decrementa comp
	MOVLW       1
	SUBWF       _comp+0, 1 
	MOVLW       0
	SUBWFB      _comp+1, 1 
;TCC_5.c,1589 :: 		}                                             //end if x_mot==10
L_mot_fechado326:
;TCC_5.c,1591 :: 		}                                                //end if comp!=0
L_mot_fechado322:
;TCC_5.c,1593 :: 		}                                                 //end mot_fechado
L_end_mot_fechado:
	RETURN      0
; end of _mot_fechado

_mot_fechado2:

;TCC_5.c,1599 :: 		void mot_fechado2()
;TCC_5.c,1601 :: 		if(comp2!=0)                                      //se a quantidade de comprimidos à despejar
	MOVLW       0
	XORWF       _comp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2623
	MOVLW       0
	XORWF       _comp2+0, 0 
L__mot_fechado2623:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_fechado2327
;TCC_5.c,1603 :: 		if(x_mot2<20)                                   //se x_mot2 for menor que 10
	MOVLW       0
	SUBWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2624
	MOVLW       20
	SUBWF       _x_mot2+0, 0 
L__mot_fechado2624:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado2328
;TCC_5.c,1605 :: 		SM2=0;                                        //  ||
	BCF         PORTA+0, 4 
;TCC_5.c,1606 :: 		delay_us(18500);                              //  ||
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado2329:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado2329
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado2329
	NOP
	NOP
;TCC_5.c,1607 :: 		SM2=1;                                        //  ||
	BSF         PORTA+0, 4 
;TCC_5.c,1608 :: 		delay_us(1500);                               //  \/
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado2330:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado2330
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado2330
	NOP
;TCC_5.c,1609 :: 		SM2=0;                                        //leva o motor 2 para a posição inicial
	BCF         PORTA+0, 4 
;TCC_5.c,1610 :: 		x_mot2++;                                     //incrementa x_mot2
	INFSNZ      _x_mot2+0, 1 
	INCF        _x_mot2+1, 1 
;TCC_5.c,1612 :: 		}                                               //end if x_mot2<10
L_mot_fechado2328:
;TCC_5.c,1614 :: 		if(x_mot2==20)                                  //se x_mot2 for 10
	MOVLW       0
	XORWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2625
	MOVLW       20
	XORWF       _x_mot2+0, 0 
L__mot_fechado2625:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado2331
;TCC_5.c,1616 :: 		abre_mot2();                                 //define os bit de controle do motor para abrir
	CALL        _abre_mot2+0, 0
;TCC_5.c,1617 :: 		comp2--;                                     //decrementa comp2
	MOVLW       1
	SUBWF       _comp2+0, 1 
	MOVLW       0
	SUBWFB      _comp2+1, 1 
;TCC_5.c,1619 :: 		}                                             //end if x_mot2==10
L_mot_fechado2331:
;TCC_5.c,1621 :: 		}                                               //end if comp!=0
L_mot_fechado2327:
;TCC_5.c,1623 :: 		}                                                 //end mot_fechado2()
L_end_mot_fechado2:
	RETURN      0
; end of _mot_fechado2

_mot_fechado3:

;TCC_5.c,1629 :: 		void mot_fechado3()
;TCC_5.c,1631 :: 		if(comp3!=0)                                      //se a quantidade de comprimidos à despejar
	MOVLW       0
	XORWF       _comp3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado3627
	MOVLW       0
	XORWF       _comp3+0, 0 
L__mot_fechado3627:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_fechado3332
;TCC_5.c,1633 :: 		if(x_mot3<20)                                   //se x_mot3 for menor que 10
	MOVLW       0
	SUBWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado3628
	MOVLW       20
	SUBWF       _x_mot3+0, 0 
L__mot_fechado3628:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado3333
;TCC_5.c,1635 :: 		SM3=0;                                        //  ||
	BCF         PORTA+0, 5 
;TCC_5.c,1636 :: 		delay_us(18500);                              //  ||
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado3334:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado3334
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado3334
	NOP
	NOP
;TCC_5.c,1637 :: 		SM3=1;                                        //  ||
	BSF         PORTA+0, 5 
;TCC_5.c,1638 :: 		delay_us(1500);                               //  \/
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado3335:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado3335
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado3335
	NOP
;TCC_5.c,1639 :: 		SM3=0;                                        //leva o motor 3 para a posição inicial
	BCF         PORTA+0, 5 
;TCC_5.c,1640 :: 		x_mot3++;                                     //incrementa x_mot3
	INFSNZ      _x_mot3+0, 1 
	INCF        _x_mot3+1, 1 
;TCC_5.c,1642 :: 		}                                               //end if x_mot2<10
L_mot_fechado3333:
;TCC_5.c,1644 :: 		if(x_mot3==20)                                  //se x_mot3 for 10
	MOVLW       0
	XORWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado3629
	MOVLW       20
	XORWF       _x_mot3+0, 0 
L__mot_fechado3629:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado3336
;TCC_5.c,1646 :: 		abre_mot3();                                 //define os bit de controle do motor para abrir
	CALL        _abre_mot3+0, 0
;TCC_5.c,1647 :: 		comp3--;                                     //decrementa comp3
	MOVLW       1
	SUBWF       _comp3+0, 1 
	MOVLW       0
	SUBWFB      _comp3+1, 1 
;TCC_5.c,1649 :: 		}                                             //end if x_mot3==10
L_mot_fechado3336:
;TCC_5.c,1651 :: 		}                                                //end if comp3!=0
L_mot_fechado3332:
;TCC_5.c,1653 :: 		}                                                 //end mot_fechado3()
L_end_mot_fechado3:
	RETURN      0
; end of _mot_fechado3

_mot_fechado4:

;TCC_5.c,1659 :: 		void mot_fechado4()
;TCC_5.c,1661 :: 		if(comp4!=0)                                      //se a quantidade de comprimidos à despejar
	MOVLW       0
	XORWF       _comp4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado4631
	MOVLW       0
	XORWF       _comp4+0, 0 
L__mot_fechado4631:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_fechado4337
;TCC_5.c,1663 :: 		if(x_mot4<20)                                   //se x_mot4 for menor que 10
	MOVLW       0
	SUBWF       _x_mot4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado4632
	MOVLW       20
	SUBWF       _x_mot4+0, 0 
L__mot_fechado4632:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado4338
;TCC_5.c,1665 :: 		SM4=0;                                        //  ||
	BCF         PORTB+0, 2 
;TCC_5.c,1666 :: 		delay_us(18500);                              //  ||
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado4339:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado4339
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado4339
	NOP
	NOP
;TCC_5.c,1667 :: 		SM4=1;                                        //  ||
	BSF         PORTB+0, 2 
;TCC_5.c,1668 :: 		delay_us(1500);                               //  \/
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado4340:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado4340
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado4340
	NOP
;TCC_5.c,1669 :: 		SM4=0;                                        //leva o motor 4 para a posição inicial
	BCF         PORTB+0, 2 
;TCC_5.c,1670 :: 		x_mot4++;                                     //incrementa x_mot4
	INFSNZ      _x_mot4+0, 1 
	INCF        _x_mot4+1, 1 
;TCC_5.c,1672 :: 		}                                               //end if x_mot4<10
L_mot_fechado4338:
;TCC_5.c,1674 :: 		if(x_mot4==20)                                  //se x_mot4 for 10
	MOVLW       0
	XORWF       _x_mot4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado4633
	MOVLW       20
	XORWF       _x_mot4+0, 0 
L__mot_fechado4633:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado4341
;TCC_5.c,1676 :: 		abre_mot4();                                 //define os bit de controle do motor para abrir
	CALL        _abre_mot4+0, 0
;TCC_5.c,1677 :: 		comp4--;                                     //decrementa comp4
	MOVLW       1
	SUBWF       _comp4+0, 1 
	MOVLW       0
	SUBWFB      _comp4+1, 1 
;TCC_5.c,1679 :: 		}                                             //end if x_mot4==10
L_mot_fechado4341:
;TCC_5.c,1681 :: 		}                                                //end if comp4!=0
L_mot_fechado4337:
;TCC_5.c,1683 :: 		}                                                 //end mot_fechado4()
L_end_mot_fechado4:
	RETURN      0
; end of _mot_fechado4

_read_motbits:

;TCC_5.c,1690 :: 		void read_motbits()
;TCC_5.c,1692 :: 		if(!open_bit && !close_bit) atv_mot = 0x00;    //se os bits de abertura e fechamento do motor 1 forem 0,
	BTFSC       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits344
	BTFSC       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits344
L__read_motbits422:
	BCF         _atv_mot+0, BitPos(_atv_mot+0) 
L_read_motbits344:
;TCC_5.c,1695 :: 		if(open_bit && !close_bit)                     //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits347
	BTFSC       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits347
L__read_motbits421:
;TCC_5.c,1697 :: 		mot_aberto();                                 //executa a abertura do motor 1
	CALL        _mot_aberto+0, 0
;TCC_5.c,1699 :: 		}                                              //end if open_bit && !close_bit
L_read_motbits347:
;TCC_5.c,1701 :: 		if(!open_bit && close_bit)                     //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits350
	BTFSS       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits350
L__read_motbits420:
;TCC_5.c,1703 :: 		mot_fechado();                                //executa o fechamento do motor 1
	CALL        _mot_fechado+0, 0
;TCC_5.c,1705 :: 		}                                              //end if !open_bit && close_bit
L_read_motbits350:
;TCC_5.c,1708 :: 		if(!open_bit2 && !close_bit2) atv_mot2 = 0x00; //se os bits de abertura e fechamento do motor 2 forem 0,
	BTFSC       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits353
	BTFSC       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits353
L__read_motbits419:
	BCF         _atv_mot2+0, BitPos(_atv_mot2+0) 
L_read_motbits353:
;TCC_5.c,1711 :: 		if(open_bit2 && !close_bit2)                   //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits356
	BTFSC       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits356
L__read_motbits418:
;TCC_5.c,1713 :: 		mot_aberto2();                                //executa a abertura do motor 2
	CALL        _mot_aberto2+0, 0
;TCC_5.c,1715 :: 		}                                              //end if open_bit2 && !close_bit2
L_read_motbits356:
;TCC_5.c,1717 :: 		if(!open_bit2 && close_bit2)                   //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits359
	BTFSS       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits359
L__read_motbits417:
;TCC_5.c,1719 :: 		mot_fechado2();                               //executa o fechamento do motor 2
	CALL        _mot_fechado2+0, 0
;TCC_5.c,1721 :: 		}                                              //end if !open_bit2 && close_bit2
L_read_motbits359:
;TCC_5.c,1724 :: 		if(!open_bit3 && !close_bit3) atv_mot3 = 0x00; //se os bits de abertura e fechamento do motor 3 forem 0,
	BTFSC       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits362
	BTFSC       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits362
L__read_motbits416:
	BCF         _atv_mot3+0, BitPos(_atv_mot3+0) 
L_read_motbits362:
;TCC_5.c,1727 :: 		if(open_bit3 && !close_bit3)                   //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits365
	BTFSC       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits365
L__read_motbits415:
;TCC_5.c,1729 :: 		mot_aberto3();                                //executa a abertura do motor 3
	CALL        _mot_aberto3+0, 0
;TCC_5.c,1731 :: 		}                                              //end if open_bit3 && !close_bit3
L_read_motbits365:
;TCC_5.c,1733 :: 		if(!open_bit3 && close_bit3)                   //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits368
	BTFSS       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits368
L__read_motbits414:
;TCC_5.c,1735 :: 		mot_fechado3();                               //executa o fechamento do motor 3
	CALL        _mot_fechado3+0, 0
;TCC_5.c,1737 :: 		}                                              //end if !open_bit3 && close_bit3
L_read_motbits368:
;TCC_5.c,1740 :: 		if(!open_bit4 && !close_bit4) atv_mot4 = 0x00; //se os bits de abertura e fechamento do motor 4 forem 0,
	BTFSC       _open_bit4+0, BitPos(_open_bit4+0) 
	GOTO        L_read_motbits371
	BTFSC       _close_bit4+0, BitPos(_close_bit4+0) 
	GOTO        L_read_motbits371
L__read_motbits413:
	BCF         _atv_mot4+0, BitPos(_atv_mot4+0) 
L_read_motbits371:
;TCC_5.c,1743 :: 		if(open_bit4 && !close_bit4)                   //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit4+0, BitPos(_open_bit4+0) 
	GOTO        L_read_motbits374
	BTFSC       _close_bit4+0, BitPos(_close_bit4+0) 
	GOTO        L_read_motbits374
L__read_motbits412:
;TCC_5.c,1745 :: 		mot_aberto4();                                //executa a abertura do motor 4
	CALL        _mot_aberto4+0, 0
;TCC_5.c,1747 :: 		}                                              //end if open_bit4 && !close_bit4
L_read_motbits374:
;TCC_5.c,1749 :: 		if(!open_bit4 && close_bit4)                   //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit4+0, BitPos(_open_bit4+0) 
	GOTO        L_read_motbits377
	BTFSS       _close_bit4+0, BitPos(_close_bit4+0) 
	GOTO        L_read_motbits377
L__read_motbits411:
;TCC_5.c,1751 :: 		mot_fechado4();                               //executa o fechamento do motor 4
	CALL        _mot_fechado4+0, 0
;TCC_5.c,1753 :: 		}                                              //end if !open_bit4 && close_bit4
L_read_motbits377:
;TCC_5.c,1755 :: 		}                                                 //end read_motbits()
L_end_read_motbits:
	RETURN      0
; end of _read_motbits
