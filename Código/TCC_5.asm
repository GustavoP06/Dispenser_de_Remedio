
_interrupt:

;TCC_5.c,123 :: 		void interrupt()                          //interrupção
;TCC_5.c,125 :: 		if(TMR1IF_bit)                       //overflow em 100ms
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt0
;TCC_5.c,127 :: 		TMR1IF_bit  =  0x00;                //zera flag do timer1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;TCC_5.c,128 :: 		TMR1H       =  0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;TCC_5.c,129 :: 		TMR1L       =  0xB0;                //seta timer1 em 15536
	MOVLW       176
	MOVWF       TMR1L+0 
;TCC_5.c,130 :: 		temp_led++;                         //incrementa temp_led
	INFSNZ      _temp_led+0, 1 
	INCF        _temp_led+1, 1 
;TCC_5.c,131 :: 		temp_led2++;                        //incrementa temp_led2
	INFSNZ      _temp_led2+0, 1 
	INCF        _temp_led2+1, 1 
;TCC_5.c,132 :: 		temp_led3++;                        //incrementa temp_led3
	INFSNZ      _temp_led3+0, 1 
	INCF        _temp_led3+1, 1 
;TCC_5.c,133 :: 		temp_led4++;                        //incrementa temp_led4
	INFSNZ      _temp_led4+0, 1 
	INCF        _temp_led4+1, 1 
;TCC_5.c,134 :: 		temp_disp++;                        //incrementa temp_disp
	INFSNZ      _temp_disp+0, 1 
	INCF        _temp_disp+1, 1 
;TCC_5.c,135 :: 		temp_som++;                         //incrementa temp_som
	INFSNZ      _temp_som+0, 1 
	INCF        _temp_som+1, 1 
;TCC_5.c,136 :: 		}
L_interrupt0:
;TCC_5.c,138 :: 		if(TMR0IF_bit)                        //overflow em 100ms overflow
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt1
;TCC_5.c,140 :: 		TMR0IF_bit =  0x00;                  //zera flag do timer0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;TCC_5.c,141 :: 		TMR0H      =  0x3C;
	MOVLW       60
	MOVWF       TMR0H+0 
;TCC_5.c,142 :: 		TMR0L      =  0xB0;                  //seta timer0 em 15536
	MOVLW       176
	MOVWF       TMR0L+0 
;TCC_5.c,143 :: 		temp++;                              //incrementa temp
	INFSNZ      _temp+0, 1 
	INCF        _temp+1, 1 
;TCC_5.c,144 :: 		temp2++;                             //incrementa temp2
	INFSNZ      _temp2+0, 1 
	INCF        _temp2+1, 1 
;TCC_5.c,145 :: 		temp3++;                             //incrementa temp3
	INFSNZ      _temp3+0, 1 
	INCF        _temp3+1, 1 
;TCC_5.c,147 :: 		}                                     //end if TMR0IF
L_interrupt1:
;TCC_5.c,151 :: 		piscaLED();                           //executa piscaLED
	CALL        _piscaLED+0, 0
;TCC_5.c,152 :: 		timebase();                           //executa timebase
	CALL        _timebase+0, 0
;TCC_5.c,153 :: 		timebase2();                          //executa timebase2
	CALL        _timebase2+0, 0
;TCC_5.c,154 :: 		timebase3();
	CALL        _timebase3+0, 0
;TCC_5.c,157 :: 		}                                          //end interrupt()
L_end_interrupt:
L__interrupt250:
	RETFIE      1
; end of _interrupt

_main:

;TCC_5.c,163 :: 		void main (void)
;TCC_5.c,168 :: 		ADCON1        =   0x0F;                   //Define os pinos como digital
	MOVLW       15
	MOVWF       ADCON1+0 
;TCC_5.c,169 :: 		CMCON         =   0x07;                   //Desativa os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;TCC_5.c,171 :: 		TMR0H         =   0x3C;
	MOVLW       60
	MOVWF       TMR0H+0 
;TCC_5.c,172 :: 		TMR0L         =   0xB0;                   //Inicia timer0 em 15536
	MOVLW       176
	MOVWF       TMR0L+0 
;TCC_5.c,173 :: 		TMR1H         =   0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;TCC_5.c,174 :: 		TMR1L         =   0xB0;                   //Inicia TMR1 em 15536
	MOVLW       176
	MOVWF       TMR1L+0 
;TCC_5.c,177 :: 		INTCON.GIE    =   0x01;                   //Ativa interrupção global
	BSF         INTCON+0, 7 
;TCC_5.c,178 :: 		INTCON.PEIE   =   0x01;                   //Ativa interrupção por periféricos
	BSF         INTCON+0, 6 
;TCC_5.c,179 :: 		INTCON.TMR0IE =   0x01;                   //Ativa interrupção por overflow
	BSF         INTCON+0, 5 
;TCC_5.c,181 :: 		TMR0IF_bit    =   0x00;                   //zera a flag do timer0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;TCC_5.c,182 :: 		TMR1IF_bit    =   0x00;                   //zera a flag do timer1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;TCC_5.c,185 :: 		INTCON2.RBPU  =   0x01;                   //Desliga os resistores de pull-ups do portB
	BSF         INTCON2+0, 7 
;TCC_5.c,186 :: 		T0CON         =   0x81;                   //TMR0 16 bits, prescaler 1:4
	MOVLW       129
	MOVWF       T0CON+0 
;TCC_5.c,187 :: 		T1CON         =   0xA1;                   //TMR1 16 bits, prescaler 1:4
	MOVLW       161
	MOVWF       T1CON+0 
;TCC_5.c,190 :: 		ligar         =   0x00;                   //     |
	BCF         _ligar+0, BitPos(_ligar+0) 
;TCC_5.c,191 :: 		b1_flag       =   0x00;                   //     |
	BCF         _b1_flag+0, BitPos(_b1_flag+0) 
;TCC_5.c,192 :: 		b2_flag       =   0x00;                   //     |
	BCF         _b2_flag+0, BitPos(_b2_flag+0) 
;TCC_5.c,193 :: 		b3_flag       =   0x00;                   //     |
	BCF         _b3_flag+0, BitPos(_b3_flag+0) 
;TCC_5.c,194 :: 		b4_flag       =   0x00;                   //     |
	BCF         _b4_flag+0, BitPos(_b4_flag+0) 
;TCC_5.c,195 :: 		b5_flag       =   0x00;                   //     |
	BCF         _b5_flag+0, BitPos(_b5_flag+0) 
;TCC_5.c,196 :: 		display       =   0x00;                   //     |
	BCF         _display+0, BitPos(_display+0) 
;TCC_5.c,197 :: 		toque         =   0x00;                   //     |
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,198 :: 		toque2        =   0x00;                   //     |
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,199 :: 		toque3        =   0x00;                   //     |
	BCF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,200 :: 		open_bit      =   0x00;                   //     |
	BCF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,201 :: 		open_bit2     =   0x00;                   //     |
	BCF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,202 :: 		open_bit3     =   0x00;                   //     |
	BCF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,203 :: 		close_bit     =   0x00;                   //     |
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,204 :: 		close_bit2    =   0x00;                   //     |
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,205 :: 		close_bit3    =   0x00;                   //     |
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,206 :: 		atv_mot       =   0x00;                   //     |
	BCF         _atv_mot+0, BitPos(_atv_mot+0) 
;TCC_5.c,207 :: 		atv_mot2      =   0x00;                   //     |
	BCF         _atv_mot2+0, BitPos(_atv_mot2+0) 
;TCC_5.c,208 :: 		atv_mot3      =   0x00;                   //    \ /
	BCF         _atv_mot3+0, BitPos(_atv_mot3+0) 
;TCC_5.c,210 :: 		SM            =   0x00;                   //zerando todos os bits
	BCF         PORTA+0, 1 
;TCC_5.c,212 :: 		num           =   EEPROM_Read(0x01);      //lê os dados da EEPROM para variável num
	MOVLW       1
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVLW       0
	MOVWF       _num+1 
;TCC_5.c,213 :: 		un            =   EEPROM_Read(0x03);      //lê os dados da EEPROM para variável un
	MOVLW       3
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main252
	BCF         _un+0, BitPos(_un+0) 
	GOTO        L__main253
L__main252:
	BSF         _un+0, BitPos(_un+0) 
L__main253:
;TCC_5.c,214 :: 		num2          =   EEPROM_Read(0x02);      //lê os dados da EEPROM para variável num2
	MOVLW       2
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num2+0 
	MOVLW       0
	MOVWF       _num2+1 
;TCC_5.c,215 :: 		un2           =   EEPROM_Read(0x04);      //lê os dados da EEPROM para variável un2
	MOVLW       4
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main254
	BCF         _un2+0, BitPos(_un2+0) 
	GOTO        L__main255
L__main254:
	BSF         _un2+0, BitPos(_un2+0) 
L__main255:
;TCC_5.c,216 :: 		num3          =   EEPROM_Read(0x05);      //lê os dados da EEPROM para variável num3
	MOVLW       5
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num3+0 
	MOVLW       0
	MOVWF       _num3+1 
;TCC_5.c,217 :: 		un3           =   EEPROM_Read(0x06);      //lê os dados da EEPROM para variável un3
	MOVLW       6
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main256
	BCF         _un3+0, BitPos(_un3+0) 
	GOTO        L__main257
L__main256:
	BSF         _un3+0, BitPos(_un3+0) 
L__main257:
;TCC_5.c,219 :: 		TRISA = 0x00;                             //seta todos os bits do TRISA como saída
	CLRF        TRISA+0 
;TCC_5.c,220 :: 		TRISC = 0x3F;                             //seta os bits 0,1,2,3,5 como entrada
	MOVLW       63
	MOVWF       TRISC+0 
;TCC_5.c,221 :: 		TRISB = 0x00;                             //seta todos os bits do TRISB como saída
	CLRF        TRISB+0 
;TCC_5.c,223 :: 		LCD_Init();                               //inicia o LCD
	CALL        _Lcd_Init+0, 0
;TCC_5.c,224 :: 		LCD_Cmd(_LCD_CLEAR);                      //limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,225 :: 		LCD_Cmd(_LCD_CURSOR_OFF);                 //desliga cursor do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,227 :: 		while(1)                                         //loop infinito
L_main2:
;TCC_5.c,229 :: 		ler_bot();                                     //executa ler_bot
	CALL        _ler_bot+0, 0
;TCC_5.c,231 :: 		disp();                                        //executa disp
	CALL        _disp+0, 0
;TCC_5.c,232 :: 		}                                                //end while
	GOTO        L_main2
;TCC_5.c,234 :: 		}                                                 //end main
L_end_main:
	GOTO        $+0
; end of _main

_ler_bot:

;TCC_5.c,239 :: 		void ler_bot()
;TCC_5.c,242 :: 		if(!BOTAO1) b1_flag=0x01;                       //se botão1 for pressionado, flag do botão1 = 1
	BTFSC       PORTC+0, 0 
	GOTO        L_ler_bot4
	BSF         _b1_flag+0, BitPos(_b1_flag+0) 
L_ler_bot4:
;TCC_5.c,244 :: 		if(BOTAO1 && b1_flag)                           //se botão1 estiver solto e flag do botão1 = 1
	BTFSS       PORTC+0, 0 
	GOTO        L_ler_bot7
	BTFSS       _b1_flag+0, BitPos(_b1_flag+0) 
	GOTO        L_ler_bot7
L__ler_bot225:
;TCC_5.c,246 :: 		LCD_Cmd(_LCD_CLEAR);                           //limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,247 :: 		b1_flag = 0x00;                                //lmpa a flag do botão1
	BCF         _b1_flag+0, BitPos(_b1_flag+0) 
;TCC_5.c,248 :: 		if(!ligar)                                     //se bit ligar = 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot8
;TCC_5.c,250 :: 		prog++;                                       //incrementa prog, muda a programação
	INFSNZ      _prog+0, 1 
	INCF        _prog+1, 1 
;TCC_5.c,251 :: 		if(prog==3)                                   //se prog = 3
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot259
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot259:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot9
;TCC_5.c,253 :: 		prog=0x00;                                   //zera a variável prog
	CLRF        _prog+0 
	CLRF        _prog+1 
;TCC_5.c,254 :: 		EEPROM_Write(0x01,num);                      //grava num na EEPROM
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,255 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot10:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot10
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot10
	NOP
;TCC_5.c,256 :: 		EEPROM_Write(0x03,un);                       //grava un na EEPROM
	MOVLW       3
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un+0, BitPos(_un+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,257 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot11:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot11
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot11
	NOP
;TCC_5.c,258 :: 		EEPROM_Write(0x02,num2);                     //grava num2 na EEPROM
	MOVLW       2
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num2+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,259 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot12:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot12
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot12
	NOP
;TCC_5.c,260 :: 		EEPROM_Write(0x04,un2);                      //grava un2 na EEPROM
	MOVLW       4
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un2+0, BitPos(_un2+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,261 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_ler_bot13:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot13
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot13
	NOP
;TCC_5.c,262 :: 		EEPROM_Write(0x05,num3);                     //grava num3 na EEPROM
	MOVLW       5
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num3+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,263 :: 		delay_ms(10);                                //espera 10 micro segundos
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
;TCC_5.c,264 :: 		EEPROM_Write(0x06,un3);                      //grava un3 na EEPROM
	MOVLW       6
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un3+0, BitPos(_un3+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,265 :: 		delay_ms(10);                                //espera 10 micro segundos
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
;TCC_5.c,266 :: 		display=0x01;                                //bit display em 1
	BSF         _display+0, BitPos(_display+0) 
;TCC_5.c,268 :: 		}                                             //end if prog = 3
L_ler_bot9:
;TCC_5.c,270 :: 		}                                              //end if !ligar
L_ler_bot8:
;TCC_5.c,272 :: 		}                                               //end if BOTAO1 && b1_flag
L_ler_bot7:
;TCC_5.c,277 :: 		if(!BOTAO2) b2_flag=0x01;                       //se botão2 for pressionado, flag do botão2 = 1
	BTFSC       PORTC+0, 1 
	GOTO        L_ler_bot16
	BSF         _b2_flag+0, BitPos(_b2_flag+0) 
L_ler_bot16:
;TCC_5.c,279 :: 		if(BOTAO2 && b2_flag)                           //se botão2 for solto e flag do botão2 for 1
	BTFSS       PORTC+0, 1 
	GOTO        L_ler_bot19
	BTFSS       _b2_flag+0, BitPos(_b2_flag+0) 
	GOTO        L_ler_bot19
L__ler_bot224:
;TCC_5.c,281 :: 		LCD_Cmd(_LCD_CLEAR);                          //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,282 :: 		b2_flag    =  0x00;                           //limpa flag do botão
	BCF         _b2_flag+0, BitPos(_b2_flag+0) 
;TCC_5.c,283 :: 		if(option==0)                                  //dispenser n°1
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot260
	MOVLW       0
	XORWF       _option+0, 0 
L__ler_bot260:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot20
;TCC_5.c,285 :: 		if(prog==1)                                   //programação de numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot261
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot261:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot21
;TCC_5.c,287 :: 		num++;                                       //incrementa num
	INFSNZ      _num+0, 1 
	INCF        _num+1, 1 
;TCC_5.c,288 :: 		}
L_ler_bot21:
;TCC_5.c,289 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot262
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot262:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot22
;TCC_5.c,291 :: 		un = ~un;                                   //inverte un
	BTG         _un+0, BitPos(_un+0) 
;TCC_5.c,292 :: 		}                                             //end if prog==2
L_ler_bot22:
;TCC_5.c,293 :: 		}                                              //end if option==0
L_ler_bot20:
;TCC_5.c,295 :: 		if(option==1)                                  //dispenser n°2
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot263
	MOVLW       1
	XORWF       _option+0, 0 
L__ler_bot263:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot23
;TCC_5.c,297 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot264
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot264:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot24
;TCC_5.c,299 :: 		num2++;                                      //incrementa num2
	INFSNZ      _num2+0, 1 
	INCF        _num2+1, 1 
;TCC_5.c,300 :: 		}
L_ler_bot24:
;TCC_5.c,301 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot265
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot265:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot25
;TCC_5.c,303 :: 		un2 = ~un2;                                 //inverte un2
	BTG         _un2+0, BitPos(_un2+0) 
;TCC_5.c,304 :: 		}
L_ler_bot25:
;TCC_5.c,305 :: 		}                                              //end if option==1
L_ler_bot23:
;TCC_5.c,307 :: 		if(option==2)                                  //dispenser n°3
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot266
	MOVLW       2
	XORWF       _option+0, 0 
L__ler_bot266:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot26
;TCC_5.c,309 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot267
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot267:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot27
;TCC_5.c,311 :: 		num3++;                                      //incrementa num3
	INFSNZ      _num3+0, 1 
	INCF        _num3+1, 1 
;TCC_5.c,312 :: 		}
L_ler_bot27:
;TCC_5.c,313 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot268
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot268:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot28
;TCC_5.c,315 :: 		un3 = ~un3;                                 //inverte un3
	BTG         _un3+0, BitPos(_un3+0) 
;TCC_5.c,316 :: 		}
L_ler_bot28:
;TCC_5.c,317 :: 		}                                              //end if option==2
L_ler_bot26:
;TCC_5.c,319 :: 		}                                               //end if BOTAO2 e b2_flag
L_ler_bot19:
;TCC_5.c,322 :: 		if(!BOTAO3) b3_flag=0x01;                       //se botão3 for pressionado, flag do botão3 = 1
	BTFSC       PORTC+0, 2 
	GOTO        L_ler_bot29
	BSF         _b3_flag+0, BitPos(_b3_flag+0) 
L_ler_bot29:
;TCC_5.c,324 :: 		if(BOTAO3 && b3_flag)                           //se botão3 for solto e flag do botão3 for 1
	BTFSS       PORTC+0, 2 
	GOTO        L_ler_bot32
	BTFSS       _b3_flag+0, BitPos(_b3_flag+0) 
	GOTO        L_ler_bot32
L__ler_bot223:
;TCC_5.c,326 :: 		LCD_Cmd(_LCD_CLEAR);                           //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,327 :: 		b3_flag     =  0x00;                           //limpa flag do botão3
	BCF         _b3_flag+0, BitPos(_b3_flag+0) 
;TCC_5.c,328 :: 		if(option==0)                                  //dispenser n°1
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot269
	MOVLW       0
	XORWF       _option+0, 0 
L__ler_bot269:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot33
;TCC_5.c,330 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot270
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot270:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot34
;TCC_5.c,332 :: 		num--;                                       //decrementa num
	MOVLW       1
	SUBWF       _num+0, 1 
	MOVLW       0
	SUBWFB      _num+1, 1 
;TCC_5.c,334 :: 		}
L_ler_bot34:
;TCC_5.c,335 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot271
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot271:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot35
;TCC_5.c,337 :: 		un = ~un;                                    //inverte un
	BTG         _un+0, BitPos(_un+0) 
;TCC_5.c,338 :: 		}
L_ler_bot35:
;TCC_5.c,339 :: 		}                                              //end if option==0
L_ler_bot33:
;TCC_5.c,341 :: 		if(option==1)                                  //dispenser n°2
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot272
	MOVLW       1
	XORWF       _option+0, 0 
L__ler_bot272:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot36
;TCC_5.c,343 :: 		if(prog==1)                                   //programação do número
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot273
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot273:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot37
;TCC_5.c,345 :: 		num2--;                                      //decrementa num2
	MOVLW       1
	SUBWF       _num2+0, 1 
	MOVLW       0
	SUBWFB      _num2+1, 1 
;TCC_5.c,347 :: 		}
L_ler_bot37:
;TCC_5.c,348 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot274
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot274:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot38
;TCC_5.c,350 :: 		un2 = ~un2;                                  //inverte un2
	BTG         _un2+0, BitPos(_un2+0) 
;TCC_5.c,351 :: 		}
L_ler_bot38:
;TCC_5.c,352 :: 		}                                              //end if option==1
L_ler_bot36:
;TCC_5.c,354 :: 		if(option==2)                                  //dispenser n°3
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot275
	MOVLW       2
	XORWF       _option+0, 0 
L__ler_bot275:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot39
;TCC_5.c,356 :: 		if(prog==1)                                   //programação do número
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot276
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot276:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot40
;TCC_5.c,358 :: 		num3--;                                      //decrementa num3
	MOVLW       1
	SUBWF       _num3+0, 1 
	MOVLW       0
	SUBWFB      _num3+1, 1 
;TCC_5.c,360 :: 		}
L_ler_bot40:
;TCC_5.c,361 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot277
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot277:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot41
;TCC_5.c,363 :: 		un3 = ~un3;                                  //inverte un3
	BTG         _un3+0, BitPos(_un3+0) 
;TCC_5.c,364 :: 		}
L_ler_bot41:
;TCC_5.c,365 :: 		}                                              //end if option==2
L_ler_bot39:
;TCC_5.c,367 :: 		}                                               //end if botão3 e b3_flag
L_ler_bot32:
;TCC_5.c,370 :: 		if(!BOTAO4) b4_flag=0x01;                       //se botão4 for pressionado, flag do botão4 = 1
	BTFSC       PORTC+0, 4 
	GOTO        L_ler_bot42
	BSF         _b4_flag+0, BitPos(_b4_flag+0) 
L_ler_bot42:
;TCC_5.c,372 :: 		if(BOTAO4 && b4_flag)                           //se botão4 for solto e flag do botão4 for 1
	BTFSS       PORTC+0, 4 
	GOTO        L_ler_bot45
	BTFSS       _b4_flag+0, BitPos(_b4_flag+0) 
	GOTO        L_ler_bot45
L__ler_bot222:
;TCC_5.c,374 :: 		LCD_Cmd(_LCD_CLEAR);                          //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,375 :: 		b4_flag    =  0x00;                           //limpa flag do botão4
	BCF         _b4_flag+0, BitPos(_b4_flag+0) 
;TCC_5.c,376 :: 		if(num!=0 || num2!=0 || num3)                  //se num, num2 ou num3 for diferente 0
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot278
	MOVLW       0
	XORWF       _num+0, 0 
L__ler_bot278:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot221
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot279
	MOVLW       0
	XORWF       _num2+0, 0 
L__ler_bot279:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot221
	MOVF        _num3+0, 0 
	IORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot221
	GOTO        L_ler_bot48
L__ler_bot221:
;TCC_5.c,378 :: 		if(prog==0)                                   //se prog = 0
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot280
	MOVLW       0
	XORWF       _prog+0, 0 
L__ler_bot280:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot49
;TCC_5.c,380 :: 		if(!ligar)                                   //se bit de ligar = 0 (desligado)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot50
;TCC_5.c,382 :: 		temp =0x00;                                 //zera temp
	CLRF        _temp+0 
	CLRF        _temp+1 
;TCC_5.c,383 :: 		temp2=0x00;                                 //zera temp2
	CLRF        _temp2+0 
	CLRF        _temp2+1 
;TCC_5.c,384 :: 		temp3=0x00;                                 //zera temp3
	CLRF        _temp3+0 
	CLRF        _temp3+1 
;TCC_5.c,386 :: 		}                                            //end if !ligar
L_ler_bot50:
;TCC_5.c,387 :: 		ligar = ~ligar;                              //inverte ligar
	BTG         _ligar+0, BitPos(_ligar+0) 
;TCC_5.c,388 :: 		if(!ligar) display2 = 0x01;                  //se ligar for 0, bit display2 = 1
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot51
	BSF         _display2+0, BitPos(_display2+0) 
L_ler_bot51:
;TCC_5.c,390 :: 		}                                             //end if prog==0
L_ler_bot49:
;TCC_5.c,392 :: 		}                                              //end if num!=0 || num2!=0
L_ler_bot48:
;TCC_5.c,394 :: 		}                                               //end if BOTAO4 && b4_flag
L_ler_bot45:
;TCC_5.c,396 :: 		if(!un)                                         //se un = 0
	BTFSC       _un+0, BitPos(_un+0) 
	GOTO        L_ler_bot52
;TCC_5.c,398 :: 		mult = num * 1;                                //mult é num * 3600 (hora)
	MOVF        _num+0, 0 
	MOVWF       _mult+0 
	MOVF        _num+1, 0 
	MOVWF       _mult+1 
;TCC_5.c,399 :: 		}
L_ler_bot52:
;TCC_5.c,400 :: 		if(un)                                          //se un = 1
	BTFSS       _un+0, BitPos(_un+0) 
	GOTO        L_ler_bot53
;TCC_5.c,402 :: 		mult = num * 5;                                //mult é num * 86400 (dia)
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
;TCC_5.c,403 :: 		}
L_ler_bot53:
;TCC_5.c,405 :: 		if(!un2)                                        //se un2 = 0
	BTFSC       _un2+0, BitPos(_un2+0) 
	GOTO        L_ler_bot54
;TCC_5.c,407 :: 		mult2 = num2 * 1;                              //mult2 é num2 * 3600 (hora)
	MOVF        _num2+0, 0 
	MOVWF       _mult2+0 
	MOVF        _num2+1, 0 
	MOVWF       _mult2+1 
;TCC_5.c,408 :: 		}
L_ler_bot54:
;TCC_5.c,409 :: 		if(un2)                                         //se un2 = 1
	BTFSS       _un2+0, BitPos(_un2+0) 
	GOTO        L_ler_bot55
;TCC_5.c,411 :: 		mult2 = num2 * 5;                              //mult2 é num2 * 86400 (dia)
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
;TCC_5.c,412 :: 		}
L_ler_bot55:
;TCC_5.c,414 :: 		if(!un3)                                        //se un3 = 0
	BTFSC       _un3+0, BitPos(_un3+0) 
	GOTO        L_ler_bot56
;TCC_5.c,416 :: 		mult3 = num3 * 1;                              //mult3 é num3 * 3600 (hora)
	MOVF        _num3+0, 0 
	MOVWF       _mult3+0 
	MOVF        _num3+1, 0 
	MOVWF       _mult3+1 
;TCC_5.c,417 :: 		}
L_ler_bot56:
;TCC_5.c,418 :: 		if(un3)                                         //se un3 = 1
	BTFSS       _un3+0, BitPos(_un3+0) 
	GOTO        L_ler_bot57
;TCC_5.c,420 :: 		mult3 = num3 * 5;                              //mult3 é num3 * 86400 (dia)
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
;TCC_5.c,421 :: 		}
L_ler_bot57:
;TCC_5.c,424 :: 		if(!BOTAO5) b5_flag = 0x01;                     //se botão5 for pressionado, flag do botão5 = 1
	BTFSC       PORTC+0, 5 
	GOTO        L_ler_bot58
	BSF         _b5_flag+0, BitPos(_b5_flag+0) 
L_ler_bot58:
;TCC_5.c,426 :: 		if(BOTAO5 && b5_flag)                           //se botão5 for solto e flag do botão5 for 1
	BTFSS       PORTC+0, 5 
	GOTO        L_ler_bot61
	BTFSS       _b5_flag+0, BitPos(_b5_flag+0) 
	GOTO        L_ler_bot61
L__ler_bot220:
;TCC_5.c,428 :: 		LCD_Cmd(_LCD_CLEAR);                           //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,429 :: 		b5_flag = 0x00;                                //limpa flag do botão5
	BCF         _b5_flag+0, BitPos(_b5_flag+0) 
;TCC_5.c,430 :: 		if(prog != 0)                                  //se prog for diferente de 0
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot281
	MOVLW       0
	XORWF       _prog+0, 0 
L__ler_bot281:
	BTFSC       STATUS+0, 2 
	GOTO        L_ler_bot62
;TCC_5.c,432 :: 		option++;                                     //incrementa option
	INFSNZ      _option+0, 1 
	INCF        _option+1, 1 
;TCC_5.c,433 :: 		if(option == 3) option=0x00;                  //se option for 3, option = 0
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot282
	MOVLW       3
	XORWF       _option+0, 0 
L__ler_bot282:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot63
	CLRF        _option+0 
	CLRF        _option+1 
L_ler_bot63:
;TCC_5.c,434 :: 		}
L_ler_bot62:
;TCC_5.c,435 :: 		}                                               //end if BOTAO5 && b5_flag
L_ler_bot61:
;TCC_5.c,437 :: 		}                                                 //end ler_bot()
L_end_ler_bot:
	RETURN      0
; end of _ler_bot

_disp:

;TCC_5.c,442 :: 		void disp()
;TCC_5.c,444 :: 		if(!ligar && prog==0)                           //se ligar for 0 e prog for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_disp66
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp284
	MOVLW       0
	XORWF       _prog+0, 0 
L__disp284:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp66
L__disp229:
;TCC_5.c,446 :: 		if(!display && !display2)                      //se os bits diplay e display2 forem 0
	BTFSC       _display+0, BitPos(_display+0) 
	GOTO        L_disp69
	BTFSC       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp69
L__disp228:
;TCC_5.c,448 :: 		LCD_Out(1,1,"  DISPENSER DE  ");             //exibe "DISPENSER DE"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,449 :: 		LCD_Out(2,1,"    REMEDIOS    ");             //      "  REMEDIOS  "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,450 :: 		}
	GOTO        L_disp70
L_disp69:
;TCC_5.c,453 :: 		if(display && !display2)                      //se bits display for 1 e display2 for 0
	BTFSS       _display+0, BitPos(_display+0) 
	GOTO        L_disp73
	BTFSC       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp73
L__disp227:
;TCC_5.c,455 :: 		display=0x00;                                //limpa bit display
	BCF         _display+0, BitPos(_display+0) 
;TCC_5.c,456 :: 		LCD_Out(1,1,"ETEC LAURO GOMES");             //exibe "ETEC LAURO GOMES"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,457 :: 		LCD_Out(2,1,"  3A MECA 2021  ");             //      "  3A MECA 2021  "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,458 :: 		delay_ms(1000);                              //espera 1 segundo
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_disp74:
	DECFSZ      R13, 1, 1
	BRA         L_disp74
	DECFSZ      R12, 1, 1
	BRA         L_disp74
	DECFSZ      R11, 1, 1
	BRA         L_disp74
	NOP
	NOP
;TCC_5.c,459 :: 		}
L_disp73:
;TCC_5.c,460 :: 		if(!display && display2)                      //se os bits display for 0 e display2 for 1
	BTFSC       _display+0, BitPos(_display+0) 
	GOTO        L_disp77
	BTFSS       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp77
L__disp226:
;TCC_5.c,462 :: 		display2=0x00;                               //limpa bit display2
	BCF         _display2+0, BitPos(_display2+0) 
;TCC_5.c,463 :: 		LCD_Out(1,1,"     PARANDO    ");             //exibe "     PARANDO    "
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,464 :: 		LCD_Out(2,1,"     CONTAGEM   ");             //      "     CONTAGEM   "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,465 :: 		delay_ms(1000);                              //espera 1 segundo
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_disp78:
	DECFSZ      R13, 1, 1
	BRA         L_disp78
	DECFSZ      R12, 1, 1
	BRA         L_disp78
	DECFSZ      R11, 1, 1
	BRA         L_disp78
	NOP
	NOP
;TCC_5.c,466 :: 		}
L_disp77:
;TCC_5.c,467 :: 		}                                              //end else
L_disp70:
;TCC_5.c,468 :: 		}                                               //end if !ligar && prog==0
L_disp66:
;TCC_5.c,470 :: 		if(prog==1)                                     //programação de numeros
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp285
	MOVLW       1
	XORWF       _prog+0, 0 
L__disp285:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp79
;TCC_5.c,472 :: 		LCD_Out(1,1,"PROGRAME NUMERO:");               //exibe "PROGRAME NUMERO:
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,473 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,474 :: 		if(option==0) LCD_Chr(2,14,'1');               //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp286
	MOVLW       0
	XORWF       _option+0, 0 
L__disp286:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp80
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp80:
;TCC_5.c,475 :: 		if(option==1) LCD_Chr(2,14,'2');               //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp287
	MOVLW       1
	XORWF       _option+0, 0 
L__disp287:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp81
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp81:
;TCC_5.c,476 :: 		if(option==2) LCD_Chr(2,14,'3');              //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp288
	MOVLW       2
	XORWF       _option+0, 0 
L__disp288:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp82
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp82:
;TCC_5.c,477 :: 		}
L_disp79:
;TCC_5.c,479 :: 		if(prog==2)                                     //se prog for 2
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp289
	MOVLW       2
	XORWF       _prog+0, 0 
L__disp289:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp83
;TCC_5.c,481 :: 		LCD_Out(1,1,"PROGRAME Un.:");                  //exibe "PROGRAME Un.:"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,482 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,483 :: 		if(option==0) LCD_Chr(2,14,'1');               //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp290
	MOVLW       0
	XORWF       _option+0, 0 
L__disp290:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp84
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp84:
;TCC_5.c,484 :: 		if(option==1) LCD_Chr(2,14,'2');               //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp291
	MOVLW       1
	XORWF       _option+0, 0 
L__disp291:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp85
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp85:
;TCC_5.c,485 :: 		if(option==2) LCD_Chr(2,14,'3');              //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp292
	MOVLW       2
	XORWF       _option+0, 0 
L__disp292:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp86
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp86:
;TCC_5.c,486 :: 		}
L_disp83:
;TCC_5.c,488 :: 		if(ligar)                                       //se ligar for 1 (ligado)
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_disp87
;TCC_5.c,490 :: 		LCD_Out(1,1,"CONTANDO:   DISP");               //exibe "CONTANDO:   DISP";
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,491 :: 		if(temp_disp>20) temp_disp=0x00;               //se temp_disp for maior que 20, zera temp_disp
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_disp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp293
	MOVF        _temp_disp+0, 0 
	SUBLW       20
L__disp293:
	BTFSC       STATUS+0, 0 
	GOTO        L_disp88
	CLRF        _temp_disp+0 
	CLRF        _temp_disp+1 
L_disp88:
;TCC_5.c,492 :: 		if(temp_disp == 20)                            //se temp_disp for 20 (2 segundos)
	MOVLW       0
	XORWF       _temp_disp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp294
	MOVLW       20
	XORWF       _temp_disp+0, 0 
L__disp294:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp89
;TCC_5.c,494 :: 		temp_disp=0x00;                               //zera temp_disp
	CLRF        _temp_disp+0 
	CLRF        _temp_disp+1 
;TCC_5.c,495 :: 		option++;                                     //incrementa option
	INFSNZ      _option+0, 1 
	INCF        _option+1, 1 
;TCC_5.c,496 :: 		if(option == 3) option=0x00;                  //se option for 3, option = 0
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp295
	MOVLW       3
	XORWF       _option+0, 0 
L__disp295:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp90
	CLRF        _option+0 
	CLRF        _option+1 
L_disp90:
;TCC_5.c,497 :: 		if(option==0) LCD_Chr(2,14,'1');              //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp296
	MOVLW       0
	XORWF       _option+0, 0 
L__disp296:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp91
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp91:
;TCC_5.c,498 :: 		if(option==1) LCD_Chr(2,14,'2');              //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp297
	MOVLW       1
	XORWF       _option+0, 0 
L__disp297:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp92
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp92:
;TCC_5.c,499 :: 		if(option==2) LCD_Chr(2,14,'3');              //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp298
	MOVLW       2
	XORWF       _option+0, 0 
L__disp298:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp93
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp93:
;TCC_5.c,500 :: 		}
L_disp89:
;TCC_5.c,501 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,502 :: 		}
L_disp87:
;TCC_5.c,504 :: 		}                                                 //end disp()
L_end_disp:
	RETURN      0
; end of _disp

_num_un:

;TCC_5.c,510 :: 		void num_un()
;TCC_5.c,513 :: 		if(option==0)                                    //se option for 0 (dispenser n° 1 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un300
	MOVLW       0
	XORWF       _option+0, 0 
L__num_un300:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un94
;TCC_5.c,515 :: 		dig2 = num/10;                                  //dígito 2 é igual a num dividido por 10
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
;TCC_5.c,516 :: 		dig1 = num%10;                                  //digito 1 é igual a sobra da divisão de num por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,518 :: 		LCD_Chr(2,2,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,519 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,521 :: 		if(!un) LCD_Out(2,5,hora);                      //se un for zero, exibe "hora"
	BTFSC       _un+0, BitPos(_un+0) 
	GOTO        L_num_un95
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un95:
;TCC_5.c,523 :: 		if(un) LCD_Out(2,5,dia);                        //se un for um, exibe "dia"
	BTFSS       _un+0, BitPos(_un+0) 
	GOTO        L_num_un96
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un96:
;TCC_5.c,525 :: 		}                                                //end if option==0
L_num_un94:
;TCC_5.c,528 :: 		if(option==1)                                    //se option for 1 (dispenser n°2 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un301
	MOVLW       1
	XORWF       _option+0, 0 
L__num_un301:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un97
;TCC_5.c,530 :: 		dig2 = num2/10;                                 //digito 2 é igual a num2 dividido por 10
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
;TCC_5.c,531 :: 		dig1 = num2%10;                                 //digito 1 é igual a sobra da divisão de num2 por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,533 :: 		LCD_Chr(2,2,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,534 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,536 :: 		if(!un2) LCD_Out(2,5,hora);                     //se un2 for zero, exibe "hora"
	BTFSC       _un2+0, BitPos(_un2+0) 
	GOTO        L_num_un98
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un98:
;TCC_5.c,538 :: 		if(un2) LCD_Out(2,5,dia);                       //se un2 for um, exibe "dia"
	BTFSS       _un2+0, BitPos(_un2+0) 
	GOTO        L_num_un99
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un99:
;TCC_5.c,540 :: 		}                                                //end if option==1
L_num_un97:
;TCC_5.c,542 :: 		if(option==2)                                    //se option for 1 (dispenser n°2 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un302
	MOVLW       2
	XORWF       _option+0, 0 
L__num_un302:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un100
;TCC_5.c,544 :: 		dig2 = num3/10;                                 //digito 2 é igual a num3 dividido por 10
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
;TCC_5.c,545 :: 		dig1 = num3%10;                                 //digito 1 é igual a sobra da divisão de num3 por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,547 :: 		LCD_Chr(2,2,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,548 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,550 :: 		if(!un3) LCD_Out(2,5,hora);                     //se un3 for zero, exibe "hora"
	BTFSC       _un3+0, BitPos(_un3+0) 
	GOTO        L_num_un101
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un101:
;TCC_5.c,552 :: 		if(un3) LCD_Out(2,5,dia);                       //se un3 for um, exibe "dia"
	BTFSS       _un3+0, BitPos(_un3+0) 
	GOTO        L_num_un102
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un102:
;TCC_5.c,554 :: 		}                                                //end if option==2
L_num_un100:
;TCC_5.c,556 :: 		}                                                 //end num_un()
L_end_num_un:
	RETURN      0
; end of _num_un

_piscaLED:

;TCC_5.c,562 :: 		void piscaLED()
;TCC_5.c,565 :: 		if(ligar && !toque && num!=0)                   //se ligar for um(ligado), toque for zero e num diferente de zero...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED105
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L_piscaLED105
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED304
	MOVLW       0
	XORWF       _num+0, 0 
L__piscaLED304:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED105
L__piscaLED235:
;TCC_5.c,567 :: 		if(temp_led>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED305
	MOVLW       10
	SUBWF       _temp_led+0, 0 
L__piscaLED305:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED106
;TCC_5.c,569 :: 		temp_led = 0x00;                      //zera temp_led
	CLRF        _temp_led+0 
	CLRF        _temp_led+1 
;TCC_5.c,570 :: 		LED  = ~LED;                          //inverte LED de indicação do dispenser n°1
	BTG         PORTA+0, 0 
;TCC_5.c,571 :: 		}                                              //end if temp_led>=10
L_piscaLED106:
;TCC_5.c,573 :: 		}                                               //end if ligar && !toque && num!=0
	GOTO        L_piscaLED107
L_piscaLED105:
;TCC_5.c,577 :: 		if(ligar && toque)                             //se ligar for 1 e toque for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED110
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_piscaLED110
L__piscaLED234:
;TCC_5.c,579 :: 		if(temp_led>=2)                               //conta 200ms
	MOVLW       0
	SUBWF       _temp_led+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED306
	MOVLW       2
	SUBWF       _temp_led+0, 0 
L__piscaLED306:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED111
;TCC_5.c,581 :: 		temp_led=0x00;                               //zera temp_led
	CLRF        _temp_led+0 
	CLRF        _temp_led+1 
;TCC_5.c,582 :: 		LED = ~LED;                                  //inverte LED de indicação do dispenser n°1
	BTG         PORTA+0, 0 
;TCC_5.c,584 :: 		}                                             //end if temp_led>=2
L_piscaLED111:
;TCC_5.c,586 :: 		}                                              //end if ligar && toque
	GOTO        L_piscaLED112
L_piscaLED110:
;TCC_5.c,587 :: 		else LED = 0x00;                               //senão, LED do dispenser n°1 desligado
	BCF         PORTA+0, 0 
L_piscaLED112:
;TCC_5.c,589 :: 		}                                               //end else
L_piscaLED107:
;TCC_5.c,593 :: 		if(temp_led2 ==5)                                //conta 500ms
	MOVLW       0
	XORWF       _temp_led2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED307
	MOVLW       5
	XORWF       _temp_led2+0, 0 
L__piscaLED307:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED113
;TCC_5.c,595 :: 		temp_led2=0x00;                                 //zera temp_led2
	CLRF        _temp_led2+0 
	CLRF        _temp_led2+1 
;TCC_5.c,596 :: 		LED2 = ~LED2;                                   //inverte estado do LED de indicação geral
	BTG         PORTA+0, 3 
;TCC_5.c,598 :: 		}                                                //end if temp_led==5
L_piscaLED113:
;TCC_5.c,600 :: 		if(ligar && !toque2 && num2!=0)                  //se ligar for 1, toque 2 for 0 e num2 diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED116
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_piscaLED116
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED308
	MOVLW       0
	XORWF       _num2+0, 0 
L__piscaLED308:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED116
L__piscaLED233:
;TCC_5.c,602 :: 		if(temp_led3>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED309
	MOVLW       10
	SUBWF       _temp_led3+0, 0 
L__piscaLED309:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED117
;TCC_5.c,604 :: 		temp_led3 = 0x00;                              //zera temp_led3
	CLRF        _temp_led3+0 
	CLRF        _temp_led3+1 
;TCC_5.c,605 :: 		LED3 = ~LED3;                                  //inverte estado do LED de indicação do dispenser n°2
	BTG         PORTB+0, 0 
;TCC_5.c,607 :: 		}                                               //end if temp_led3>=10
L_piscaLED117:
;TCC_5.c,609 :: 		}                                                //end if ligar && !toque2 && num2!=0
	GOTO        L_piscaLED118
L_piscaLED116:
;TCC_5.c,613 :: 		if(ligar && toque2)                             //se ligar e toque2 for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED121
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_piscaLED121
L__piscaLED232:
;TCC_5.c,615 :: 		if(temp_led3>=2)                               //conta 200 milisegundos
	MOVLW       0
	SUBWF       _temp_led3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED310
	MOVLW       2
	SUBWF       _temp_led3+0, 0 
L__piscaLED310:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED122
;TCC_5.c,617 :: 		temp_led3=0x00;                               //zera temp_led3
	CLRF        _temp_led3+0 
	CLRF        _temp_led3+1 
;TCC_5.c,618 :: 		LED3 = ~LED3;                                 //inverte estado do LED de indicação do dispenser n°2
	BTG         PORTB+0, 0 
;TCC_5.c,620 :: 		}                                              //end if temp_led3>=2
L_piscaLED122:
;TCC_5.c,622 :: 		}                                               //end if ligar && toque2
	GOTO        L_piscaLED123
L_piscaLED121:
;TCC_5.c,624 :: 		else LED3 = 0x00;                               //senão, LED de indicação do dispenser n°2 desligado
	BCF         PORTB+0, 0 
L_piscaLED123:
;TCC_5.c,626 :: 		}                                                //end else
L_piscaLED118:
;TCC_5.c,628 :: 		if(ligar && !toque3 && num3!=0)                  //se ligar for 1, toque3 for 0 e num3 diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED126
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_piscaLED126
	MOVLW       0
	XORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED311
	MOVLW       0
	XORWF       _num3+0, 0 
L__piscaLED311:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED126
L__piscaLED231:
;TCC_5.c,630 :: 		if(temp_led4>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED312
	MOVLW       10
	SUBWF       _temp_led4+0, 0 
L__piscaLED312:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED127
;TCC_5.c,632 :: 		temp_led4 = 0x00;                              //zera temp_led4
	CLRF        _temp_led4+0 
	CLRF        _temp_led4+1 
;TCC_5.c,633 :: 		LED4 = ~LED4;                                  //inverte estado do LED de indicação do dispenser n°3
	BTG         PORTB+0, 1 
;TCC_5.c,635 :: 		}                                               //end if temp_led4>=10
L_piscaLED127:
;TCC_5.c,637 :: 		}                                                //end if ligar && !toque3 && num3!=0
	GOTO        L_piscaLED128
L_piscaLED126:
;TCC_5.c,641 :: 		if(ligar && toque3)                             //se ligar e toque3 for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED131
	BTFSS       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_piscaLED131
L__piscaLED230:
;TCC_5.c,643 :: 		if(temp_led4>=2)                               //conta 200 milisegundos
	MOVLW       0
	SUBWF       _temp_led4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED313
	MOVLW       2
	SUBWF       _temp_led4+0, 0 
L__piscaLED313:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED132
;TCC_5.c,645 :: 		temp_led4=0x00;                               //zera temp_led4
	CLRF        _temp_led4+0 
	CLRF        _temp_led4+1 
;TCC_5.c,646 :: 		LED4 = ~LED4;                                 //inverte estado do LED de indicação do dispenser n°3
	BTG         PORTB+0, 1 
;TCC_5.c,648 :: 		}                                              //end if temp_led4>=2
L_piscaLED132:
;TCC_5.c,650 :: 		}                                               //end if ligar && toque3
	GOTO        L_piscaLED133
L_piscaLED131:
;TCC_5.c,652 :: 		else LED4 = 0x00;                               //senão, LED de indicação do dispenser n°3 desligado
	BCF         PORTB+0, 1 
L_piscaLED133:
;TCC_5.c,654 :: 		}                                                //end else
L_piscaLED128:
;TCC_5.c,656 :: 		}                                                 //end piscaLED()
L_end_piscaLED:
	RETURN      0
; end of _piscaLED

_timebase:

;TCC_5.c,663 :: 		void timebase()
;TCC_5.c,665 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase134
;TCC_5.c,667 :: 		temp_ligado = 0x00;                            //zera temp_ligado
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
;TCC_5.c,668 :: 		}
L_timebase134:
;TCC_5.c,669 :: 		if(ligar && num!=0)                             //se ligar for 1 e num diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase137
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase315
	MOVLW       0
	XORWF       _num+0, 0 
L__timebase315:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase137
L__timebase236:
;TCC_5.c,671 :: 		if(temp==10)                                   //conta 1 segundo
	MOVLW       0
	XORWF       _temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase316
	MOVLW       10
	XORWF       _temp+0, 0 
L__timebase316:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase138
;TCC_5.c,673 :: 		temp = 0x00;                                  //zera temp
	CLRF        _temp+0 
	CLRF        _temp+1 
;TCC_5.c,674 :: 		temp_ligado++;                                //incrementa temp_ligado a cada 1 segundo
	INFSNZ      _temp_ligado+0, 1 
	INCF        _temp_ligado+1, 1 
;TCC_5.c,676 :: 		}                                              //end if temp==10
L_timebase138:
;TCC_5.c,678 :: 		if(temp_ligado==mult)                          //compara a igualdade de temp_ligado com mult
	MOVF        _temp_ligado+1, 0 
	XORWF       _mult+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase317
	MOVF        _mult+0, 0 
	XORWF       _temp_ligado+0, 0 
L__timebase317:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase139
;TCC_5.c,680 :: 		toque = 0x01;                                 //liga o bit toque
	BSF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,681 :: 		atv_mot = 0x01;                               //liga o bit de ativação do motor
	BSF         _atv_mot+0, BitPos(_atv_mot+0) 
;TCC_5.c,682 :: 		abre_mot();                                   //define os bits de controle do motor para abri-lo
	CALL        _abre_mot+0, 0
;TCC_5.c,684 :: 		}                                              //end if temp_ligado==mult
L_timebase139:
;TCC_5.c,686 :: 		if(atv_mot)                                    //se ativação do motor for ligada...
	BTFSS       _atv_mot+0, BitPos(_atv_mot+0) 
	GOTO        L_timebase140
;TCC_5.c,688 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,690 :: 		}                                              //end if atv_mot
	GOTO        L_timebase141
L_timebase140:
;TCC_5.c,694 :: 		alarme();                                     //executa o alarme
	CALL        _alarme+0, 0
;TCC_5.c,695 :: 		}
L_timebase141:
;TCC_5.c,696 :: 		}                                               //end if ligar
L_timebase137:
;TCC_5.c,698 :: 		}                                                 //end timebase()
L_end_timebase:
	RETURN      0
; end of _timebase

_timebase2:

;TCC_5.c,705 :: 		void timebase2()
;TCC_5.c,707 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase2142
;TCC_5.c,709 :: 		temp_ligado2 = 0x00;                           //zera temp_ligado2
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
;TCC_5.c,710 :: 		}
L_timebase2142:
;TCC_5.c,712 :: 		if(ligar && num2!=0)                            //se ligar for 1 e num2 diferente de 0
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase2145
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2319
	MOVLW       0
	XORWF       _num2+0, 0 
L__timebase2319:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase2145
L__timebase2237:
;TCC_5.c,714 :: 		if(temp2==10)                                  //conta 1 segundo
	MOVLW       0
	XORWF       _temp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2320
	MOVLW       10
	XORWF       _temp2+0, 0 
L__timebase2320:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase2146
;TCC_5.c,716 :: 		temp2 = 0x00;                                 //zera temp2
	CLRF        _temp2+0 
	CLRF        _temp2+1 
;TCC_5.c,717 :: 		temp_ligado2++;                               //incrementa temp_ligado2 a cada 1 segundo
	INFSNZ      _temp_ligado2+0, 1 
	INCF        _temp_ligado2+1, 1 
;TCC_5.c,719 :: 		}                                              //end if temp2==10
L_timebase2146:
;TCC_5.c,721 :: 		if(temp_ligado2==mult2)                        //compara igualdade entre temp_ligado2 e mult2
	MOVF        _temp_ligado2+1, 0 
	XORWF       _mult2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2321
	MOVF        _mult2+0, 0 
	XORWF       _temp_ligado2+0, 0 
L__timebase2321:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase2147
;TCC_5.c,723 :: 		toque2 = 0x01;                                //liga o bit toque2
	BSF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,724 :: 		atv_mot2 = 0x01;                              //liga o bit de aativação do motor 2
	BSF         _atv_mot2+0, BitPos(_atv_mot2+0) 
;TCC_5.c,725 :: 		abre_mot2();                                  //define os bits de controle do motor 2 para abrir
	CALL        _abre_mot2+0, 0
;TCC_5.c,727 :: 		}                                              //end if temp_ligado2==mult2
L_timebase2147:
;TCC_5.c,729 :: 		if(atv_mot2)                                   //se ativação do motor 2 ligada...
	BTFSS       _atv_mot2+0, BitPos(_atv_mot2+0) 
	GOTO        L_timebase2148
;TCC_5.c,731 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,733 :: 		}                                              //end if atv_mot2
	GOTO        L_timebase2149
L_timebase2148:
;TCC_5.c,737 :: 		alarme();                                     //aciona o alarme
	CALL        _alarme+0, 0
;TCC_5.c,739 :: 		}                                              //end else
L_timebase2149:
;TCC_5.c,741 :: 		}                                               //end if ligar && num2!=0
L_timebase2145:
;TCC_5.c,743 :: 		}                                                 //end timebase2()
L_end_timebase2:
	RETURN      0
; end of _timebase2

_timebase3:

;TCC_5.c,750 :: 		void timebase3()
;TCC_5.c,752 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase3150
;TCC_5.c,754 :: 		temp_ligado3 = 0x00;                           //zera temp_ligado3
	CLRF        _temp_ligado3+0 
	CLRF        _temp_ligado3+1 
;TCC_5.c,755 :: 		}
L_timebase3150:
;TCC_5.c,757 :: 		if(ligar && num3!=0)                            //se ligar for 1 e num3 diferente de 0
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase3153
	MOVLW       0
	XORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3323
	MOVLW       0
	XORWF       _num3+0, 0 
L__timebase3323:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase3153
L__timebase3238:
;TCC_5.c,759 :: 		if(temp3==10)                                  //conta 1 segundo
	MOVLW       0
	XORWF       _temp3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3324
	MOVLW       10
	XORWF       _temp3+0, 0 
L__timebase3324:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase3154
;TCC_5.c,761 :: 		temp3 = 0x00;                                 //zera temp3
	CLRF        _temp3+0 
	CLRF        _temp3+1 
;TCC_5.c,762 :: 		temp_ligado3++;                               //incrementa temp_ligado3 a cada 1 segundo
	INFSNZ      _temp_ligado3+0, 1 
	INCF        _temp_ligado3+1, 1 
;TCC_5.c,764 :: 		}                                              //end if temp3==10
L_timebase3154:
;TCC_5.c,766 :: 		if(temp_ligado3==mult3)                        //compara igualdade entre temp_ligado3 e mult3
	MOVF        _temp_ligado3+1, 0 
	XORWF       _mult3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3325
	MOVF        _mult3+0, 0 
	XORWF       _temp_ligado3+0, 0 
L__timebase3325:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase3155
;TCC_5.c,768 :: 		toque3 = 0x01;                                //liga o bit toque3
	BSF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,769 :: 		atv_mot3 = 0x01;                              //liga o bit de aativação do motor 3
	BSF         _atv_mot3+0, BitPos(_atv_mot3+0) 
;TCC_5.c,770 :: 		abre_mot3();                                  //define os bits de controle do motor 3 para abrir
	CALL        _abre_mot3+0, 0
;TCC_5.c,772 :: 		}                                              //end if temp_ligado3==mult3
L_timebase3155:
;TCC_5.c,774 :: 		if(atv_mot3)                                   //se ativação do motor 3 ligada...
	BTFSS       _atv_mot3+0, BitPos(_atv_mot3+0) 
	GOTO        L_timebase3156
;TCC_5.c,776 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,778 :: 		}                                              //end if atv_mot3
	GOTO        L_timebase3157
L_timebase3156:
;TCC_5.c,782 :: 		alarme();                                     //aciona o alarme
	CALL        _alarme+0, 0
;TCC_5.c,784 :: 		}                                              //end else
L_timebase3157:
;TCC_5.c,786 :: 		}                                               //end if ligar && num3!=0
L_timebase3153:
;TCC_5.c,788 :: 		}                                                 //end timebase3()
L_end_timebase3:
	RETURN      0
; end of _timebase3

_alarme:

;TCC_5.c,794 :: 		void alarme()
;TCC_5.c,796 :: 		if(toque || toque2 || toque3)                    //se toque, toque2 ou toque3 for 1
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L__alarme239
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L__alarme239
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L__alarme239
	GOTO        L_alarme160
L__alarme239:
;TCC_5.c,798 :: 		if(vezes <10)                                  //se vezes for menor que 10
	MOVLW       0
	SUBWF       _vezes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__alarme327
	MOVLW       10
	SUBWF       _vezes+0, 0 
L__alarme327:
	BTFSC       STATUS+0, 0 
	GOTO        L_alarme161
;TCC_5.c,800 :: 		toca_som();                                   //executa a toca do SOM
	CALL        _toca_som+0, 0
;TCC_5.c,802 :: 		}                                              //end if vezes<10
	GOTO        L_alarme162
L_alarme161:
;TCC_5.c,806 :: 		if(toque)                                     //se toque for 1
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_alarme163
;TCC_5.c,808 :: 		toque=0x00;                                  //limpa o bit toque
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,809 :: 		temp_ligado=0x00;                            //zera temp_ligado para recomeçar a contagem
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
;TCC_5.c,811 :: 		}                                             //end if toque
L_alarme163:
;TCC_5.c,813 :: 		if(toque2)                                    //se toque2 for 1
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_alarme164
;TCC_5.c,815 :: 		toque2=0x00;                                 //limpa o bit toque 2
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,816 :: 		temp_ligado2=0x00;                           //zera temp_ligado2 para recomeçar a contagem
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
;TCC_5.c,818 :: 		}                                             //end if toque2
L_alarme164:
;TCC_5.c,820 :: 		if(toque3)                                    //se toque2 for 1
	BTFSS       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_alarme165
;TCC_5.c,822 :: 		toque3=0x00;                                 //limpa o bit toque3
	BCF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,823 :: 		temp_ligado3=0x00;                           //zera temp_ligado3 para recomeçar a contagem
	CLRF        _temp_ligado3+0 
	CLRF        _temp_ligado3+1 
;TCC_5.c,825 :: 		}                                             //end if toque3
L_alarme165:
;TCC_5.c,827 :: 		vezes=0x00;                                  //zera vezes
	CLRF        _vezes+0 
	CLRF        _vezes+1 
;TCC_5.c,828 :: 		SOM = 0x00;                                  //desliga o som
	BCF         PORTA+0, 2 
;TCC_5.c,830 :: 		}                                              //end else
L_alarme162:
;TCC_5.c,832 :: 		}                                                //end if toque || toque2 || toque3
L_alarme160:
;TCC_5.c,834 :: 		}                                                 //end alarme()
L_end_alarme:
	RETURN      0
; end of _alarme

_toca_som:

;TCC_5.c,840 :: 		void toca_som()
;TCC_5.c,842 :: 		if(temp_som>3) temp_som=0x00;                    //se temp_som for maior que 3, zera temp_som
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_som+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__toca_som329
	MOVF        _temp_som+0, 0 
	SUBLW       3
L__toca_som329:
	BTFSC       STATUS+0, 0 
	GOTO        L_toca_som166
	CLRF        _temp_som+0 
	CLRF        _temp_som+1 
L_toca_som166:
;TCC_5.c,843 :: 		if(temp_som==3)                               //conta 300 milisegundos...
	MOVLW       0
	XORWF       _temp_som+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__toca_som330
	MOVLW       3
	XORWF       _temp_som+0, 0 
L__toca_som330:
	BTFSS       STATUS+0, 2 
	GOTO        L_toca_som167
;TCC_5.c,845 :: 		temp_som = 0x00;                             //zera temp_som
	CLRF        _temp_som+0 
	CLRF        _temp_som+1 
;TCC_5.c,846 :: 		SOM = ~SOM;                                  //inverte o estado do buzzer
	BTG         PORTA+0, 2 
;TCC_5.c,847 :: 		vezes++;                                     //incrementa vezes
	INFSNZ      _vezes+0, 1 
	INCF        _vezes+1, 1 
;TCC_5.c,849 :: 		if(!ligar)                                   //se ligar for 0 (desligado)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_toca_som168
;TCC_5.c,851 :: 		vezes = 0x00;                               //zera vezes
	CLRF        _vezes+0 
	CLRF        _vezes+1 
;TCC_5.c,852 :: 		SOM   = 0x00;                               //desliga o buzzer
	BCF         PORTA+0, 2 
;TCC_5.c,854 :: 		}                                            //end if !ligar
L_toca_som168:
;TCC_5.c,856 :: 		}                                             //end if temp_som==3
L_toca_som167:
;TCC_5.c,858 :: 		}                                                 //end toca_som()
L_end_toca_som:
	RETURN      0
; end of _toca_som

_abre_mot:

;TCC_5.c,865 :: 		void abre_mot()
;TCC_5.c,867 :: 		open_bit  = 0x01;                                //seta bit de abertura
	BSF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,868 :: 		close_bit = 0x00;                                //limpa bit de fechamento
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,869 :: 		x_mot     = 0x00;                                //zera x_mot
	CLRF        _x_mot+0 
	CLRF        _x_mot+1 
;TCC_5.c,871 :: 		}                                                 //end abre_mot()
L_end_abre_mot:
	RETURN      0
; end of _abre_mot

_abre_mot2:

;TCC_5.c,878 :: 		void abre_mot2()
;TCC_5.c,880 :: 		open_bit2  = 0x01;                               //seta bit de abertura
	BSF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,881 :: 		close_bit2 = 0x00;                               //limpa bit de fechamento
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,882 :: 		x_mot2     = 0x00;                               //zera x_mot
	CLRF        _x_mot2+0 
	CLRF        _x_mot2+1 
;TCC_5.c,884 :: 		}                                                 //end abre_mot2()
L_end_abre_mot2:
	RETURN      0
; end of _abre_mot2

_abre_mot3:

;TCC_5.c,891 :: 		void abre_mot3()
;TCC_5.c,893 :: 		open_bit3  = 0x01;                               //seta bit de abertura
	BSF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,894 :: 		close_bit3 = 0x00;                               //limpa bit de fechamento
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,895 :: 		x_mot3     = 0x00;                               //zera x_mot
	CLRF        _x_mot3+0 
	CLRF        _x_mot3+1 
;TCC_5.c,897 :: 		}                                                 //end abre_mot3()
L_end_abre_mot3:
	RETURN      0
; end of _abre_mot3

_mot_aberto:

;TCC_5.c,903 :: 		void mot_aberto()
;TCC_5.c,905 :: 		if(x_mot<10)                                     //se x_mot for menor que 10...
	MOVLW       0
	SUBWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto335
	MOVLW       10
	SUBWF       _x_mot+0, 0 
L__mot_aberto335:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto169
;TCC_5.c,907 :: 		SM=0;                                         //  ||
	BCF         PORTA+0, 1 
;TCC_5.c,908 :: 		delay_us(18000);                              //  ||
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto170:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto170
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto170
	NOP
	NOP
;TCC_5.c,909 :: 		SM=1;                                         //  ||
	BSF         PORTA+0, 1 
;TCC_5.c,910 :: 		delay_us(2000);                               //  \/
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto171:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto171
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto171
	NOP
;TCC_5.c,911 :: 		SM=0;                                         // liga motor 1 no sentido horário
	BCF         PORTA+0, 1 
;TCC_5.c,912 :: 		x_mot ++;                                     //incrementa x_mot
	INFSNZ      _x_mot+0, 1 
	INCF        _x_mot+1, 1 
;TCC_5.c,914 :: 		}                                               //end if x_mot<10
L_mot_aberto169:
;TCC_5.c,916 :: 		if(x_mot == 10)                                 //se x_mot for 10...
	MOVLW       0
	XORWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto336
	MOVLW       10
	XORWF       _x_mot+0, 0 
L__mot_aberto336:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto172
;TCC_5.c,918 :: 		fecha_mot();                                  //executa a configuração dos bits de controle do motor 1 para fechar
	CALL        _fecha_mot+0, 0
;TCC_5.c,920 :: 		}                                              //end if x_mot==10
L_mot_aberto172:
;TCC_5.c,922 :: 		}                                                 //end mot_aberto()
L_end_mot_aberto:
	RETURN      0
; end of _mot_aberto

_mot_aberto2:

;TCC_5.c,928 :: 		void mot_aberto2()
;TCC_5.c,930 :: 		if(x_mot2<10)                                    //se x_mot2 for menor que 10...
	MOVLW       0
	SUBWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2338
	MOVLW       10
	SUBWF       _x_mot2+0, 0 
L__mot_aberto2338:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto2173
;TCC_5.c,932 :: 		SM2=0;                                        //  ||
	BCF         PORTA+0, 4 
;TCC_5.c,933 :: 		delay_us(18000);                              //  ||
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto2174:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto2174
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto2174
	NOP
	NOP
;TCC_5.c,934 :: 		SM2=1;                                        //  ||
	BSF         PORTA+0, 4 
;TCC_5.c,935 :: 		delay_us(2000);                               //  \/
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto2175:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto2175
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto2175
	NOP
;TCC_5.c,936 :: 		SM2=0;                                        //liga motor 2 no sentido horário
	BCF         PORTA+0, 4 
;TCC_5.c,937 :: 		x_mot2 ++;                                    //incrementa x_mot2
	INFSNZ      _x_mot2+0, 1 
	INCF        _x_mot2+1, 1 
;TCC_5.c,939 :: 		}                                               //end if x_mot2<10
L_mot_aberto2173:
;TCC_5.c,941 :: 		if(x_mot2 == 10)                                //se x_mot2 for 10...
	MOVLW       0
	XORWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2339
	MOVLW       10
	XORWF       _x_mot2+0, 0 
L__mot_aberto2339:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto2176
;TCC_5.c,943 :: 		fecha_mot2();                                 //executa a configuração dos bits de controle do motor 2 para fechar
	CALL        _fecha_mot2+0, 0
;TCC_5.c,945 :: 		}                                              //end if x_mot2==10
L_mot_aberto2176:
;TCC_5.c,947 :: 		}                                                 //end mot_aberto2()
L_end_mot_aberto2:
	RETURN      0
; end of _mot_aberto2

_mot_aberto3:

;TCC_5.c,953 :: 		void mot_aberto3()
;TCC_5.c,955 :: 		if(x_mot3<10)                                    //se x_mot3 for menor que 10...
	MOVLW       0
	SUBWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto3341
	MOVLW       10
	SUBWF       _x_mot3+0, 0 
L__mot_aberto3341:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto3177
;TCC_5.c,957 :: 		SM3=0;                                        //  ||
	BCF         PORTA+0, 5 
;TCC_5.c,958 :: 		delay_us(18000);                              //  ||
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto3178:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto3178
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto3178
	NOP
	NOP
;TCC_5.c,959 :: 		SM3=1;                                        //  ||
	BSF         PORTA+0, 5 
;TCC_5.c,960 :: 		delay_us(2000);                               //  \/
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto3179:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto3179
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto3179
	NOP
;TCC_5.c,961 :: 		SM3=0;                                        // liga motor 1 no sentido horário
	BCF         PORTA+0, 5 
;TCC_5.c,962 :: 		x_mot3 ++;                                    //incrementa x_mot3
	INFSNZ      _x_mot3+0, 1 
	INCF        _x_mot3+1, 1 
;TCC_5.c,964 :: 		}                                               //end if x_mot3<10
L_mot_aberto3177:
;TCC_5.c,966 :: 		if(x_mot3 == 10)                                //se x_mot3 for 10...
	MOVLW       0
	XORWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto3342
	MOVLW       10
	XORWF       _x_mot3+0, 0 
L__mot_aberto3342:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto3180
;TCC_5.c,968 :: 		fecha_mot3();                                 //executa a configuração dos bits de controle do motor 3 para fechar
	CALL        _fecha_mot3+0, 0
;TCC_5.c,970 :: 		}                                              //end if x_mot3==10
L_mot_aberto3180:
;TCC_5.c,972 :: 		}                                                 //end mot_aberto3()
L_end_mot_aberto3:
	RETURN      0
; end of _mot_aberto3

_fecha_mot:

;TCC_5.c,979 :: 		void fecha_mot()
;TCC_5.c,981 :: 		open_bit  = 0x00;                                //limpa o bit de abertura
	BCF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,982 :: 		close_bit = 0x01;                                //seta o bit de fechamento
	BSF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,983 :: 		x_mot     = 0x00;                                //zera x_mot
	CLRF        _x_mot+0 
	CLRF        _x_mot+1 
;TCC_5.c,985 :: 		}                                                 //end fecha_mot()
L_end_fecha_mot:
	RETURN      0
; end of _fecha_mot

_fecha_mot2:

;TCC_5.c,992 :: 		void fecha_mot2()
;TCC_5.c,994 :: 		open_bit2  = 0x00;                               //limpa o bit de abertura
	BCF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,995 :: 		close_bit2 = 0x01;                               //seta o bit de fechamento
	BSF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,996 :: 		x_mot2     = 0x00;                               //zera x_mot2
	CLRF        _x_mot2+0 
	CLRF        _x_mot2+1 
;TCC_5.c,998 :: 		}                                                 //end fecha_mot2()
L_end_fecha_mot2:
	RETURN      0
; end of _fecha_mot2

_fecha_mot3:

;TCC_5.c,1005 :: 		void fecha_mot3()
;TCC_5.c,1007 :: 		open_bit3  = 0x00;                               //limpa o bit de abertura
	BCF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,1008 :: 		close_bit3 = 0x01;                               //seta o bit de fechamento
	BSF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1009 :: 		x_mot3     = 0x00;                               //zera x_mot3
	CLRF        _x_mot3+0 
	CLRF        _x_mot3+1 
;TCC_5.c,1011 :: 		}                                                 //end fecha_mot3()
L_end_fecha_mot3:
	RETURN      0
; end of _fecha_mot3

_mot_fechado:

;TCC_5.c,1017 :: 		void mot_fechado()
;TCC_5.c,1019 :: 		if(x_mot<10)                                     //se x_mot for menor que 10
	MOVLW       0
	SUBWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado347
	MOVLW       10
	SUBWF       _x_mot+0, 0 
L__mot_fechado347:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado181
;TCC_5.c,1021 :: 		SM=0;                                         //  ||
	BCF         PORTA+0, 1 
;TCC_5.c,1022 :: 		delay_us(18500);                              //  ||
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado182:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado182
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado182
	NOP
	NOP
;TCC_5.c,1023 :: 		SM=1;                                         //  ||
	BSF         PORTA+0, 1 
;TCC_5.c,1024 :: 		delay_us(1500);                               //  \/
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado183:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado183
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado183
	NOP
;TCC_5.c,1025 :: 		SM=0;                                         //leva o motor para a posição inicial
	BCF         PORTA+0, 1 
;TCC_5.c,1026 :: 		x_mot++;                                      //incrementa x_mot
	INFSNZ      _x_mot+0, 1 
	INCF        _x_mot+1, 1 
;TCC_5.c,1028 :: 		}                                               //end if x_mot<10
L_mot_fechado181:
;TCC_5.c,1030 :: 		if(x_mot==10)                                   //se x_mot for 10
	MOVLW       0
	XORWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado348
	MOVLW       10
	XORWF       _x_mot+0, 0 
L__mot_fechado348:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado184
;TCC_5.c,1032 :: 		close_bit = 0x00;                            //limpa o bit de fechamento
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,1034 :: 		}                                             //end if x_mot==10
L_mot_fechado184:
;TCC_5.c,1036 :: 		}                                                 //end mot_fechado
L_end_mot_fechado:
	RETURN      0
; end of _mot_fechado

_mot_fechado2:

;TCC_5.c,1042 :: 		void mot_fechado2()
;TCC_5.c,1044 :: 		if(x_mot2<10)                                   //se x_mot2 for menor que 10
	MOVLW       0
	SUBWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2350
	MOVLW       10
	SUBWF       _x_mot2+0, 0 
L__mot_fechado2350:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado2185
;TCC_5.c,1046 :: 		SM2=0;                                        //  ||
	BCF         PORTA+0, 4 
;TCC_5.c,1047 :: 		delay_us(18500);                              //  ||
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado2186:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado2186
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado2186
	NOP
	NOP
;TCC_5.c,1048 :: 		SM2=1;                                        //  ||
	BSF         PORTA+0, 4 
;TCC_5.c,1049 :: 		delay_us(1500);                               //  \/
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado2187:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado2187
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado2187
	NOP
;TCC_5.c,1050 :: 		SM2=0;                                        //leva o motor 2 para a posição inicial
	BCF         PORTA+0, 4 
;TCC_5.c,1051 :: 		x_mot2++;                                     //incrementa x_mot2
	INFSNZ      _x_mot2+0, 1 
	INCF        _x_mot2+1, 1 
;TCC_5.c,1053 :: 		}                                               //end if x_mot2<10
L_mot_fechado2185:
;TCC_5.c,1055 :: 		if(x_mot2==10)                                  //se x_mot2 for 10
	MOVLW       0
	XORWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2351
	MOVLW       10
	XORWF       _x_mot2+0, 0 
L__mot_fechado2351:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado2188
;TCC_5.c,1057 :: 		close_bit2 = 0x00;                           //limpa o bit de fechamento
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,1059 :: 		}                                             //end if x_mot2==10
L_mot_fechado2188:
;TCC_5.c,1061 :: 		}                                                 //end mot_fechado2()
L_end_mot_fechado2:
	RETURN      0
; end of _mot_fechado2

_mot_fechado3:

;TCC_5.c,1067 :: 		void mot_fechado3()
;TCC_5.c,1069 :: 		if(x_mot3<10)                                   //se x_mot3 for menor que 10
	MOVLW       0
	SUBWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado3353
	MOVLW       10
	SUBWF       _x_mot3+0, 0 
L__mot_fechado3353:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado3189
;TCC_5.c,1071 :: 		SM3=0;                                        //  ||
	BCF         PORTA+0, 5 
;TCC_5.c,1072 :: 		delay_us(18500);                              //  ||
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado3190:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado3190
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado3190
	NOP
	NOP
;TCC_5.c,1073 :: 		SM3=1;                                        //  ||
	BSF         PORTA+0, 5 
;TCC_5.c,1074 :: 		delay_us(1500);                               //  \/
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado3191:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado3191
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado3191
	NOP
;TCC_5.c,1075 :: 		SM3=0;                                        //leva o motor 3 para a posição inicial
	BCF         PORTA+0, 5 
;TCC_5.c,1076 :: 		x_mot3++;                                     //incrementa x_mot3
	INFSNZ      _x_mot3+0, 1 
	INCF        _x_mot3+1, 1 
;TCC_5.c,1078 :: 		}                                               //end if x_mot2<10
L_mot_fechado3189:
;TCC_5.c,1080 :: 		if(x_mot3==10)                                  //se x_mot3 for 10
	MOVLW       0
	XORWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado3354
	MOVLW       10
	XORWF       _x_mot3+0, 0 
L__mot_fechado3354:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado3192
;TCC_5.c,1082 :: 		close_bit3 = 0x00;                           //limpa o bit de fechamento
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1084 :: 		}                                             //end if x_mot3==10
L_mot_fechado3192:
;TCC_5.c,1086 :: 		}                                                 //end mot_fechado3()
L_end_mot_fechado3:
	RETURN      0
; end of _mot_fechado3

_read_motbits:

;TCC_5.c,1093 :: 		void read_motbits()
;TCC_5.c,1095 :: 		if(!open_bit && !close_bit) atv_mot = 0x00;    //se os bits de abertura e fechamento do motor 1 forem 0,
	BTFSC       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits195
	BTFSC       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits195
L__read_motbits248:
	BCF         _atv_mot+0, BitPos(_atv_mot+0) 
L_read_motbits195:
;TCC_5.c,1098 :: 		if(open_bit && !close_bit)                     //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits198
	BTFSC       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits198
L__read_motbits247:
;TCC_5.c,1100 :: 		mot_aberto();                                 //executa a abertura do motor 1
	CALL        _mot_aberto+0, 0
;TCC_5.c,1102 :: 		}                                              //end if open_bit && !close_bit
L_read_motbits198:
;TCC_5.c,1104 :: 		if(!open_bit && close_bit)                     //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits201
	BTFSS       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits201
L__read_motbits246:
;TCC_5.c,1106 :: 		mot_fechado();                                //executa o fechamento do motor 1
	CALL        _mot_fechado+0, 0
;TCC_5.c,1108 :: 		}                                              //end if !open_bit && close_bit
L_read_motbits201:
;TCC_5.c,1111 :: 		if(!open_bit2 && !close_bit2) atv_mot2 = 0x00; //se os bits de abertura e fechamento do motor 2 forem 0,
	BTFSC       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits204
	BTFSC       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits204
L__read_motbits245:
	BCF         _atv_mot2+0, BitPos(_atv_mot2+0) 
L_read_motbits204:
;TCC_5.c,1114 :: 		if(open_bit2 && !close_bit2)                   //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits207
	BTFSC       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits207
L__read_motbits244:
;TCC_5.c,1116 :: 		mot_aberto2();                                //executa a abertura do motor 2
	CALL        _mot_aberto2+0, 0
;TCC_5.c,1118 :: 		}                                              //end if open_bit2 && !close_bit2
L_read_motbits207:
;TCC_5.c,1120 :: 		if(!open_bit2 && close_bit2)                   //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits210
	BTFSS       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits210
L__read_motbits243:
;TCC_5.c,1122 :: 		mot_fechado2();                               //executa o fechamento do motor 2
	CALL        _mot_fechado2+0, 0
;TCC_5.c,1124 :: 		}                                              //end if !open_bit2 && close_bit2
L_read_motbits210:
;TCC_5.c,1127 :: 		if(!open_bit3 && !close_bit3) atv_mot3 = 0x00; //se os bits de abertura e fechamento do motor 3 forem 0,
	BTFSC       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits213
	BTFSC       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits213
L__read_motbits242:
	BCF         _atv_mot3+0, BitPos(_atv_mot3+0) 
L_read_motbits213:
;TCC_5.c,1130 :: 		if(open_bit3 && !close_bit3)                   //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits216
	BTFSC       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits216
L__read_motbits241:
;TCC_5.c,1132 :: 		mot_aberto3();                                //executa a abertura do motor 3
	CALL        _mot_aberto3+0, 0
;TCC_5.c,1134 :: 		}                                              //end if open_bit3 && !close_bit3
L_read_motbits216:
;TCC_5.c,1136 :: 		if(!open_bit3 && close_bit3)                   //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits219
	BTFSS       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits219
L__read_motbits240:
;TCC_5.c,1138 :: 		mot_fechado3();                               //executa o fechamento do motor 3
	CALL        _mot_fechado3+0, 0
;TCC_5.c,1140 :: 		}                                              //end if !open_bit3 && close_bit3
L_read_motbits219:
;TCC_5.c,1142 :: 		}                                                 //end read_motbits()
L_end_read_motbits:
	RETURN      0
; end of _read_motbits
