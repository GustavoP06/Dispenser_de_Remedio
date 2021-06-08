
_interrupt:

;TCC_5.c,143 :: 		void interrupt()                          //interrupção
;TCC_5.c,145 :: 		if(TMR1IF_bit)                       //overflow em 100ms
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt0
;TCC_5.c,147 :: 		TMR1IF_bit  =  0x00;                //zera flag do timer1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;TCC_5.c,148 :: 		TMR1H       =  0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;TCC_5.c,149 :: 		TMR1L       =  0xB0;                //seta timer1 em 15536
	MOVLW       176
	MOVWF       TMR1L+0 
;TCC_5.c,150 :: 		temp_led++;                         //incrementa temp_led
	INFSNZ      _temp_led+0, 1 
	INCF        _temp_led+1, 1 
;TCC_5.c,151 :: 		temp_led2++;                        //incrementa temp_led2
	INFSNZ      _temp_led2+0, 1 
	INCF        _temp_led2+1, 1 
;TCC_5.c,152 :: 		temp_led3++;                        //incrementa temp_led3
	INFSNZ      _temp_led3+0, 1 
	INCF        _temp_led3+1, 1 
;TCC_5.c,153 :: 		temp_led4++;                        //incrementa temp_led4
	INFSNZ      _temp_led4+0, 1 
	INCF        _temp_led4+1, 1 
;TCC_5.c,154 :: 		temp_disp++;                        //incrementa temp_disp
	INFSNZ      _temp_disp+0, 1 
	INCF        _temp_disp+1, 1 
;TCC_5.c,155 :: 		temp_som++;                         //incrementa temp_som
	INFSNZ      _temp_som+0, 1 
	INCF        _temp_som+1, 1 
;TCC_5.c,156 :: 		temp_inc++;                         //incrementa temp_inc
	INFSNZ      _temp_inc+0, 1 
	INCF        _temp_inc+1, 1 
;TCC_5.c,157 :: 		temp_num++;                         //icrementa temp_num
	INFSNZ      _temp_num+0, 1 
	INCF        _temp_num+1, 1 
;TCC_5.c,158 :: 		}
L_interrupt0:
;TCC_5.c,160 :: 		if(TMR0IF_bit)                        //overflow em 100ms overflow
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt1
;TCC_5.c,162 :: 		TMR0IF_bit =  0x00;                  //zera flag do timer0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;TCC_5.c,163 :: 		TMR0H      =  0x3C;
	MOVLW       60
	MOVWF       TMR0H+0 
;TCC_5.c,164 :: 		TMR0L      =  0xB0;                  //seta timer0 em 15536
	MOVLW       176
	MOVWF       TMR0L+0 
;TCC_5.c,165 :: 		temp++;                              //incrementa temp
	INFSNZ      _temp+0, 1 
	INCF        _temp+1, 1 
;TCC_5.c,166 :: 		temp2++;                             //incrementa temp2
	INFSNZ      _temp2+0, 1 
	INCF        _temp2+1, 1 
;TCC_5.c,167 :: 		temp3++;                             //incrementa temp3
	INFSNZ      _temp3+0, 1 
	INCF        _temp3+1, 1 
;TCC_5.c,169 :: 		}                                     //end if TMR0IF
L_interrupt1:
;TCC_5.c,173 :: 		piscaLED();                           //executa piscaLED
	CALL        _piscaLED+0, 0
;TCC_5.c,174 :: 		timebase();                           //executa timebase
	CALL        _timebase+0, 0
;TCC_5.c,175 :: 		timebase2();                          //executa timebase2
	CALL        _timebase2+0, 0
;TCC_5.c,176 :: 		timebase3();
	CALL        _timebase3+0, 0
;TCC_5.c,179 :: 		}                                          //end interrupt()
L_end_interrupt:
L__interrupt295:
	RETFIE      1
; end of _interrupt

_main:

;TCC_5.c,185 :: 		void main (void)
;TCC_5.c,190 :: 		ADCON1        =   0x0F;                   //Define os pinos como digital
	MOVLW       15
	MOVWF       ADCON1+0 
;TCC_5.c,191 :: 		CMCON         =   0x07;                   //Desativa os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;TCC_5.c,193 :: 		TMR0H         =   0x3C;
	MOVLW       60
	MOVWF       TMR0H+0 
;TCC_5.c,194 :: 		TMR0L         =   0xB0;                   //Inicia timer0 em 15536
	MOVLW       176
	MOVWF       TMR0L+0 
;TCC_5.c,195 :: 		TMR1H         =   0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;TCC_5.c,196 :: 		TMR1L         =   0xB0;                   //Inicia TMR1 em 15536
	MOVLW       176
	MOVWF       TMR1L+0 
;TCC_5.c,199 :: 		INTCON.GIE    =   0x01;                   //Ativa interrupção global
	BSF         INTCON+0, 7 
;TCC_5.c,200 :: 		INTCON.PEIE   =   0x01;                   //Ativa interrupção por periféricos
	BSF         INTCON+0, 6 
;TCC_5.c,201 :: 		INTCON.TMR0IE =   0x01;                   //Ativa interrupção por overflow
	BSF         INTCON+0, 5 
;TCC_5.c,203 :: 		TMR0IF_bit    =   0x00;                   //zera a flag do timer0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;TCC_5.c,204 :: 		TMR1IF_bit    =   0x00;                   //zera a flag do timer1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;TCC_5.c,207 :: 		INTCON2.RBPU  =   0x01;                   //Desliga os resistores de pull-ups do portB
	BSF         INTCON2+0, 7 
;TCC_5.c,208 :: 		T0CON         =   0x81;                   //TMR0 16 bits, prescaler 1:4
	MOVLW       129
	MOVWF       T0CON+0 
;TCC_5.c,209 :: 		T1CON         =   0xA1;                   //TMR1 16 bits, prescaler 1:4
	MOVLW       161
	MOVWF       T1CON+0 
;TCC_5.c,212 :: 		ligar         =   0x00;                   //     |
	BCF         _ligar+0, BitPos(_ligar+0) 
;TCC_5.c,213 :: 		b1_flag       =   0x00;                   //     |
	BCF         _b1_flag+0, BitPos(_b1_flag+0) 
;TCC_5.c,214 :: 		b2_flag       =   0x00;                   //     |
	BCF         _b2_flag+0, BitPos(_b2_flag+0) 
;TCC_5.c,215 :: 		b3_flag       =   0x00;                   //     |
	BCF         _b3_flag+0, BitPos(_b3_flag+0) 
;TCC_5.c,216 :: 		b4_flag       =   0x00;                   //     |
	BCF         _b4_flag+0, BitPos(_b4_flag+0) 
;TCC_5.c,217 :: 		b5_flag       =   0x00;                   //     |
	BCF         _b5_flag+0, BitPos(_b5_flag+0) 
;TCC_5.c,218 :: 		display       =   0x00;                   //     |
	BCF         _display+0, BitPos(_display+0) 
;TCC_5.c,219 :: 		fast_inc      =   0x00;                    //     |
	BCF         _fast_inc+0, BitPos(_fast_inc+0) 
;TCC_5.c,220 :: 		toque         =   0x00;                   //     |
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,221 :: 		toque2        =   0x00;                   //     |
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,222 :: 		toque3        =   0x00;                   //     |
	BCF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,223 :: 		open_bit      =   0x00;                   //     |
	BCF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,224 :: 		open_bit2     =   0x00;                   //     |
	BCF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,225 :: 		open_bit3     =   0x00;                   //     |
	BCF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,226 :: 		close_bit     =   0x00;                   //     |
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,227 :: 		close_bit2    =   0x00;                   //     |
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,228 :: 		close_bit3    =   0x00;                   //     |
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,229 :: 		atv_mot       =   0x00;                   //     |
	BCF         _atv_mot+0, BitPos(_atv_mot+0) 
;TCC_5.c,230 :: 		atv_mot2      =   0x00;                   //     |
	BCF         _atv_mot2+0, BitPos(_atv_mot2+0) 
;TCC_5.c,231 :: 		atv_mot3      =   0x00;                   //    \ /
	BCF         _atv_mot3+0, BitPos(_atv_mot3+0) 
;TCC_5.c,233 :: 		SM            =   0x00;                   //zerando todos os bits
	BCF         PORTA+0, 1 
;TCC_5.c,234 :: 		SM2           =   0x00;
	BCF         PORTA+0, 4 
;TCC_5.c,235 :: 		SM3           =   0x00;
	BCF         PORTA+0, 5 
;TCC_5.c,237 :: 		num           =   EEPROM_Read(0x01);      //lê os dados da EEPROM para variável num
	MOVLW       1
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVLW       0
	MOVWF       _num+1 
;TCC_5.c,238 :: 		un            =   EEPROM_Read(0x03);      //lê os dados da EEPROM para variável un
	MOVLW       3
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main297
	BCF         _un+0, BitPos(_un+0) 
	GOTO        L__main298
L__main297:
	BSF         _un+0, BitPos(_un+0) 
L__main298:
;TCC_5.c,239 :: 		num2          =   EEPROM_Read(0x02);      //lê os dados da EEPROM para variável num2
	MOVLW       2
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num2+0 
	MOVLW       0
	MOVWF       _num2+1 
;TCC_5.c,240 :: 		un2           =   EEPROM_Read(0x04);      //lê os dados da EEPROM para variável un2
	MOVLW       4
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main299
	BCF         _un2+0, BitPos(_un2+0) 
	GOTO        L__main300
L__main299:
	BSF         _un2+0, BitPos(_un2+0) 
L__main300:
;TCC_5.c,241 :: 		num3          =   EEPROM_Read(0x05);      //lê os dados da EEPROM para variável num3
	MOVLW       5
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num3+0 
	MOVLW       0
	MOVWF       _num3+1 
;TCC_5.c,242 :: 		un3           =   EEPROM_Read(0x06);      //lê os dados da EEPROM para variável un3
	MOVLW       6
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main301
	BCF         _un3+0, BitPos(_un3+0) 
	GOTO        L__main302
L__main301:
	BSF         _un3+0, BitPos(_un3+0) 
L__main302:
;TCC_5.c,244 :: 		TRISA = 0x00;                             //seta todos os bits do TRISA como saída
	CLRF        TRISA+0 
;TCC_5.c,245 :: 		TRISC = 0x3F;                             //seta os bits 0,1,2,3,5 como entrada
	MOVLW       63
	MOVWF       TRISC+0 
;TCC_5.c,246 :: 		TRISB = 0x00;                             //seta todos os bits do TRISB como saída
	CLRF        TRISB+0 
;TCC_5.c,248 :: 		LCD_Init();                               //inicia o LCD
	CALL        _Lcd_Init+0, 0
;TCC_5.c,249 :: 		LCD_Cmd(_LCD_CLEAR);                      //limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,250 :: 		LCD_Cmd(_LCD_CURSOR_OFF);                 //desliga cursor do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,252 :: 		while(1)                                         //loop infinito
L_main2:
;TCC_5.c,254 :: 		ler_bot();                                     //executa ler_bot
	CALL        _ler_bot+0, 0
;TCC_5.c,256 :: 		disp();                                        //executa disp
	CALL        _disp+0, 0
;TCC_5.c,257 :: 		}                                                //end while
	GOTO        L_main2
;TCC_5.c,259 :: 		}                                                 //end main
L_end_main:
	GOTO        $+0
; end of _main

_ler_bot:

;TCC_5.c,264 :: 		void ler_bot()
;TCC_5.c,267 :: 		if(!BOTAO1) b1_flag=0x01;                       //se botão1 for pressionado, flag do botão1 = 1
	BTFSC       PORTC+0, 0 
	GOTO        L_ler_bot4
	BSF         _b1_flag+0, BitPos(_b1_flag+0) 
L_ler_bot4:
;TCC_5.c,269 :: 		if(BOTAO1 && b1_flag)                           //se botão1 estiver solto e flag do botão1 = 1
	BTFSS       PORTC+0, 0 
	GOTO        L_ler_bot7
	BTFSS       _b1_flag+0, BitPos(_b1_flag+0) 
	GOTO        L_ler_bot7
L__ler_bot264:
;TCC_5.c,271 :: 		LCD_Cmd(_LCD_CLEAR);                           //limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,272 :: 		b1_flag = 0x00;                                //lmpa a flag do botão1
	BCF         _b1_flag+0, BitPos(_b1_flag+0) 
;TCC_5.c,273 :: 		if(!ligar)                                     //se bit ligar = 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot8
;TCC_5.c,275 :: 		prog++;                                       //incrementa prog, muda a programação
	INFSNZ      _prog+0, 1 
	INCF        _prog+1, 1 
;TCC_5.c,276 :: 		if(prog==3)                                   //se prog = 3
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot304
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot304:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot9
;TCC_5.c,278 :: 		prog=0x00;                                   //zera a variável prog
	CLRF        _prog+0 
	CLRF        _prog+1 
;TCC_5.c,279 :: 		EEPROM_Write(0x01,num);                      //grava num na EEPROM
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,280 :: 		delay_ms(10);                                //espera 10 micro segundos
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
;TCC_5.c,281 :: 		EEPROM_Write(0x03,un);                       //grava un na EEPROM
	MOVLW       3
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un+0, BitPos(_un+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,282 :: 		delay_ms(10);                                //espera 10 micro segundos
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
;TCC_5.c,283 :: 		EEPROM_Write(0x02,num2);                     //grava num2 na EEPROM
	MOVLW       2
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num2+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,284 :: 		delay_ms(10);                                //espera 10 micro segundos
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
;TCC_5.c,285 :: 		EEPROM_Write(0x04,un2);                      //grava un2 na EEPROM
	MOVLW       4
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un2+0, BitPos(_un2+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,286 :: 		delay_ms(10);                                //espera 10 micro segundos
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
;TCC_5.c,287 :: 		EEPROM_Write(0x05,num3);                     //grava num3 na EEPROM
	MOVLW       5
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num3+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,288 :: 		delay_ms(10);                                //espera 10 micro segundos
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
;TCC_5.c,289 :: 		EEPROM_Write(0x06,un3);                      //grava un3 na EEPROM
	MOVLW       6
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un3+0, BitPos(_un3+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,290 :: 		delay_ms(10);                                //espera 10 micro segundos
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
;TCC_5.c,291 :: 		display=0x01;                                //bit display em 1
	BSF         _display+0, BitPos(_display+0) 
;TCC_5.c,293 :: 		}                                             //end if prog = 3
L_ler_bot9:
;TCC_5.c,295 :: 		}                                              //end if !ligar
L_ler_bot8:
;TCC_5.c,297 :: 		}                                               //end if BOTAO1 && b1_flag
L_ler_bot7:
;TCC_5.c,302 :: 		if(!BOTAO2)
	BTFSC       PORTC+0, 1 
	GOTO        L_ler_bot16
;TCC_5.c,304 :: 		b2_flag=0x01;                                  //se botão2 for pressionado, flag do botão2 = 1
	BSF         _b2_flag+0, BitPos(_b2_flag+0) 
;TCC_5.c,305 :: 		fast_incr();                                   //executa fast_incr
	CALL        _fast_incr+0, 0
;TCC_5.c,306 :: 		}
L_ler_bot16:
;TCC_5.c,308 :: 		if(BOTAO2 && b2_flag)                           //se botão2 for solto e flag do botão2 for 1
	BTFSS       PORTC+0, 1 
	GOTO        L_ler_bot19
	BTFSS       _b2_flag+0, BitPos(_b2_flag+0) 
	GOTO        L_ler_bot19
L__ler_bot263:
;TCC_5.c,310 :: 		LCD_Cmd(_LCD_CLEAR);                          //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,311 :: 		b2_flag    =  0x00;                           //limpa flag do botão
	BCF         _b2_flag+0, BitPos(_b2_flag+0) 
;TCC_5.c,312 :: 		fast_inc   =  0x00;                           //limpa bit de incremento rápido
	BCF         _fast_inc+0, BitPos(_fast_inc+0) 
;TCC_5.c,313 :: 		if(option==0)                                  //dispenser n°1
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot305
	MOVLW       0
	XORWF       _option+0, 0 
L__ler_bot305:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot20
;TCC_5.c,315 :: 		if(prog==1)                                   //programação de numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot306
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot306:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot21
;TCC_5.c,317 :: 		num++;                                       //incrementa num
	INFSNZ      _num+0, 1 
	INCF        _num+1, 1 
;TCC_5.c,318 :: 		}
L_ler_bot21:
;TCC_5.c,319 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot307
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot307:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot22
;TCC_5.c,321 :: 		un = ~un;                                   //inverte un
	BTG         _un+0, BitPos(_un+0) 
;TCC_5.c,322 :: 		}                                             //end if prog==2
L_ler_bot22:
;TCC_5.c,324 :: 		if(num>24) num=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot308
	MOVF        _num+0, 0 
	SUBLW       24
L__ler_bot308:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot23
	CLRF        _num+0 
	CLRF        _num+1 
L_ler_bot23:
;TCC_5.c,326 :: 		}                                              //end if option==0
L_ler_bot20:
;TCC_5.c,328 :: 		if(option==1)                                  //dispenser n°2
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot309
	MOVLW       1
	XORWF       _option+0, 0 
L__ler_bot309:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot24
;TCC_5.c,330 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot310
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot310:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot25
;TCC_5.c,332 :: 		num2++;                                      //incrementa num2
	INFSNZ      _num2+0, 1 
	INCF        _num2+1, 1 
;TCC_5.c,333 :: 		}
L_ler_bot25:
;TCC_5.c,334 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot311
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot311:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot26
;TCC_5.c,336 :: 		un2 = ~un2;                                 //inverte un2
	BTG         _un2+0, BitPos(_un2+0) 
;TCC_5.c,337 :: 		}
L_ler_bot26:
;TCC_5.c,339 :: 		if(num2>24) num2=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot312
	MOVF        _num2+0, 0 
	SUBLW       24
L__ler_bot312:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot27
	CLRF        _num2+0 
	CLRF        _num2+1 
L_ler_bot27:
;TCC_5.c,341 :: 		}                                              //end if option==1
L_ler_bot24:
;TCC_5.c,343 :: 		if(option==2)                                  //dispenser n°3
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot313
	MOVLW       2
	XORWF       _option+0, 0 
L__ler_bot313:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot28
;TCC_5.c,345 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot314
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot314:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot29
;TCC_5.c,347 :: 		num3++;                                      //incrementa num3
	INFSNZ      _num3+0, 1 
	INCF        _num3+1, 1 
;TCC_5.c,348 :: 		}
L_ler_bot29:
;TCC_5.c,349 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot315
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot315:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot30
;TCC_5.c,351 :: 		un3 = ~un3;                                 //inverte un3
	BTG         _un3+0, BitPos(_un3+0) 
;TCC_5.c,352 :: 		}
L_ler_bot30:
;TCC_5.c,354 :: 		if(num3>24) num3=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num3+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot316
	MOVF        _num3+0, 0 
	SUBLW       24
L__ler_bot316:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot31
	CLRF        _num3+0 
	CLRF        _num3+1 
L_ler_bot31:
;TCC_5.c,356 :: 		}                                              //end if option==2
L_ler_bot28:
;TCC_5.c,358 :: 		}                                               //end if BOTAO2 e b2_flag
L_ler_bot19:
;TCC_5.c,361 :: 		if(!BOTAO3) b3_flag=0x01;                       //se botão3 for pressionado, flag do botão3 = 1
	BTFSC       PORTC+0, 2 
	GOTO        L_ler_bot32
	BSF         _b3_flag+0, BitPos(_b3_flag+0) 
L_ler_bot32:
;TCC_5.c,363 :: 		if(BOTAO3 && b3_flag)                           //se botão3 for solto e flag do botão3 for 1
	BTFSS       PORTC+0, 2 
	GOTO        L_ler_bot35
	BTFSS       _b3_flag+0, BitPos(_b3_flag+0) 
	GOTO        L_ler_bot35
L__ler_bot262:
;TCC_5.c,365 :: 		LCD_Cmd(_LCD_CLEAR);                           //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,366 :: 		b3_flag     =  0x00;                           //limpa flag do botão3
	BCF         _b3_flag+0, BitPos(_b3_flag+0) 
;TCC_5.c,367 :: 		if(option==0)                                  //dispenser n°1
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot317
	MOVLW       0
	XORWF       _option+0, 0 
L__ler_bot317:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot36
;TCC_5.c,369 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot318
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot318:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot37
;TCC_5.c,371 :: 		num--;                                       //decrementa num
	MOVLW       1
	SUBWF       _num+0, 1 
	MOVLW       0
	SUBWFB      _num+1, 1 
;TCC_5.c,373 :: 		}
L_ler_bot37:
;TCC_5.c,374 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot319
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot319:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot38
;TCC_5.c,376 :: 		un = ~un;                                    //inverte un
	BTG         _un+0, BitPos(_un+0) 
;TCC_5.c,377 :: 		}
L_ler_bot38:
;TCC_5.c,379 :: 		if(num>24) num=24;                            //se o numero for maior que 24, vai para 24
	MOVLW       0
	MOVWF       R0 
	MOVF        _num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot320
	MOVF        _num+0, 0 
	SUBLW       24
L__ler_bot320:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot39
	MOVLW       24
	MOVWF       _num+0 
	MOVLW       0
	MOVWF       _num+1 
L_ler_bot39:
;TCC_5.c,380 :: 		}                                              //end if option==0
L_ler_bot36:
;TCC_5.c,382 :: 		if(option==1)                                  //dispenser n°2
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot321
	MOVLW       1
	XORWF       _option+0, 0 
L__ler_bot321:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot40
;TCC_5.c,384 :: 		if(prog==1)                                   //programação do número
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot322
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot322:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot41
;TCC_5.c,386 :: 		num2--;                                      //decrementa num2
	MOVLW       1
	SUBWF       _num2+0, 1 
	MOVLW       0
	SUBWFB      _num2+1, 1 
;TCC_5.c,388 :: 		}
L_ler_bot41:
;TCC_5.c,389 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot323
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot323:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot42
;TCC_5.c,391 :: 		un2 = ~un2;                                  //inverte un2
	BTG         _un2+0, BitPos(_un2+0) 
;TCC_5.c,392 :: 		}
L_ler_bot42:
;TCC_5.c,394 :: 		if(num2>24) num2=24;                          //se o numero for maior que 24, vai para 24
	MOVLW       0
	MOVWF       R0 
	MOVF        _num2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot324
	MOVF        _num2+0, 0 
	SUBLW       24
L__ler_bot324:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot43
	MOVLW       24
	MOVWF       _num2+0 
	MOVLW       0
	MOVWF       _num2+1 
L_ler_bot43:
;TCC_5.c,396 :: 		}                                              //end if option==1
L_ler_bot40:
;TCC_5.c,398 :: 		if(option==2)                                  //dispenser n°3
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot325
	MOVLW       2
	XORWF       _option+0, 0 
L__ler_bot325:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot44
;TCC_5.c,400 :: 		if(prog==1)                                   //programação do número
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot326
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot326:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot45
;TCC_5.c,402 :: 		num3--;                                      //decrementa num3
	MOVLW       1
	SUBWF       _num3+0, 1 
	MOVLW       0
	SUBWFB      _num3+1, 1 
;TCC_5.c,404 :: 		}
L_ler_bot45:
;TCC_5.c,405 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot327
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot327:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot46
;TCC_5.c,407 :: 		un3 = ~un3;                                  //inverte un3
	BTG         _un3+0, BitPos(_un3+0) 
;TCC_5.c,408 :: 		}
L_ler_bot46:
;TCC_5.c,410 :: 		if(num3>24) num3=24;                          //se o numero for maior que 24, vai para 24
	MOVLW       0
	MOVWF       R0 
	MOVF        _num3+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot328
	MOVF        _num3+0, 0 
	SUBLW       24
L__ler_bot328:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot47
	MOVLW       24
	MOVWF       _num3+0 
	MOVLW       0
	MOVWF       _num3+1 
L_ler_bot47:
;TCC_5.c,412 :: 		}                                              //end if option==2
L_ler_bot44:
;TCC_5.c,414 :: 		}                                               //end if botão3 e b3_flag
L_ler_bot35:
;TCC_5.c,417 :: 		if(!BOTAO4) b4_flag=0x01;                       //se botão4 for pressionado, flag do botão4 = 1
	BTFSC       PORTC+0, 4 
	GOTO        L_ler_bot48
	BSF         _b4_flag+0, BitPos(_b4_flag+0) 
L_ler_bot48:
;TCC_5.c,419 :: 		if(BOTAO4 && b4_flag)                           //se botão4 for solto e flag do botão4 for 1
	BTFSS       PORTC+0, 4 
	GOTO        L_ler_bot51
	BTFSS       _b4_flag+0, BitPos(_b4_flag+0) 
	GOTO        L_ler_bot51
L__ler_bot261:
;TCC_5.c,421 :: 		LCD_Cmd(_LCD_CLEAR);                          //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,422 :: 		b4_flag    =  0x00;                           //limpa flag do botão4
	BCF         _b4_flag+0, BitPos(_b4_flag+0) 
;TCC_5.c,423 :: 		if(num!=0 || num2!=0 || num3)                  //se num, num2 ou num3 for diferente 0
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot329
	MOVLW       0
	XORWF       _num+0, 0 
L__ler_bot329:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot260
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot330
	MOVLW       0
	XORWF       _num2+0, 0 
L__ler_bot330:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot260
	MOVF        _num3+0, 0 
	IORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot260
	GOTO        L_ler_bot54
L__ler_bot260:
;TCC_5.c,425 :: 		if(prog==0)                                   //se prog = 0
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot331
	MOVLW       0
	XORWF       _prog+0, 0 
L__ler_bot331:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot55
;TCC_5.c,427 :: 		if(!ligar)                                   //se bit de ligar = 0 (desligado)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot56
;TCC_5.c,429 :: 		temp =0x00;                                 //zera temp
	CLRF        _temp+0 
	CLRF        _temp+1 
;TCC_5.c,430 :: 		temp2=0x00;                                 //zera temp2
	CLRF        _temp2+0 
	CLRF        _temp2+1 
;TCC_5.c,431 :: 		temp3=0x00;                                 //zera temp3
	CLRF        _temp3+0 
	CLRF        _temp3+1 
;TCC_5.c,433 :: 		}                                            //end if !ligar
L_ler_bot56:
;TCC_5.c,434 :: 		ligar = ~ligar;                              //inverte ligar
	BTG         _ligar+0, BitPos(_ligar+0) 
;TCC_5.c,435 :: 		if(!ligar) display2 = 0x01;                  //se ligar for 0, bit display2 = 1
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot57
	BSF         _display2+0, BitPos(_display2+0) 
L_ler_bot57:
;TCC_5.c,437 :: 		}                                             //end if prog==0
L_ler_bot55:
;TCC_5.c,439 :: 		}                                              //end if num!=0 || num2!=0
L_ler_bot54:
;TCC_5.c,441 :: 		}                                               //end if BOTAO4 && b4_flag
L_ler_bot51:
;TCC_5.c,443 :: 		if(!un)                                         //se un = 0
	BTFSC       _un+0, BitPos(_un+0) 
	GOTO        L_ler_bot58
;TCC_5.c,445 :: 		mult = num * 1;                                //mult é num * 3600 (hora)
	MOVF        _num+0, 0 
	MOVWF       _mult+0 
	MOVF        _num+1, 0 
	MOVWF       _mult+1 
;TCC_5.c,446 :: 		}
L_ler_bot58:
;TCC_5.c,447 :: 		if(un)                                          //se un = 1
	BTFSS       _un+0, BitPos(_un+0) 
	GOTO        L_ler_bot59
;TCC_5.c,449 :: 		mult = num * 5;                                //mult é num * 86400 (dia)
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
;TCC_5.c,450 :: 		}
L_ler_bot59:
;TCC_5.c,452 :: 		if(!un2)                                        //se un2 = 0
	BTFSC       _un2+0, BitPos(_un2+0) 
	GOTO        L_ler_bot60
;TCC_5.c,454 :: 		mult2 = num2 * 1;                              //mult2 é num2 * 3600 (hora)
	MOVF        _num2+0, 0 
	MOVWF       _mult2+0 
	MOVF        _num2+1, 0 
	MOVWF       _mult2+1 
;TCC_5.c,455 :: 		}
L_ler_bot60:
;TCC_5.c,456 :: 		if(un2)                                         //se un2 = 1
	BTFSS       _un2+0, BitPos(_un2+0) 
	GOTO        L_ler_bot61
;TCC_5.c,458 :: 		mult2 = num2 * 5;                              //mult2 é num2 * 86400 (dia)
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
;TCC_5.c,459 :: 		}
L_ler_bot61:
;TCC_5.c,461 :: 		if(!un3)                                        //se un3 = 0
	BTFSC       _un3+0, BitPos(_un3+0) 
	GOTO        L_ler_bot62
;TCC_5.c,463 :: 		mult3 = num3 * 1;                              //mult3 é num3 * 3600 (hora)
	MOVF        _num3+0, 0 
	MOVWF       _mult3+0 
	MOVF        _num3+1, 0 
	MOVWF       _mult3+1 
;TCC_5.c,464 :: 		}
L_ler_bot62:
;TCC_5.c,465 :: 		if(un3)                                         //se un3 = 1
	BTFSS       _un3+0, BitPos(_un3+0) 
	GOTO        L_ler_bot63
;TCC_5.c,467 :: 		mult3 = num3 * 5;                              //mult3 é num3 * 86400 (dia)
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
;TCC_5.c,468 :: 		}
L_ler_bot63:
;TCC_5.c,471 :: 		if(!BOTAO5) b5_flag = 0x01;                     //se botão5 for pressionado, flag do botão5 = 1
	BTFSC       PORTC+0, 5 
	GOTO        L_ler_bot64
	BSF         _b5_flag+0, BitPos(_b5_flag+0) 
L_ler_bot64:
;TCC_5.c,473 :: 		if(BOTAO5 && b5_flag)                           //se botão5 for solto e flag do botão5 for 1
	BTFSS       PORTC+0, 5 
	GOTO        L_ler_bot67
	BTFSS       _b5_flag+0, BitPos(_b5_flag+0) 
	GOTO        L_ler_bot67
L__ler_bot259:
;TCC_5.c,475 :: 		LCD_Cmd(_LCD_CLEAR);                           //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,476 :: 		b5_flag = 0x00;                                //limpa flag do botão5
	BCF         _b5_flag+0, BitPos(_b5_flag+0) 
;TCC_5.c,477 :: 		if(prog != 0)                                  //se prog for diferente de 0
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot332
	MOVLW       0
	XORWF       _prog+0, 0 
L__ler_bot332:
	BTFSC       STATUS+0, 2 
	GOTO        L_ler_bot68
;TCC_5.c,479 :: 		option++;                                     //incrementa option
	INFSNZ      _option+0, 1 
	INCF        _option+1, 1 
;TCC_5.c,480 :: 		if(option == 3) option=0x00;                  //se option for 3, option = 0
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot333
	MOVLW       3
	XORWF       _option+0, 0 
L__ler_bot333:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot69
	CLRF        _option+0 
	CLRF        _option+1 
L_ler_bot69:
;TCC_5.c,481 :: 		}
L_ler_bot68:
;TCC_5.c,482 :: 		}                                               //end if BOTAO5 && b5_flag
L_ler_bot67:
;TCC_5.c,484 :: 		}                                                 //end ler_bot()
L_end_ler_bot:
	RETURN      0
; end of _ler_bot

_fast_incr:

;TCC_5.c,490 :: 		void fast_incr()
;TCC_5.c,492 :: 		if(temp_inc>7)temp_inc=0x00;                     //se temp_inc maior que 7, zera temp_inc
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_inc+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr335
	MOVF        _temp_inc+0, 0 
	SUBLW       7
L__fast_incr335:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr70
	CLRF        _temp_inc+0 
	CLRF        _temp_inc+1 
L_fast_incr70:
;TCC_5.c,493 :: 		if(temp_inc==7)                                  //conta 700ms...
	MOVLW       0
	XORWF       _temp_inc+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr336
	MOVLW       7
	XORWF       _temp_inc+0, 0 
L__fast_incr336:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr71
;TCC_5.c,495 :: 		temp_inc=0x00;                                  //zera temp_inc
	CLRF        _temp_inc+0 
	CLRF        _temp_inc+1 
;TCC_5.c,496 :: 		fast_inc=0x01;                                  //ativa fast_inc
	BSF         _fast_inc+0, BitPos(_fast_inc+0) 
;TCC_5.c,497 :: 		}                                                //end if temp_inc==7
L_fast_incr71:
;TCC_5.c,499 :: 		if(fast_inc)                                     //se fast_inc for ativado...
	BTFSS       _fast_inc+0, BitPos(_fast_inc+0) 
	GOTO        L_fast_incr72
;TCC_5.c,501 :: 		if(option==0 && prog==1)                        //se dispenser n°1 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr337
	MOVLW       0
	XORWF       _option+0, 0 
L__fast_incr337:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr75
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr338
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr338:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr75
L__fast_incr267:
;TCC_5.c,503 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr339
	MOVF        _temp_num+0, 0 
	SUBLW       5
L__fast_incr339:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr76
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr76:
;TCC_5.c,504 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr340
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr340:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr77
;TCC_5.c,506 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,507 :: 		num += 2;                                     //acrescenta 2 em num
	MOVLW       2
	ADDWF       _num+0, 1 
	MOVLW       0
	ADDWFC      _num+1, 1 
;TCC_5.c,509 :: 		}                                              //end if temp_num==5
L_fast_incr77:
;TCC_5.c,511 :: 		}                                               //end if option==0 && prog=1
L_fast_incr75:
;TCC_5.c,514 :: 		if(option==1 && prog==1)                        //se dispenser n°2 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr341
	MOVLW       1
	XORWF       _option+0, 0 
L__fast_incr341:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr80
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr342
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr342:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr80
L__fast_incr266:
;TCC_5.c,516 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr343
	MOVF        _temp_num+0, 0 
	SUBLW       5
L__fast_incr343:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr81
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr81:
;TCC_5.c,517 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr344
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr344:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr82
;TCC_5.c,519 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,520 :: 		num2 += 2;                                    //acrescenta 2 em num2
	MOVLW       2
	ADDWF       _num2+0, 1 
	MOVLW       0
	ADDWFC      _num2+1, 1 
;TCC_5.c,522 :: 		}                                              //end if temp_num==5
L_fast_incr82:
;TCC_5.c,524 :: 		}                                               //end if option==1 && prog=1
L_fast_incr80:
;TCC_5.c,526 :: 		if(num >24) num =0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr345
	MOVF        _num+0, 0 
	SUBLW       24
L__fast_incr345:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr83
	CLRF        _num+0 
	CLRF        _num+1 
L_fast_incr83:
;TCC_5.c,527 :: 		if(num2>24) num2=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr346
	MOVF        _num2+0, 0 
	SUBLW       24
L__fast_incr346:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr84
	CLRF        _num2+0 
	CLRF        _num2+1 
L_fast_incr84:
;TCC_5.c,528 :: 		if(num3>24) num3=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num3+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr347
	MOVF        _num3+0, 0 
	SUBLW       24
L__fast_incr347:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr85
	CLRF        _num3+0 
	CLRF        _num3+1 
L_fast_incr85:
;TCC_5.c,530 :: 		}                                                //end if fast_inc
L_fast_incr72:
;TCC_5.c,533 :: 		if(option==2 && prog==1)                         //se dispenser n°3 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr348
	MOVLW       2
	XORWF       _option+0, 0 
L__fast_incr348:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr88
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr349
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr349:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr88
L__fast_incr265:
;TCC_5.c,535 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr350
	MOVF        _temp_num+0, 0 
	SUBLW       5
L__fast_incr350:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr89
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr89:
;TCC_5.c,536 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr351
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr351:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr90
;TCC_5.c,538 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,539 :: 		num3 += 2;                                    //acrescenta 2 em num3
	MOVLW       2
	ADDWF       _num3+0, 1 
	MOVLW       0
	ADDWFC      _num3+1, 1 
;TCC_5.c,541 :: 		}                                              //end if temp_num==5
L_fast_incr90:
;TCC_5.c,543 :: 		}                                               //end if option==2 && prog=1
L_fast_incr88:
;TCC_5.c,545 :: 		}                                                 //end void fast_incr()
L_end_fast_incr:
	RETURN      0
; end of _fast_incr

_disp:

;TCC_5.c,551 :: 		void disp()
;TCC_5.c,553 :: 		if(!ligar && prog==0)                           //se ligar for 0 e prog for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_disp93
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp353
	MOVLW       0
	XORWF       _prog+0, 0 
L__disp353:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp93
L__disp271:
;TCC_5.c,555 :: 		if(!display && !display2)                      //se os bits diplay e display2 forem 0
	BTFSC       _display+0, BitPos(_display+0) 
	GOTO        L_disp96
	BTFSC       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp96
L__disp270:
;TCC_5.c,557 :: 		LCD_Out(1,1,"  DISPENSER DE  ");             //exibe "DISPENSER DE"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,558 :: 		LCD_Out(2,1,"    REMEDIOS    ");             //      "  REMEDIOS  "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,559 :: 		}
	GOTO        L_disp97
L_disp96:
;TCC_5.c,562 :: 		if(display && !display2)                      //se bits display for 1 e display2 for 0
	BTFSS       _display+0, BitPos(_display+0) 
	GOTO        L_disp100
	BTFSC       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp100
L__disp269:
;TCC_5.c,564 :: 		display=0x00;                                //limpa bit display
	BCF         _display+0, BitPos(_display+0) 
;TCC_5.c,565 :: 		LCD_Out(1,1,"ETEC LAURO GOMES");             //exibe "ETEC LAURO GOMES"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,566 :: 		LCD_Out(2,1,"  3A MECA 2021  ");             //      "  3A MECA 2021  "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,567 :: 		delay_ms(1000);                              //espera 1 segundo
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_disp101:
	DECFSZ      R13, 1, 1
	BRA         L_disp101
	DECFSZ      R12, 1, 1
	BRA         L_disp101
	DECFSZ      R11, 1, 1
	BRA         L_disp101
	NOP
	NOP
;TCC_5.c,568 :: 		}
L_disp100:
;TCC_5.c,569 :: 		if(!display && display2)                      //se os bits display for 0 e display2 for 1
	BTFSC       _display+0, BitPos(_display+0) 
	GOTO        L_disp104
	BTFSS       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp104
L__disp268:
;TCC_5.c,571 :: 		display2=0x00;                               //limpa bit display2
	BCF         _display2+0, BitPos(_display2+0) 
;TCC_5.c,572 :: 		LCD_Out(1,1,"     PARANDO    ");             //exibe "     PARANDO    "
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,573 :: 		LCD_Out(2,1,"     CONTAGEM   ");             //      "     CONTAGEM   "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,574 :: 		delay_ms(1000);                              //espera 1 segundo
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_disp105:
	DECFSZ      R13, 1, 1
	BRA         L_disp105
	DECFSZ      R12, 1, 1
	BRA         L_disp105
	DECFSZ      R11, 1, 1
	BRA         L_disp105
	NOP
	NOP
;TCC_5.c,575 :: 		}
L_disp104:
;TCC_5.c,576 :: 		}                                              //end else
L_disp97:
;TCC_5.c,577 :: 		}                                               //end if !ligar && prog==0
L_disp93:
;TCC_5.c,579 :: 		if(prog==1)                                     //programação de numeros
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp354
	MOVLW       1
	XORWF       _prog+0, 0 
L__disp354:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp106
;TCC_5.c,581 :: 		LCD_Out(1,1,"PROGRAME NUMERO:");               //exibe "PROGRAME NUMERO:
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,582 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,583 :: 		if(option==0) LCD_Chr(2,14,'1');               //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp355
	MOVLW       0
	XORWF       _option+0, 0 
L__disp355:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp107
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp107:
;TCC_5.c,584 :: 		if(option==1) LCD_Chr(2,14,'2');               //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp356
	MOVLW       1
	XORWF       _option+0, 0 
L__disp356:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp108
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp108:
;TCC_5.c,585 :: 		if(option==2) LCD_Chr(2,14,'3');              //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp357
	MOVLW       2
	XORWF       _option+0, 0 
L__disp357:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp109
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp109:
;TCC_5.c,586 :: 		}
L_disp106:
;TCC_5.c,588 :: 		if(prog==2)                                     //se prog for 2
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp358
	MOVLW       2
	XORWF       _prog+0, 0 
L__disp358:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp110
;TCC_5.c,590 :: 		LCD_Out(1,1,"PROGRAME Un.:");                  //exibe "PROGRAME Un.:"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,591 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,592 :: 		if(option==0) LCD_Chr(2,14,'1');               //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp359
	MOVLW       0
	XORWF       _option+0, 0 
L__disp359:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp111
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp111:
;TCC_5.c,593 :: 		if(option==1) LCD_Chr(2,14,'2');               //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp360
	MOVLW       1
	XORWF       _option+0, 0 
L__disp360:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp112
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp112:
;TCC_5.c,594 :: 		if(option==2) LCD_Chr(2,14,'3');              //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp361
	MOVLW       2
	XORWF       _option+0, 0 
L__disp361:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp113
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp113:
;TCC_5.c,595 :: 		}
L_disp110:
;TCC_5.c,597 :: 		if(ligar)                                       //se ligar for 1 (ligado)
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_disp114
;TCC_5.c,599 :: 		LCD_Out(1,1,"CONTANDO:   DISP");               //exibe "CONTANDO:   DISP";
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,600 :: 		if(temp_disp>20) temp_disp=0x00;               //se temp_disp for maior que 20, zera temp_disp
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_disp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp362
	MOVF        _temp_disp+0, 0 
	SUBLW       20
L__disp362:
	BTFSC       STATUS+0, 0 
	GOTO        L_disp115
	CLRF        _temp_disp+0 
	CLRF        _temp_disp+1 
L_disp115:
;TCC_5.c,601 :: 		if(temp_disp == 20)                            //se temp_disp for 20 (2 segundos)
	MOVLW       0
	XORWF       _temp_disp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp363
	MOVLW       20
	XORWF       _temp_disp+0, 0 
L__disp363:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp116
;TCC_5.c,603 :: 		temp_disp=0x00;                               //zera temp_disp
	CLRF        _temp_disp+0 
	CLRF        _temp_disp+1 
;TCC_5.c,604 :: 		option++;                                     //incrementa option
	INFSNZ      _option+0, 1 
	INCF        _option+1, 1 
;TCC_5.c,605 :: 		if(option == 3) option=0x00;                  //se option for 3, option = 0
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp364
	MOVLW       3
	XORWF       _option+0, 0 
L__disp364:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp117
	CLRF        _option+0 
	CLRF        _option+1 
L_disp117:
;TCC_5.c,606 :: 		if(option==0) LCD_Chr(2,14,'1');              //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp365
	MOVLW       0
	XORWF       _option+0, 0 
L__disp365:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp118
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp118:
;TCC_5.c,607 :: 		if(option==1) LCD_Chr(2,14,'2');              //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp366
	MOVLW       1
	XORWF       _option+0, 0 
L__disp366:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp119
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp119:
;TCC_5.c,608 :: 		if(option==2) LCD_Chr(2,14,'3');              //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp367
	MOVLW       2
	XORWF       _option+0, 0 
L__disp367:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp120
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp120:
;TCC_5.c,609 :: 		}
L_disp116:
;TCC_5.c,610 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,611 :: 		}
L_disp114:
;TCC_5.c,613 :: 		}                                                 //end disp()
L_end_disp:
	RETURN      0
; end of _disp

_num_un:

;TCC_5.c,619 :: 		void num_un()
;TCC_5.c,622 :: 		if(option==0)                                    //se option for 0 (dispenser n° 1 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un369
	MOVLW       0
	XORWF       _option+0, 0 
L__num_un369:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un121
;TCC_5.c,624 :: 		dig2 = num/10;                                  //dígito 2 é igual a num dividido por 10
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
;TCC_5.c,625 :: 		dig1 = num%10;                                  //digito 1 é igual a sobra da divisão de num por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,627 :: 		LCD_Chr(2,2,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,628 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,630 :: 		if(!un) LCD_Out(2,5,hora);                      //se un for zero, exibe "hora"
	BTFSC       _un+0, BitPos(_un+0) 
	GOTO        L_num_un122
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un122:
;TCC_5.c,632 :: 		if(un) LCD_Out(2,5,dia);                        //se un for um, exibe "dia"
	BTFSS       _un+0, BitPos(_un+0) 
	GOTO        L_num_un123
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un123:
;TCC_5.c,634 :: 		}                                                //end if option==0
L_num_un121:
;TCC_5.c,637 :: 		if(option==1)                                    //se option for 1 (dispenser n°2 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un370
	MOVLW       1
	XORWF       _option+0, 0 
L__num_un370:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un124
;TCC_5.c,639 :: 		dig2 = num2/10;                                 //digito 2 é igual a num2 dividido por 10
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
;TCC_5.c,640 :: 		dig1 = num2%10;                                 //digito 1 é igual a sobra da divisão de num2 por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,642 :: 		LCD_Chr(2,2,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,643 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,645 :: 		if(!un2) LCD_Out(2,5,hora);                     //se un2 for zero, exibe "hora"
	BTFSC       _un2+0, BitPos(_un2+0) 
	GOTO        L_num_un125
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un125:
;TCC_5.c,647 :: 		if(un2) LCD_Out(2,5,dia);                       //se un2 for um, exibe "dia"
	BTFSS       _un2+0, BitPos(_un2+0) 
	GOTO        L_num_un126
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un126:
;TCC_5.c,649 :: 		}                                                //end if option==1
L_num_un124:
;TCC_5.c,651 :: 		if(option==2)                                    //se option for 1 (dispenser n°2 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un371
	MOVLW       2
	XORWF       _option+0, 0 
L__num_un371:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un127
;TCC_5.c,653 :: 		dig2 = num3/10;                                 //digito 2 é igual a num3 dividido por 10
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
;TCC_5.c,654 :: 		dig1 = num3%10;                                 //digito 1 é igual a sobra da divisão de num3 por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,656 :: 		LCD_Chr(2,2,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,657 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,659 :: 		if(!un3) LCD_Out(2,5,hora);                     //se un3 for zero, exibe "hora"
	BTFSC       _un3+0, BitPos(_un3+0) 
	GOTO        L_num_un128
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un128:
;TCC_5.c,661 :: 		if(un3) LCD_Out(2,5,dia);                       //se un3 for um, exibe "dia"
	BTFSS       _un3+0, BitPos(_un3+0) 
	GOTO        L_num_un129
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un129:
;TCC_5.c,663 :: 		}                                                //end if option==2
L_num_un127:
;TCC_5.c,665 :: 		}                                                 //end num_un()
L_end_num_un:
	RETURN      0
; end of _num_un

_piscaLED:

;TCC_5.c,671 :: 		void piscaLED()
;TCC_5.c,674 :: 		if(ligar && !toque && num!=0)                   //se ligar for um(ligado), toque for zero e num diferente de zero...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED132
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L_piscaLED132
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED373
	MOVLW       0
	XORWF       _num+0, 0 
L__piscaLED373:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED132
L__piscaLED280:
;TCC_5.c,676 :: 		if(temp_led>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED374
	MOVLW       10
	SUBWF       _temp_led+0, 0 
L__piscaLED374:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED133
;TCC_5.c,678 :: 		temp_led = 0x00;                      //zera temp_led
	CLRF        _temp_led+0 
	CLRF        _temp_led+1 
;TCC_5.c,679 :: 		LED  = ~LED;                          //inverte LED de indicação do dispenser n°1
	BTG         PORTA+0, 0 
;TCC_5.c,680 :: 		}                                              //end if temp_led>=10
L_piscaLED133:
;TCC_5.c,682 :: 		}                                               //end if ligar && !toque && num!=0
	GOTO        L_piscaLED134
L_piscaLED132:
;TCC_5.c,686 :: 		if(ligar && toque)                             //se ligar for 1 e toque for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED137
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_piscaLED137
L__piscaLED279:
;TCC_5.c,688 :: 		if(temp_led>=2)                               //conta 200ms
	MOVLW       0
	SUBWF       _temp_led+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED375
	MOVLW       2
	SUBWF       _temp_led+0, 0 
L__piscaLED375:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED138
;TCC_5.c,690 :: 		temp_led=0x00;                               //zera temp_led
	CLRF        _temp_led+0 
	CLRF        _temp_led+1 
;TCC_5.c,691 :: 		LED = ~LED;                                  //inverte LED de indicação do dispenser n°1
	BTG         PORTA+0, 0 
;TCC_5.c,693 :: 		}                                             //end if temp_led>=2
L_piscaLED138:
;TCC_5.c,695 :: 		}                                              //end if ligar && toque
	GOTO        L_piscaLED139
L_piscaLED137:
;TCC_5.c,698 :: 		if(prog>0 && option==0)                       //se estiver em programação e dispenser n°1 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED376
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED376:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED142
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED377
	MOVLW       0
	XORWF       _option+0, 0 
L__piscaLED377:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED142
L__piscaLED278:
;TCC_5.c,700 :: 		LED = 0x01;                                  //LED do dispenser n°1 aceso
	BSF         PORTA+0, 0 
;TCC_5.c,701 :: 		}                                             //end if prog>0 && option==0
	GOTO        L_piscaLED143
L_piscaLED142:
;TCC_5.c,703 :: 		else LED = 0x00;                              //senão, LED do dispenser n°1 desligado
	BCF         PORTA+0, 0 
L_piscaLED143:
;TCC_5.c,705 :: 		}                                              //end else
L_piscaLED139:
;TCC_5.c,707 :: 		}                                               //end else
L_piscaLED134:
;TCC_5.c,711 :: 		if(temp_led2 ==5)                                //conta 500ms
	MOVLW       0
	XORWF       _temp_led2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED378
	MOVLW       5
	XORWF       _temp_led2+0, 0 
L__piscaLED378:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED144
;TCC_5.c,713 :: 		temp_led2=0x00;                                 //zera temp_led2
	CLRF        _temp_led2+0 
	CLRF        _temp_led2+1 
;TCC_5.c,714 :: 		LED2 = ~LED2;                                   //inverte estado do LED de indicação geral
	BTG         PORTA+0, 3 
;TCC_5.c,716 :: 		}                                                //end if temp_led==5
L_piscaLED144:
;TCC_5.c,718 :: 		if(ligar && !toque2 && num2!=0)                  //se ligar for 1, toque 2 for 0 e num2 diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED147
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_piscaLED147
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED379
	MOVLW       0
	XORWF       _num2+0, 0 
L__piscaLED379:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED147
L__piscaLED277:
;TCC_5.c,720 :: 		if(temp_led3>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED380
	MOVLW       10
	SUBWF       _temp_led3+0, 0 
L__piscaLED380:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED148
;TCC_5.c,722 :: 		temp_led3 = 0x00;                              //zera temp_led3
	CLRF        _temp_led3+0 
	CLRF        _temp_led3+1 
;TCC_5.c,723 :: 		LED3 = ~LED3;                                  //inverte estado do LED de indicação do dispenser n°2
	BTG         PORTB+0, 0 
;TCC_5.c,725 :: 		}                                               //end if temp_led3>=10
L_piscaLED148:
;TCC_5.c,727 :: 		}                                                //end if ligar && !toque2 && num2!=0
	GOTO        L_piscaLED149
L_piscaLED147:
;TCC_5.c,731 :: 		if(ligar && toque2)                             //se ligar e toque2 for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED152
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_piscaLED152
L__piscaLED276:
;TCC_5.c,733 :: 		if(temp_led3>=2)                               //conta 200 milisegundos
	MOVLW       0
	SUBWF       _temp_led3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED381
	MOVLW       2
	SUBWF       _temp_led3+0, 0 
L__piscaLED381:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED153
;TCC_5.c,735 :: 		temp_led3=0x00;                               //zera temp_led3
	CLRF        _temp_led3+0 
	CLRF        _temp_led3+1 
;TCC_5.c,736 :: 		LED3 = ~LED3;                                 //inverte estado do LED de indicação do dispenser n°2
	BTG         PORTB+0, 0 
;TCC_5.c,738 :: 		}                                              //end if temp_led3>=2
L_piscaLED153:
;TCC_5.c,740 :: 		}                                               //end if ligar && toque2
	GOTO        L_piscaLED154
L_piscaLED152:
;TCC_5.c,744 :: 		if(prog>0 && option==1)                        //se estiver em programação e dispenser n°2 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED382
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED382:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED157
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED383
	MOVLW       1
	XORWF       _option+0, 0 
L__piscaLED383:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED157
L__piscaLED275:
;TCC_5.c,746 :: 		LED3 = 0x01;                                  //LED do dispenser n°2 aceso
	BSF         PORTB+0, 0 
;TCC_5.c,747 :: 		}                                              //end if prog>0 && option==1
	GOTO        L_piscaLED158
L_piscaLED157:
;TCC_5.c,749 :: 		else LED3 = 0x00;                               //senão, LED do dispenser n°2 desligado
	BCF         PORTB+0, 0 
L_piscaLED158:
;TCC_5.c,751 :: 		}                                               //end else
L_piscaLED154:
;TCC_5.c,753 :: 		}                                                //end else
L_piscaLED149:
;TCC_5.c,755 :: 		if(ligar && !toque3 && num3!=0)                  //se ligar for 1, toque3 for 0 e num3 diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED161
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_piscaLED161
	MOVLW       0
	XORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED384
	MOVLW       0
	XORWF       _num3+0, 0 
L__piscaLED384:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED161
L__piscaLED274:
;TCC_5.c,757 :: 		if(temp_led4>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED385
	MOVLW       10
	SUBWF       _temp_led4+0, 0 
L__piscaLED385:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED162
;TCC_5.c,759 :: 		temp_led4 = 0x00;                              //zera temp_led4
	CLRF        _temp_led4+0 
	CLRF        _temp_led4+1 
;TCC_5.c,760 :: 		LED4 = ~LED4;                                  //inverte estado do LED de indicação do dispenser n°3
	BTG         PORTB+0, 1 
;TCC_5.c,762 :: 		}                                               //end if temp_led4>=10
L_piscaLED162:
;TCC_5.c,764 :: 		}                                                //end if ligar && !toque3 && num3!=0
	GOTO        L_piscaLED163
L_piscaLED161:
;TCC_5.c,768 :: 		if(ligar && toque3)                             //se ligar e toque3 for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED166
	BTFSS       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_piscaLED166
L__piscaLED273:
;TCC_5.c,770 :: 		if(temp_led4>=2)                               //conta 200 milisegundos
	MOVLW       0
	SUBWF       _temp_led4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED386
	MOVLW       2
	SUBWF       _temp_led4+0, 0 
L__piscaLED386:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED167
;TCC_5.c,772 :: 		temp_led4=0x00;                               //zera temp_led4
	CLRF        _temp_led4+0 
	CLRF        _temp_led4+1 
;TCC_5.c,773 :: 		LED4 = ~LED4;                                 //inverte estado do LED de indicação do dispenser n°3
	BTG         PORTB+0, 1 
;TCC_5.c,775 :: 		}                                              //end if temp_led4>=2
L_piscaLED167:
;TCC_5.c,777 :: 		}                                               //end if ligar && toque3
	GOTO        L_piscaLED168
L_piscaLED166:
;TCC_5.c,781 :: 		if(prog>0 && option==2)                        //se estiver em programação e dispenser n°3 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED387
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED387:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED171
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED388
	MOVLW       2
	XORWF       _option+0, 0 
L__piscaLED388:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED171
L__piscaLED272:
;TCC_5.c,783 :: 		LED4 = 0x01;                                  //LED do dispenser n°3 aceso
	BSF         PORTB+0, 1 
;TCC_5.c,784 :: 		}                                              //end if prog>0 && option==2
	GOTO        L_piscaLED172
L_piscaLED171:
;TCC_5.c,786 :: 		else LED4 = 0x00;                               //senão, LED do dispenser n°3 desligado
	BCF         PORTB+0, 1 
L_piscaLED172:
;TCC_5.c,788 :: 		}                                               //end else
L_piscaLED168:
;TCC_5.c,790 :: 		}                                                //end else
L_piscaLED163:
;TCC_5.c,792 :: 		}                                                 //end piscaLED()
L_end_piscaLED:
	RETURN      0
; end of _piscaLED

_timebase:

;TCC_5.c,799 :: 		void timebase()
;TCC_5.c,801 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase173
;TCC_5.c,803 :: 		temp_ligado = 0x00;                            //zera temp_ligado
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
;TCC_5.c,804 :: 		}
L_timebase173:
;TCC_5.c,805 :: 		if(ligar && num!=0)                             //se ligar for 1 e num diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase176
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase390
	MOVLW       0
	XORWF       _num+0, 0 
L__timebase390:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase176
L__timebase281:
;TCC_5.c,807 :: 		if(temp==10)                                   //conta 1 segundo
	MOVLW       0
	XORWF       _temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase391
	MOVLW       10
	XORWF       _temp+0, 0 
L__timebase391:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase177
;TCC_5.c,809 :: 		temp = 0x00;                                  //zera temp
	CLRF        _temp+0 
	CLRF        _temp+1 
;TCC_5.c,810 :: 		temp_ligado++;                                //incrementa temp_ligado a cada 1 segundo
	INFSNZ      _temp_ligado+0, 1 
	INCF        _temp_ligado+1, 1 
;TCC_5.c,812 :: 		}                                              //end if temp==10
L_timebase177:
;TCC_5.c,814 :: 		if(temp_ligado==mult)                          //compara a igualdade de temp_ligado com mult
	MOVF        _temp_ligado+1, 0 
	XORWF       _mult+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase392
	MOVF        _mult+0, 0 
	XORWF       _temp_ligado+0, 0 
L__timebase392:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase178
;TCC_5.c,816 :: 		toque = 0x01;                                 //liga o bit toque
	BSF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,817 :: 		atv_mot = 0x01;                               //liga o bit de ativação do motor
	BSF         _atv_mot+0, BitPos(_atv_mot+0) 
;TCC_5.c,818 :: 		abre_mot();                                   //define os bits de controle do motor para abri-lo
	CALL        _abre_mot+0, 0
;TCC_5.c,820 :: 		}                                              //end if temp_ligado==mult
L_timebase178:
;TCC_5.c,822 :: 		if(atv_mot)                                    //se ativação do motor for ligada...
	BTFSS       _atv_mot+0, BitPos(_atv_mot+0) 
	GOTO        L_timebase179
;TCC_5.c,824 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,826 :: 		}                                              //end if atv_mot
	GOTO        L_timebase180
L_timebase179:
;TCC_5.c,830 :: 		alarme();                                     //executa o alarme
	CALL        _alarme+0, 0
;TCC_5.c,831 :: 		}
L_timebase180:
;TCC_5.c,832 :: 		}                                               //end if ligar
L_timebase176:
;TCC_5.c,834 :: 		}                                                 //end timebase()
L_end_timebase:
	RETURN      0
; end of _timebase

_timebase2:

;TCC_5.c,841 :: 		void timebase2()
;TCC_5.c,843 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase2181
;TCC_5.c,845 :: 		temp_ligado2 = 0x00;                           //zera temp_ligado2
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
;TCC_5.c,846 :: 		}
L_timebase2181:
;TCC_5.c,848 :: 		if(ligar && num2!=0)                            //se ligar for 1 e num2 diferente de 0
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase2184
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2394
	MOVLW       0
	XORWF       _num2+0, 0 
L__timebase2394:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase2184
L__timebase2282:
;TCC_5.c,850 :: 		if(temp2==10)                                  //conta 1 segundo
	MOVLW       0
	XORWF       _temp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2395
	MOVLW       10
	XORWF       _temp2+0, 0 
L__timebase2395:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase2185
;TCC_5.c,852 :: 		temp2 = 0x00;                                 //zera temp2
	CLRF        _temp2+0 
	CLRF        _temp2+1 
;TCC_5.c,853 :: 		temp_ligado2++;                               //incrementa temp_ligado2 a cada 1 segundo
	INFSNZ      _temp_ligado2+0, 1 
	INCF        _temp_ligado2+1, 1 
;TCC_5.c,855 :: 		}                                              //end if temp2==10
L_timebase2185:
;TCC_5.c,857 :: 		if(temp_ligado2==mult2)                        //compara igualdade entre temp_ligado2 e mult2
	MOVF        _temp_ligado2+1, 0 
	XORWF       _mult2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2396
	MOVF        _mult2+0, 0 
	XORWF       _temp_ligado2+0, 0 
L__timebase2396:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase2186
;TCC_5.c,859 :: 		toque2 = 0x01;                                //liga o bit toque2
	BSF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,860 :: 		atv_mot2 = 0x01;                              //liga o bit de aativação do motor 2
	BSF         _atv_mot2+0, BitPos(_atv_mot2+0) 
;TCC_5.c,861 :: 		abre_mot2();                                  //define os bits de controle do motor 2 para abrir
	CALL        _abre_mot2+0, 0
;TCC_5.c,863 :: 		}                                              //end if temp_ligado2==mult2
L_timebase2186:
;TCC_5.c,865 :: 		if(atv_mot2)                                   //se ativação do motor 2 ligada...
	BTFSS       _atv_mot2+0, BitPos(_atv_mot2+0) 
	GOTO        L_timebase2187
;TCC_5.c,867 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,869 :: 		}                                              //end if atv_mot2
	GOTO        L_timebase2188
L_timebase2187:
;TCC_5.c,873 :: 		alarme();                                     //aciona o alarme
	CALL        _alarme+0, 0
;TCC_5.c,875 :: 		}                                              //end else
L_timebase2188:
;TCC_5.c,877 :: 		}                                               //end if ligar && num2!=0
L_timebase2184:
;TCC_5.c,879 :: 		}                                                 //end timebase2()
L_end_timebase2:
	RETURN      0
; end of _timebase2

_timebase3:

;TCC_5.c,886 :: 		void timebase3()
;TCC_5.c,888 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase3189
;TCC_5.c,890 :: 		temp_ligado3 = 0x00;                           //zera temp_ligado3
	CLRF        _temp_ligado3+0 
	CLRF        _temp_ligado3+1 
;TCC_5.c,891 :: 		}
L_timebase3189:
;TCC_5.c,893 :: 		if(ligar && num3!=0)                            //se ligar for 1 e num3 diferente de 0
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase3192
	MOVLW       0
	XORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3398
	MOVLW       0
	XORWF       _num3+0, 0 
L__timebase3398:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase3192
L__timebase3283:
;TCC_5.c,895 :: 		if(temp3==10)                                  //conta 1 segundo
	MOVLW       0
	XORWF       _temp3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3399
	MOVLW       10
	XORWF       _temp3+0, 0 
L__timebase3399:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase3193
;TCC_5.c,897 :: 		temp3 = 0x00;                                 //zera temp3
	CLRF        _temp3+0 
	CLRF        _temp3+1 
;TCC_5.c,898 :: 		temp_ligado3++;                               //incrementa temp_ligado3 a cada 1 segundo
	INFSNZ      _temp_ligado3+0, 1 
	INCF        _temp_ligado3+1, 1 
;TCC_5.c,900 :: 		}                                              //end if temp3==10
L_timebase3193:
;TCC_5.c,902 :: 		if(temp_ligado3==mult3)                        //compara igualdade entre temp_ligado3 e mult3
	MOVF        _temp_ligado3+1, 0 
	XORWF       _mult3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3400
	MOVF        _mult3+0, 0 
	XORWF       _temp_ligado3+0, 0 
L__timebase3400:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase3194
;TCC_5.c,904 :: 		toque3 = 0x01;                                //liga o bit toque3
	BSF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,905 :: 		atv_mot3 = 0x01;                              //liga o bit de aativação do motor 3
	BSF         _atv_mot3+0, BitPos(_atv_mot3+0) 
;TCC_5.c,906 :: 		abre_mot3();                                  //define os bits de controle do motor 3 para abrir
	CALL        _abre_mot3+0, 0
;TCC_5.c,908 :: 		}                                              //end if temp_ligado3==mult3
L_timebase3194:
;TCC_5.c,910 :: 		if(atv_mot3)                                   //se ativação do motor 3 ligada...
	BTFSS       _atv_mot3+0, BitPos(_atv_mot3+0) 
	GOTO        L_timebase3195
;TCC_5.c,912 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,914 :: 		}                                              //end if atv_mot3
	GOTO        L_timebase3196
L_timebase3195:
;TCC_5.c,918 :: 		alarme();                                     //aciona o alarme
	CALL        _alarme+0, 0
;TCC_5.c,920 :: 		}                                              //end else
L_timebase3196:
;TCC_5.c,922 :: 		}                                               //end if ligar && num3!=0
L_timebase3192:
;TCC_5.c,924 :: 		}                                                 //end timebase3()
L_end_timebase3:
	RETURN      0
; end of _timebase3

_alarme:

;TCC_5.c,930 :: 		void alarme()
;TCC_5.c,932 :: 		if(toque || toque2 || toque3)                    //se toque, toque2 ou toque3 for 1
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L__alarme284
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L__alarme284
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L__alarme284
	GOTO        L_alarme199
L__alarme284:
;TCC_5.c,934 :: 		if(vezes <10)                                  //se vezes for menor que 10
	MOVLW       0
	SUBWF       _vezes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__alarme402
	MOVLW       10
	SUBWF       _vezes+0, 0 
L__alarme402:
	BTFSC       STATUS+0, 0 
	GOTO        L_alarme200
;TCC_5.c,936 :: 		toca_som();                                   //executa a toca do SOM
	CALL        _toca_som+0, 0
;TCC_5.c,938 :: 		}                                              //end if vezes<10
	GOTO        L_alarme201
L_alarme200:
;TCC_5.c,942 :: 		if(toque)                                     //se toque for 1
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_alarme202
;TCC_5.c,944 :: 		toque=0x00;                                  //limpa o bit toque
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,945 :: 		temp_ligado=0x00;                            //zera temp_ligado para recomeçar a contagem
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
;TCC_5.c,947 :: 		}                                             //end if toque
L_alarme202:
;TCC_5.c,949 :: 		if(toque2)                                    //se toque2 for 1
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_alarme203
;TCC_5.c,951 :: 		toque2=0x00;                                 //limpa o bit toque 2
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,952 :: 		temp_ligado2=0x00;                           //zera temp_ligado2 para recomeçar a contagem
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
;TCC_5.c,954 :: 		}                                             //end if toque2
L_alarme203:
;TCC_5.c,956 :: 		if(toque3)                                    //se toque2 for 1
	BTFSS       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_alarme204
;TCC_5.c,958 :: 		toque3=0x00;                                 //limpa o bit toque3
	BCF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,959 :: 		temp_ligado3=0x00;                           //zera temp_ligado3 para recomeçar a contagem
	CLRF        _temp_ligado3+0 
	CLRF        _temp_ligado3+1 
;TCC_5.c,961 :: 		}                                             //end if toque3
L_alarme204:
;TCC_5.c,963 :: 		vezes=0x00;                                  //zera vezes
	CLRF        _vezes+0 
	CLRF        _vezes+1 
;TCC_5.c,964 :: 		SOM = 0x00;                                  //desliga o som
	BCF         PORTA+0, 2 
;TCC_5.c,966 :: 		}                                              //end else
L_alarme201:
;TCC_5.c,968 :: 		}                                                //end if toque || toque2 || toque3
L_alarme199:
;TCC_5.c,970 :: 		}                                                 //end alarme()
L_end_alarme:
	RETURN      0
; end of _alarme

_toca_som:

;TCC_5.c,976 :: 		void toca_som()
;TCC_5.c,978 :: 		if(temp_som>3) temp_som=0x00;                    //se temp_som for maior que 3, zera temp_som
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_som+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__toca_som404
	MOVF        _temp_som+0, 0 
	SUBLW       3
L__toca_som404:
	BTFSC       STATUS+0, 0 
	GOTO        L_toca_som205
	CLRF        _temp_som+0 
	CLRF        _temp_som+1 
L_toca_som205:
;TCC_5.c,979 :: 		if(temp_som==3)                               //conta 300 milisegundos...
	MOVLW       0
	XORWF       _temp_som+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__toca_som405
	MOVLW       3
	XORWF       _temp_som+0, 0 
L__toca_som405:
	BTFSS       STATUS+0, 2 
	GOTO        L_toca_som206
;TCC_5.c,981 :: 		temp_som = 0x00;                             //zera temp_som
	CLRF        _temp_som+0 
	CLRF        _temp_som+1 
;TCC_5.c,982 :: 		SOM = ~SOM;                                  //inverte o estado do buzzer
	BTG         PORTA+0, 2 
;TCC_5.c,983 :: 		vezes++;                                     //incrementa vezes
	INFSNZ      _vezes+0, 1 
	INCF        _vezes+1, 1 
;TCC_5.c,985 :: 		if(!ligar)                                   //se ligar for 0 (desligado)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_toca_som207
;TCC_5.c,987 :: 		vezes = 0x00;                               //zera vezes
	CLRF        _vezes+0 
	CLRF        _vezes+1 
;TCC_5.c,988 :: 		SOM   = 0x00;                               //desliga o buzzer
	BCF         PORTA+0, 2 
;TCC_5.c,990 :: 		}                                            //end if !ligar
L_toca_som207:
;TCC_5.c,992 :: 		}                                             //end if temp_som==3
L_toca_som206:
;TCC_5.c,994 :: 		}                                                 //end toca_som()
L_end_toca_som:
	RETURN      0
; end of _toca_som

_abre_mot:

;TCC_5.c,1001 :: 		void abre_mot()
;TCC_5.c,1003 :: 		open_bit  = 0x01;                                //seta bit de abertura
	BSF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,1004 :: 		close_bit = 0x00;                                //limpa bit de fechamento
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,1005 :: 		x_mot     = 0x00;                                //zera x_mot
	CLRF        _x_mot+0 
	CLRF        _x_mot+1 
;TCC_5.c,1007 :: 		}                                                 //end abre_mot()
L_end_abre_mot:
	RETURN      0
; end of _abre_mot

_abre_mot2:

;TCC_5.c,1014 :: 		void abre_mot2()
;TCC_5.c,1016 :: 		open_bit2  = 0x01;                               //seta bit de abertura
	BSF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,1017 :: 		close_bit2 = 0x00;                               //limpa bit de fechamento
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,1018 :: 		x_mot2     = 0x00;                               //zera x_mot
	CLRF        _x_mot2+0 
	CLRF        _x_mot2+1 
;TCC_5.c,1020 :: 		}                                                 //end abre_mot2()
L_end_abre_mot2:
	RETURN      0
; end of _abre_mot2

_abre_mot3:

;TCC_5.c,1027 :: 		void abre_mot3()
;TCC_5.c,1029 :: 		open_bit3  = 0x01;                               //seta bit de abertura
	BSF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,1030 :: 		close_bit3 = 0x00;                               //limpa bit de fechamento
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1031 :: 		x_mot3     = 0x00;                               //zera x_mot
	CLRF        _x_mot3+0 
	CLRF        _x_mot3+1 
;TCC_5.c,1033 :: 		}                                                 //end abre_mot3()
L_end_abre_mot3:
	RETURN      0
; end of _abre_mot3

_mot_aberto:

;TCC_5.c,1039 :: 		void mot_aberto()
;TCC_5.c,1041 :: 		if(x_mot<10)                                     //se x_mot for menor que 10...
	MOVLW       0
	SUBWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto410
	MOVLW       10
	SUBWF       _x_mot+0, 0 
L__mot_aberto410:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto208
;TCC_5.c,1043 :: 		SM=0;                                         //  ||
	BCF         PORTA+0, 1 
;TCC_5.c,1044 :: 		delay_us(18000);                              //  ||
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto209:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto209
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto209
	NOP
	NOP
;TCC_5.c,1045 :: 		SM=1;                                         //  ||
	BSF         PORTA+0, 1 
;TCC_5.c,1046 :: 		delay_us(2000);                               //  \/
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto210:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto210
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto210
	NOP
;TCC_5.c,1047 :: 		SM=0;                                         // liga motor 1 no sentido horário
	BCF         PORTA+0, 1 
;TCC_5.c,1048 :: 		x_mot ++;                                     //incrementa x_mot
	INFSNZ      _x_mot+0, 1 
	INCF        _x_mot+1, 1 
;TCC_5.c,1050 :: 		}                                               //end if x_mot<10
L_mot_aberto208:
;TCC_5.c,1052 :: 		if(x_mot == 10)                                 //se x_mot for 10...
	MOVLW       0
	XORWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto411
	MOVLW       10
	XORWF       _x_mot+0, 0 
L__mot_aberto411:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto211
;TCC_5.c,1054 :: 		fecha_mot();                                  //executa a configuração dos bits de controle do motor 1 para fechar
	CALL        _fecha_mot+0, 0
;TCC_5.c,1056 :: 		}                                              //end if x_mot==10
L_mot_aberto211:
;TCC_5.c,1058 :: 		}                                                 //end mot_aberto()
L_end_mot_aberto:
	RETURN      0
; end of _mot_aberto

_mot_aberto2:

;TCC_5.c,1064 :: 		void mot_aberto2()
;TCC_5.c,1066 :: 		if(x_mot2<10)                                    //se x_mot2 for menor que 10...
	MOVLW       0
	SUBWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2413
	MOVLW       10
	SUBWF       _x_mot2+0, 0 
L__mot_aberto2413:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto2212
;TCC_5.c,1068 :: 		SM2=0;                                        //  ||
	BCF         PORTA+0, 4 
;TCC_5.c,1069 :: 		delay_us(18000);                              //  ||
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto2213:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto2213
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto2213
	NOP
	NOP
;TCC_5.c,1070 :: 		SM2=1;                                        //  ||
	BSF         PORTA+0, 4 
;TCC_5.c,1071 :: 		delay_us(2000);                               //  \/
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto2214:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto2214
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto2214
	NOP
;TCC_5.c,1072 :: 		SM2=0;                                        //liga motor 2 no sentido horário
	BCF         PORTA+0, 4 
;TCC_5.c,1073 :: 		x_mot2 ++;                                    //incrementa x_mot2
	INFSNZ      _x_mot2+0, 1 
	INCF        _x_mot2+1, 1 
;TCC_5.c,1075 :: 		}                                               //end if x_mot2<10
L_mot_aberto2212:
;TCC_5.c,1077 :: 		if(x_mot2 == 10)                                //se x_mot2 for 10...
	MOVLW       0
	XORWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2414
	MOVLW       10
	XORWF       _x_mot2+0, 0 
L__mot_aberto2414:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto2215
;TCC_5.c,1079 :: 		fecha_mot2();                                 //executa a configuração dos bits de controle do motor 2 para fechar
	CALL        _fecha_mot2+0, 0
;TCC_5.c,1081 :: 		}                                              //end if x_mot2==10
L_mot_aberto2215:
;TCC_5.c,1083 :: 		}                                                 //end mot_aberto2()
L_end_mot_aberto2:
	RETURN      0
; end of _mot_aberto2

_mot_aberto3:

;TCC_5.c,1089 :: 		void mot_aberto3()
;TCC_5.c,1091 :: 		if(x_mot3<10)                                    //se x_mot3 for menor que 10...
	MOVLW       0
	SUBWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto3416
	MOVLW       10
	SUBWF       _x_mot3+0, 0 
L__mot_aberto3416:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto3216
;TCC_5.c,1093 :: 		SM3=0;                                        //  ||
	BCF         PORTA+0, 5 
;TCC_5.c,1094 :: 		delay_us(18000);                              //  ||
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto3217:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto3217
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto3217
	NOP
	NOP
;TCC_5.c,1095 :: 		SM3=1;                                        //  ||
	BSF         PORTA+0, 5 
;TCC_5.c,1096 :: 		delay_us(2000);                               //  \/
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto3218:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto3218
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto3218
	NOP
;TCC_5.c,1097 :: 		SM3=0;                                        // liga motor 1 no sentido horário
	BCF         PORTA+0, 5 
;TCC_5.c,1098 :: 		x_mot3 ++;                                    //incrementa x_mot3
	INFSNZ      _x_mot3+0, 1 
	INCF        _x_mot3+1, 1 
;TCC_5.c,1100 :: 		}                                               //end if x_mot3<10
L_mot_aberto3216:
;TCC_5.c,1102 :: 		if(x_mot3 == 10)                                //se x_mot3 for 10...
	MOVLW       0
	XORWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto3417
	MOVLW       10
	XORWF       _x_mot3+0, 0 
L__mot_aberto3417:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto3219
;TCC_5.c,1104 :: 		fecha_mot3();                                 //executa a configuração dos bits de controle do motor 3 para fechar
	CALL        _fecha_mot3+0, 0
;TCC_5.c,1106 :: 		}                                              //end if x_mot3==10
L_mot_aberto3219:
;TCC_5.c,1108 :: 		}                                                 //end mot_aberto3()
L_end_mot_aberto3:
	RETURN      0
; end of _mot_aberto3

_fecha_mot:

;TCC_5.c,1115 :: 		void fecha_mot()
;TCC_5.c,1117 :: 		open_bit  = 0x00;                                //limpa o bit de abertura
	BCF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,1118 :: 		close_bit = 0x01;                                //seta o bit de fechamento
	BSF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,1119 :: 		x_mot     = 0x00;                                //zera x_mot
	CLRF        _x_mot+0 
	CLRF        _x_mot+1 
;TCC_5.c,1121 :: 		}                                                 //end fecha_mot()
L_end_fecha_mot:
	RETURN      0
; end of _fecha_mot

_fecha_mot2:

;TCC_5.c,1128 :: 		void fecha_mot2()
;TCC_5.c,1130 :: 		open_bit2  = 0x00;                               //limpa o bit de abertura
	BCF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,1131 :: 		close_bit2 = 0x01;                               //seta o bit de fechamento
	BSF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,1132 :: 		x_mot2     = 0x00;                               //zera x_mot2
	CLRF        _x_mot2+0 
	CLRF        _x_mot2+1 
;TCC_5.c,1134 :: 		}                                                 //end fecha_mot2()
L_end_fecha_mot2:
	RETURN      0
; end of _fecha_mot2

_fecha_mot3:

;TCC_5.c,1141 :: 		void fecha_mot3()
;TCC_5.c,1143 :: 		open_bit3  = 0x00;                               //limpa o bit de abertura
	BCF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,1144 :: 		close_bit3 = 0x01;                               //seta o bit de fechamento
	BSF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1145 :: 		x_mot3     = 0x00;                               //zera x_mot3
	CLRF        _x_mot3+0 
	CLRF        _x_mot3+1 
;TCC_5.c,1147 :: 		}                                                 //end fecha_mot3()
L_end_fecha_mot3:
	RETURN      0
; end of _fecha_mot3

_mot_fechado:

;TCC_5.c,1153 :: 		void mot_fechado()
;TCC_5.c,1155 :: 		if(x_mot<10)                                     //se x_mot for menor que 10
	MOVLW       0
	SUBWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado422
	MOVLW       10
	SUBWF       _x_mot+0, 0 
L__mot_fechado422:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado220
;TCC_5.c,1157 :: 		SM=0;                                         //  ||
	BCF         PORTA+0, 1 
;TCC_5.c,1158 :: 		delay_us(18500);                              //  ||
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado221:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado221
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado221
	NOP
	NOP
;TCC_5.c,1159 :: 		SM=1;                                         //  ||
	BSF         PORTA+0, 1 
;TCC_5.c,1160 :: 		delay_us(1500);                               //  \/
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado222:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado222
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado222
	NOP
;TCC_5.c,1161 :: 		SM=0;                                         //leva o motor para a posição inicial
	BCF         PORTA+0, 1 
;TCC_5.c,1162 :: 		x_mot++;                                      //incrementa x_mot
	INFSNZ      _x_mot+0, 1 
	INCF        _x_mot+1, 1 
;TCC_5.c,1164 :: 		}                                               //end if x_mot<10
L_mot_fechado220:
;TCC_5.c,1166 :: 		if(x_mot==10)                                   //se x_mot for 10
	MOVLW       0
	XORWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado423
	MOVLW       10
	XORWF       _x_mot+0, 0 
L__mot_fechado423:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado223
;TCC_5.c,1168 :: 		close_bit = 0x00;                            //limpa o bit de fechamento
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,1170 :: 		}                                             //end if x_mot==10
L_mot_fechado223:
;TCC_5.c,1172 :: 		}                                                 //end mot_fechado
L_end_mot_fechado:
	RETURN      0
; end of _mot_fechado

_mot_fechado2:

;TCC_5.c,1178 :: 		void mot_fechado2()
;TCC_5.c,1180 :: 		if(x_mot2<10)                                   //se x_mot2 for menor que 10
	MOVLW       0
	SUBWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2425
	MOVLW       10
	SUBWF       _x_mot2+0, 0 
L__mot_fechado2425:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado2224
;TCC_5.c,1182 :: 		SM2=0;                                        //  ||
	BCF         PORTA+0, 4 
;TCC_5.c,1183 :: 		delay_us(18500);                              //  ||
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado2225:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado2225
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado2225
	NOP
	NOP
;TCC_5.c,1184 :: 		SM2=1;                                        //  ||
	BSF         PORTA+0, 4 
;TCC_5.c,1185 :: 		delay_us(1500);                               //  \/
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado2226:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado2226
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado2226
	NOP
;TCC_5.c,1186 :: 		SM2=0;                                        //leva o motor 2 para a posição inicial
	BCF         PORTA+0, 4 
;TCC_5.c,1187 :: 		x_mot2++;                                     //incrementa x_mot2
	INFSNZ      _x_mot2+0, 1 
	INCF        _x_mot2+1, 1 
;TCC_5.c,1189 :: 		}                                               //end if x_mot2<10
L_mot_fechado2224:
;TCC_5.c,1191 :: 		if(x_mot2==10)                                  //se x_mot2 for 10
	MOVLW       0
	XORWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2426
	MOVLW       10
	XORWF       _x_mot2+0, 0 
L__mot_fechado2426:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado2227
;TCC_5.c,1193 :: 		close_bit2 = 0x00;                           //limpa o bit de fechamento
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,1195 :: 		}                                             //end if x_mot2==10
L_mot_fechado2227:
;TCC_5.c,1197 :: 		}                                                 //end mot_fechado2()
L_end_mot_fechado2:
	RETURN      0
; end of _mot_fechado2

_mot_fechado3:

;TCC_5.c,1203 :: 		void mot_fechado3()
;TCC_5.c,1205 :: 		if(x_mot3<10)                                   //se x_mot3 for menor que 10
	MOVLW       0
	SUBWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado3428
	MOVLW       10
	SUBWF       _x_mot3+0, 0 
L__mot_fechado3428:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado3228
;TCC_5.c,1207 :: 		SM3=0;                                        //  ||
	BCF         PORTA+0, 5 
;TCC_5.c,1208 :: 		delay_us(18500);                              //  ||
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado3229:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado3229
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado3229
	NOP
	NOP
;TCC_5.c,1209 :: 		SM3=1;                                        //  ||
	BSF         PORTA+0, 5 
;TCC_5.c,1210 :: 		delay_us(1500);                               //  \/
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado3230:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado3230
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado3230
	NOP
;TCC_5.c,1211 :: 		SM3=0;                                        //leva o motor 3 para a posição inicial
	BCF         PORTA+0, 5 
;TCC_5.c,1212 :: 		x_mot3++;                                     //incrementa x_mot3
	INFSNZ      _x_mot3+0, 1 
	INCF        _x_mot3+1, 1 
;TCC_5.c,1214 :: 		}                                               //end if x_mot2<10
L_mot_fechado3228:
;TCC_5.c,1216 :: 		if(x_mot3==10)                                  //se x_mot3 for 10
	MOVLW       0
	XORWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado3429
	MOVLW       10
	XORWF       _x_mot3+0, 0 
L__mot_fechado3429:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado3231
;TCC_5.c,1218 :: 		close_bit3 = 0x00;                           //limpa o bit de fechamento
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1220 :: 		}                                             //end if x_mot3==10
L_mot_fechado3231:
;TCC_5.c,1222 :: 		}                                                 //end mot_fechado3()
L_end_mot_fechado3:
	RETURN      0
; end of _mot_fechado3

_read_motbits:

;TCC_5.c,1229 :: 		void read_motbits()
;TCC_5.c,1231 :: 		if(!open_bit && !close_bit) atv_mot = 0x00;    //se os bits de abertura e fechamento do motor 1 forem 0,
	BTFSC       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits234
	BTFSC       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits234
L__read_motbits293:
	BCF         _atv_mot+0, BitPos(_atv_mot+0) 
L_read_motbits234:
;TCC_5.c,1234 :: 		if(open_bit && !close_bit)                     //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits237
	BTFSC       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits237
L__read_motbits292:
;TCC_5.c,1236 :: 		mot_aberto();                                 //executa a abertura do motor 1
	CALL        _mot_aberto+0, 0
;TCC_5.c,1238 :: 		}                                              //end if open_bit && !close_bit
L_read_motbits237:
;TCC_5.c,1240 :: 		if(!open_bit && close_bit)                     //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits240
	BTFSS       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits240
L__read_motbits291:
;TCC_5.c,1242 :: 		mot_fechado();                                //executa o fechamento do motor 1
	CALL        _mot_fechado+0, 0
;TCC_5.c,1244 :: 		}                                              //end if !open_bit && close_bit
L_read_motbits240:
;TCC_5.c,1247 :: 		if(!open_bit2 && !close_bit2) atv_mot2 = 0x00; //se os bits de abertura e fechamento do motor 2 forem 0,
	BTFSC       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits243
	BTFSC       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits243
L__read_motbits290:
	BCF         _atv_mot2+0, BitPos(_atv_mot2+0) 
L_read_motbits243:
;TCC_5.c,1250 :: 		if(open_bit2 && !close_bit2)                   //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits246
	BTFSC       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits246
L__read_motbits289:
;TCC_5.c,1252 :: 		mot_aberto2();                                //executa a abertura do motor 2
	CALL        _mot_aberto2+0, 0
;TCC_5.c,1254 :: 		}                                              //end if open_bit2 && !close_bit2
L_read_motbits246:
;TCC_5.c,1256 :: 		if(!open_bit2 && close_bit2)                   //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits249
	BTFSS       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits249
L__read_motbits288:
;TCC_5.c,1258 :: 		mot_fechado2();                               //executa o fechamento do motor 2
	CALL        _mot_fechado2+0, 0
;TCC_5.c,1260 :: 		}                                              //end if !open_bit2 && close_bit2
L_read_motbits249:
;TCC_5.c,1263 :: 		if(!open_bit3 && !close_bit3) atv_mot3 = 0x00; //se os bits de abertura e fechamento do motor 3 forem 0,
	BTFSC       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits252
	BTFSC       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits252
L__read_motbits287:
	BCF         _atv_mot3+0, BitPos(_atv_mot3+0) 
L_read_motbits252:
;TCC_5.c,1266 :: 		if(open_bit3 && !close_bit3)                   //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits255
	BTFSC       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits255
L__read_motbits286:
;TCC_5.c,1268 :: 		mot_aberto3();                                //executa a abertura do motor 3
	CALL        _mot_aberto3+0, 0
;TCC_5.c,1270 :: 		}                                              //end if open_bit3 && !close_bit3
L_read_motbits255:
;TCC_5.c,1272 :: 		if(!open_bit3 && close_bit3)                   //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits258
	BTFSS       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits258
L__read_motbits285:
;TCC_5.c,1274 :: 		mot_fechado3();                               //executa o fechamento do motor 3
	CALL        _mot_fechado3+0, 0
;TCC_5.c,1276 :: 		}                                              //end if !open_bit3 && close_bit3
L_read_motbits258:
;TCC_5.c,1278 :: 		}                                                 //end read_motbits()
L_end_read_motbits:
	RETURN      0
; end of _read_motbits
