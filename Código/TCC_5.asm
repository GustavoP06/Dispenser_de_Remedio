
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
L__interrupt302:
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
	GOTO        L__main304
	BCF         _un+0, BitPos(_un+0) 
	GOTO        L__main305
L__main304:
	BSF         _un+0, BitPos(_un+0) 
L__main305:
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
	GOTO        L__main306
	BCF         _un2+0, BitPos(_un2+0) 
	GOTO        L__main307
L__main306:
	BSF         _un2+0, BitPos(_un2+0) 
L__main307:
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
	GOTO        L__main308
	BCF         _un3+0, BitPos(_un3+0) 
	GOTO        L__main309
L__main308:
	BSF         _un3+0, BitPos(_un3+0) 
L__main309:
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
L__ler_bot271:
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
	GOTO        L__ler_bot311
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot311:
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
L__ler_bot270:
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
	GOTO        L__ler_bot312
	MOVLW       0
	XORWF       _option+0, 0 
L__ler_bot312:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot20
;TCC_5.c,315 :: 		if(prog==1)                                   //programação de numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot313
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot313:
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
	GOTO        L__ler_bot314
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot314:
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
	GOTO        L__ler_bot315
	MOVF        _num+0, 0 
	SUBLW       24
L__ler_bot315:
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
	GOTO        L__ler_bot316
	MOVLW       1
	XORWF       _option+0, 0 
L__ler_bot316:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot24
;TCC_5.c,330 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot317
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot317:
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
	GOTO        L__ler_bot318
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot318:
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
	GOTO        L__ler_bot319
	MOVF        _num2+0, 0 
	SUBLW       24
L__ler_bot319:
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
	GOTO        L__ler_bot320
	MOVLW       2
	XORWF       _option+0, 0 
L__ler_bot320:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot28
;TCC_5.c,345 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot321
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot321:
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
	GOTO        L__ler_bot322
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot322:
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
	GOTO        L__ler_bot323
	MOVF        _num3+0, 0 
	SUBLW       24
L__ler_bot323:
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
L__ler_bot269:
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
	GOTO        L__ler_bot324
	MOVLW       0
	XORWF       _option+0, 0 
L__ler_bot324:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot36
;TCC_5.c,369 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot325
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot325:
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
	GOTO        L__ler_bot326
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot326:
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
	GOTO        L__ler_bot327
	MOVF        _num+0, 0 
	SUBLW       24
L__ler_bot327:
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
	GOTO        L__ler_bot328
	MOVLW       1
	XORWF       _option+0, 0 
L__ler_bot328:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot40
;TCC_5.c,384 :: 		if(prog==1)                                   //programação do número
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot329
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot329:
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
	GOTO        L__ler_bot330
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot330:
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
	GOTO        L__ler_bot331
	MOVF        _num2+0, 0 
	SUBLW       24
L__ler_bot331:
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
	GOTO        L__ler_bot332
	MOVLW       2
	XORWF       _option+0, 0 
L__ler_bot332:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot44
;TCC_5.c,400 :: 		if(prog==1)                                   //programação do número
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot333
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot333:
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
	GOTO        L__ler_bot334
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot334:
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
	GOTO        L__ler_bot335
	MOVF        _num3+0, 0 
	SUBLW       24
L__ler_bot335:
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
L__ler_bot268:
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
	GOTO        L__ler_bot336
	MOVLW       0
	XORWF       _num+0, 0 
L__ler_bot336:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot267
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot337
	MOVLW       0
	XORWF       _num2+0, 0 
L__ler_bot337:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot267
	MOVF        _num3+0, 0 
	IORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot267
	GOTO        L_ler_bot54
L__ler_bot267:
;TCC_5.c,425 :: 		if(prog==0)                                   //se prog = 0
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot338
	MOVLW       0
	XORWF       _prog+0, 0 
L__ler_bot338:
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
L__ler_bot266:
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
	GOTO        L__ler_bot339
	MOVLW       0
	XORWF       _prog+0, 0 
L__ler_bot339:
	BTFSC       STATUS+0, 2 
	GOTO        L_ler_bot68
;TCC_5.c,479 :: 		option++;                                     //incrementa option
	INFSNZ      _option+0, 1 
	INCF        _option+1, 1 
;TCC_5.c,480 :: 		if(option == 3) option=0x00;                  //se option for 3, option = 0
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot340
	MOVLW       3
	XORWF       _option+0, 0 
L__ler_bot340:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot69
	CLRF        _option+0 
	CLRF        _option+1 
L_ler_bot69:
;TCC_5.c,481 :: 		}
L_ler_bot68:
;TCC_5.c,483 :: 		if(toque || toque2 || toque3)                 //se algum comando do SOM estiver ativado...
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L__ler_bot265
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L__ler_bot265
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L__ler_bot265
	GOTO        L_ler_bot72
L__ler_bot265:
;TCC_5.c,485 :: 		if(toque)temp_ligado=0x00;                    //se for o toque 1, zera o contador 1
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_ler_bot73
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
L_ler_bot73:
;TCC_5.c,486 :: 		if(toque2)temp_ligado2=0x00;                  //se for o toque 2, zera o contador 2
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_ler_bot74
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
L_ler_bot74:
;TCC_5.c,487 :: 		if(toque3)temp_ligado3=0x00;                  //se for o toque 3, zera o contador 3
	BTFSS       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_ler_bot75
	CLRF        _temp_ligado3+0 
	CLRF        _temp_ligado3+1 
L_ler_bot75:
;TCC_5.c,488 :: 		toque =0x00;
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,489 :: 		toque2=0x00;
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,490 :: 		toque3=0x00;                                 //zera todos os bits de SOM
	BCF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,491 :: 		SOM=0x00;
	BCF         PORTA+0, 2 
;TCC_5.c,493 :: 		}                                             //end if toque || toque2 || toque3
L_ler_bot72:
;TCC_5.c,495 :: 		}                                               //end if BOTAO5 && b5_flag
L_ler_bot67:
;TCC_5.c,497 :: 		}                                                 //end ler_bot()
L_end_ler_bot:
	RETURN      0
; end of _ler_bot

_fast_incr:

;TCC_5.c,503 :: 		void fast_incr()
;TCC_5.c,505 :: 		if(temp_inc>7)temp_inc=0x00;                     //se temp_inc maior que 7, zera temp_inc
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_inc+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr342
	MOVF        _temp_inc+0, 0 
	SUBLW       7
L__fast_incr342:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr76
	CLRF        _temp_inc+0 
	CLRF        _temp_inc+1 
L_fast_incr76:
;TCC_5.c,506 :: 		if(temp_inc==7)                                  //conta 700ms...
	MOVLW       0
	XORWF       _temp_inc+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr343
	MOVLW       7
	XORWF       _temp_inc+0, 0 
L__fast_incr343:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr77
;TCC_5.c,508 :: 		temp_inc=0x00;                                  //zera temp_inc
	CLRF        _temp_inc+0 
	CLRF        _temp_inc+1 
;TCC_5.c,509 :: 		fast_inc=0x01;                                  //ativa fast_inc
	BSF         _fast_inc+0, BitPos(_fast_inc+0) 
;TCC_5.c,510 :: 		}                                                //end if temp_inc==7
L_fast_incr77:
;TCC_5.c,512 :: 		if(fast_inc)                                     //se fast_inc for ativado...
	BTFSS       _fast_inc+0, BitPos(_fast_inc+0) 
	GOTO        L_fast_incr78
;TCC_5.c,514 :: 		if(option==0 && prog==1)                        //se dispenser n°1 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr344
	MOVLW       0
	XORWF       _option+0, 0 
L__fast_incr344:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr81
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr345
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr345:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr81
L__fast_incr274:
;TCC_5.c,516 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr346
	MOVF        _temp_num+0, 0 
	SUBLW       5
L__fast_incr346:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr82
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr82:
;TCC_5.c,517 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr347
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr347:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr83
;TCC_5.c,519 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,520 :: 		num += 2;                                     //acrescenta 2 em num
	MOVLW       2
	ADDWF       _num+0, 1 
	MOVLW       0
	ADDWFC      _num+1, 1 
;TCC_5.c,522 :: 		}                                              //end if temp_num==5
L_fast_incr83:
;TCC_5.c,524 :: 		}                                               //end if option==0 && prog=1
L_fast_incr81:
;TCC_5.c,527 :: 		if(option==1 && prog==1)                        //se dispenser n°2 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr348
	MOVLW       1
	XORWF       _option+0, 0 
L__fast_incr348:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr86
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr349
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr349:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr86
L__fast_incr273:
;TCC_5.c,529 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
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
	GOTO        L_fast_incr87
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr87:
;TCC_5.c,530 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr351
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr351:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr88
;TCC_5.c,532 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,533 :: 		num2 += 2;                                    //acrescenta 2 em num2
	MOVLW       2
	ADDWF       _num2+0, 1 
	MOVLW       0
	ADDWFC      _num2+1, 1 
;TCC_5.c,535 :: 		}                                              //end if temp_num==5
L_fast_incr88:
;TCC_5.c,537 :: 		}                                               //end if option==1 && prog=1
L_fast_incr86:
;TCC_5.c,539 :: 		if(num >24) num =0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr352
	MOVF        _num+0, 0 
	SUBLW       24
L__fast_incr352:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr89
	CLRF        _num+0 
	CLRF        _num+1 
L_fast_incr89:
;TCC_5.c,540 :: 		if(num2>24) num2=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr353
	MOVF        _num2+0, 0 
	SUBLW       24
L__fast_incr353:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr90
	CLRF        _num2+0 
	CLRF        _num2+1 
L_fast_incr90:
;TCC_5.c,541 :: 		if(num3>24) num3=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num3+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr354
	MOVF        _num3+0, 0 
	SUBLW       24
L__fast_incr354:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr91
	CLRF        _num3+0 
	CLRF        _num3+1 
L_fast_incr91:
;TCC_5.c,543 :: 		}                                                //end if fast_inc
L_fast_incr78:
;TCC_5.c,546 :: 		if(option==2 && prog==1)                         //se dispenser n°3 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr355
	MOVLW       2
	XORWF       _option+0, 0 
L__fast_incr355:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr94
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr356
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr356:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr94
L__fast_incr272:
;TCC_5.c,548 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr357
	MOVF        _temp_num+0, 0 
	SUBLW       5
L__fast_incr357:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr95
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr95:
;TCC_5.c,549 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr358
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr358:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr96
;TCC_5.c,551 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,552 :: 		num3 += 2;                                    //acrescenta 2 em num3
	MOVLW       2
	ADDWF       _num3+0, 1 
	MOVLW       0
	ADDWFC      _num3+1, 1 
;TCC_5.c,554 :: 		}                                              //end if temp_num==5
L_fast_incr96:
;TCC_5.c,556 :: 		}                                               //end if option==2 && prog=1
L_fast_incr94:
;TCC_5.c,558 :: 		}                                                 //end void fast_incr()
L_end_fast_incr:
	RETURN      0
; end of _fast_incr

_disp:

;TCC_5.c,564 :: 		void disp()
;TCC_5.c,566 :: 		if(!ligar && prog==0)                           //se ligar for 0 e prog for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_disp99
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp360
	MOVLW       0
	XORWF       _prog+0, 0 
L__disp360:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp99
L__disp278:
;TCC_5.c,568 :: 		if(!display && !display2)                      //se os bits diplay e display2 forem 0
	BTFSC       _display+0, BitPos(_display+0) 
	GOTO        L_disp102
	BTFSC       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp102
L__disp277:
;TCC_5.c,570 :: 		LCD_Out(1,1,"  DISPENSER DE  ");             //exibe "DISPENSER DE"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,571 :: 		LCD_Out(2,1,"    REMEDIOS    ");             //      "  REMEDIOS  "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,572 :: 		}
	GOTO        L_disp103
L_disp102:
;TCC_5.c,575 :: 		if(display && !display2)                      //se bits display for 1 e display2 for 0
	BTFSS       _display+0, BitPos(_display+0) 
	GOTO        L_disp106
	BTFSC       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp106
L__disp276:
;TCC_5.c,577 :: 		display=0x00;                                //limpa bit display
	BCF         _display+0, BitPos(_display+0) 
;TCC_5.c,578 :: 		LCD_Out(1,1,"ETEC LAURO GOMES");             //exibe "ETEC LAURO GOMES"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,579 :: 		LCD_Out(2,1,"  3A MECA 2021  ");             //      "  3A MECA 2021  "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,580 :: 		delay_ms(1000);                              //espera 1 segundo
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_disp107:
	DECFSZ      R13, 1, 1
	BRA         L_disp107
	DECFSZ      R12, 1, 1
	BRA         L_disp107
	DECFSZ      R11, 1, 1
	BRA         L_disp107
	NOP
	NOP
;TCC_5.c,581 :: 		}
L_disp106:
;TCC_5.c,582 :: 		if(!display && display2)                      //se os bits display for 0 e display2 for 1
	BTFSC       _display+0, BitPos(_display+0) 
	GOTO        L_disp110
	BTFSS       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp110
L__disp275:
;TCC_5.c,584 :: 		display2=0x00;                               //limpa bit display2
	BCF         _display2+0, BitPos(_display2+0) 
;TCC_5.c,585 :: 		LCD_Out(1,1,"     PARANDO    ");             //exibe "     PARANDO    "
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,586 :: 		LCD_Out(2,1,"     CONTAGEM   ");             //      "     CONTAGEM   "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,587 :: 		delay_ms(1000);                              //espera 1 segundo
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_disp111:
	DECFSZ      R13, 1, 1
	BRA         L_disp111
	DECFSZ      R12, 1, 1
	BRA         L_disp111
	DECFSZ      R11, 1, 1
	BRA         L_disp111
	NOP
	NOP
;TCC_5.c,588 :: 		}
L_disp110:
;TCC_5.c,589 :: 		}                                              //end else
L_disp103:
;TCC_5.c,590 :: 		}                                               //end if !ligar && prog==0
L_disp99:
;TCC_5.c,592 :: 		if(prog==1)                                     //programação de numeros
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp361
	MOVLW       1
	XORWF       _prog+0, 0 
L__disp361:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp112
;TCC_5.c,594 :: 		LCD_Out(1,1,"PROGRAME NUMERO:");               //exibe "PROGRAME NUMERO:
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,595 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,596 :: 		if(option==0) LCD_Chr(2,14,'1');               //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp362
	MOVLW       0
	XORWF       _option+0, 0 
L__disp362:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp113
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp113:
;TCC_5.c,597 :: 		if(option==1) LCD_Chr(2,14,'2');               //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp363
	MOVLW       1
	XORWF       _option+0, 0 
L__disp363:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp114
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp114:
;TCC_5.c,598 :: 		if(option==2) LCD_Chr(2,14,'3');              //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp364
	MOVLW       2
	XORWF       _option+0, 0 
L__disp364:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp115
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp115:
;TCC_5.c,599 :: 		}
L_disp112:
;TCC_5.c,601 :: 		if(prog==2)                                     //se prog for 2
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp365
	MOVLW       2
	XORWF       _prog+0, 0 
L__disp365:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp116
;TCC_5.c,603 :: 		LCD_Out(1,1,"PROGRAME Un.:");                  //exibe "PROGRAME Un.:"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,604 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,605 :: 		if(option==0) LCD_Chr(2,14,'1');               //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp366
	MOVLW       0
	XORWF       _option+0, 0 
L__disp366:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp117
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp117:
;TCC_5.c,606 :: 		if(option==1) LCD_Chr(2,14,'2');               //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp367
	MOVLW       1
	XORWF       _option+0, 0 
L__disp367:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp118
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp118:
;TCC_5.c,607 :: 		if(option==2) LCD_Chr(2,14,'3');              //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp368
	MOVLW       2
	XORWF       _option+0, 0 
L__disp368:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp119
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp119:
;TCC_5.c,608 :: 		}
L_disp116:
;TCC_5.c,610 :: 		if(ligar)                                       //se ligar for 1 (ligado)
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_disp120
;TCC_5.c,612 :: 		LCD_Out(1,1,"CONTANDO:   DISP");               //exibe "CONTANDO:   DISP";
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,613 :: 		if(temp_disp>20) temp_disp=0x00;               //se temp_disp for maior que 20, zera temp_disp
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_disp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp369
	MOVF        _temp_disp+0, 0 
	SUBLW       20
L__disp369:
	BTFSC       STATUS+0, 0 
	GOTO        L_disp121
	CLRF        _temp_disp+0 
	CLRF        _temp_disp+1 
L_disp121:
;TCC_5.c,614 :: 		if(temp_disp == 20)                            //se temp_disp for 20 (2 segundos)
	MOVLW       0
	XORWF       _temp_disp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp370
	MOVLW       20
	XORWF       _temp_disp+0, 0 
L__disp370:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp122
;TCC_5.c,616 :: 		temp_disp=0x00;                               //zera temp_disp
	CLRF        _temp_disp+0 
	CLRF        _temp_disp+1 
;TCC_5.c,617 :: 		option++;                                     //incrementa option
	INFSNZ      _option+0, 1 
	INCF        _option+1, 1 
;TCC_5.c,618 :: 		if(option == 3) option=0x00;                  //se option for 3, option = 0
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp371
	MOVLW       3
	XORWF       _option+0, 0 
L__disp371:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp123
	CLRF        _option+0 
	CLRF        _option+1 
L_disp123:
;TCC_5.c,619 :: 		if(option==0) LCD_Chr(2,14,'1');              //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp372
	MOVLW       0
	XORWF       _option+0, 0 
L__disp372:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp124
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp124:
;TCC_5.c,620 :: 		if(option==1) LCD_Chr(2,14,'2');              //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp373
	MOVLW       1
	XORWF       _option+0, 0 
L__disp373:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp125
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp125:
;TCC_5.c,621 :: 		if(option==2) LCD_Chr(2,14,'3');              //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp374
	MOVLW       2
	XORWF       _option+0, 0 
L__disp374:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp126
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp126:
;TCC_5.c,622 :: 		}
L_disp122:
;TCC_5.c,623 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,624 :: 		}
L_disp120:
;TCC_5.c,626 :: 		}                                                 //end disp()
L_end_disp:
	RETURN      0
; end of _disp

_num_un:

;TCC_5.c,632 :: 		void num_un()
;TCC_5.c,635 :: 		if(option==0)                                    //se option for 0 (dispenser n° 1 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un376
	MOVLW       0
	XORWF       _option+0, 0 
L__num_un376:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un127
;TCC_5.c,637 :: 		dig2 = num/10;                                  //dígito 2 é igual a num dividido por 10
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
;TCC_5.c,638 :: 		dig1 = num%10;                                  //digito 1 é igual a sobra da divisão de num por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,640 :: 		LCD_Chr(2,2,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,641 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,643 :: 		if(!un) LCD_Out(2,5,hora);                      //se un for zero, exibe "hora"
	BTFSC       _un+0, BitPos(_un+0) 
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
;TCC_5.c,645 :: 		if(un) LCD_Out(2,5,dia);                        //se un for um, exibe "dia"
	BTFSS       _un+0, BitPos(_un+0) 
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
;TCC_5.c,647 :: 		}                                                //end if option==0
L_num_un127:
;TCC_5.c,650 :: 		if(option==1)                                    //se option for 1 (dispenser n°2 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un377
	MOVLW       1
	XORWF       _option+0, 0 
L__num_un377:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un130
;TCC_5.c,652 :: 		dig2 = num2/10;                                 //digito 2 é igual a num2 dividido por 10
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
;TCC_5.c,653 :: 		dig1 = num2%10;                                 //digito 1 é igual a sobra da divisão de num2 por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,655 :: 		LCD_Chr(2,2,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,656 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,658 :: 		if(!un2) LCD_Out(2,5,hora);                     //se un2 for zero, exibe "hora"
	BTFSC       _un2+0, BitPos(_un2+0) 
	GOTO        L_num_un131
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un131:
;TCC_5.c,660 :: 		if(un2) LCD_Out(2,5,dia);                       //se un2 for um, exibe "dia"
	BTFSS       _un2+0, BitPos(_un2+0) 
	GOTO        L_num_un132
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un132:
;TCC_5.c,662 :: 		}                                                //end if option==1
L_num_un130:
;TCC_5.c,664 :: 		if(option==2)                                    //se option for 1 (dispenser n°2 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un378
	MOVLW       2
	XORWF       _option+0, 0 
L__num_un378:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un133
;TCC_5.c,666 :: 		dig2 = num3/10;                                 //digito 2 é igual a num3 dividido por 10
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
;TCC_5.c,667 :: 		dig1 = num3%10;                                 //digito 1 é igual a sobra da divisão de num3 por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,669 :: 		LCD_Chr(2,2,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,670 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,672 :: 		if(!un3) LCD_Out(2,5,hora);                     //se un3 for zero, exibe "hora"
	BTFSC       _un3+0, BitPos(_un3+0) 
	GOTO        L_num_un134
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un134:
;TCC_5.c,674 :: 		if(un3) LCD_Out(2,5,dia);                       //se un3 for um, exibe "dia"
	BTFSS       _un3+0, BitPos(_un3+0) 
	GOTO        L_num_un135
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un135:
;TCC_5.c,676 :: 		}                                                //end if option==2
L_num_un133:
;TCC_5.c,678 :: 		}                                                 //end num_un()
L_end_num_un:
	RETURN      0
; end of _num_un

_piscaLED:

;TCC_5.c,684 :: 		void piscaLED()
;TCC_5.c,687 :: 		if(ligar && !toque && num!=0)                   //se ligar for um(ligado), toque for zero e num diferente de zero...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED138
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L_piscaLED138
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED380
	MOVLW       0
	XORWF       _num+0, 0 
L__piscaLED380:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED138
L__piscaLED287:
;TCC_5.c,689 :: 		if(temp_led>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED381
	MOVLW       10
	SUBWF       _temp_led+0, 0 
L__piscaLED381:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED139
;TCC_5.c,691 :: 		temp_led = 0x00;                      //zera temp_led
	CLRF        _temp_led+0 
	CLRF        _temp_led+1 
;TCC_5.c,692 :: 		LED  = ~LED;                          //inverte LED de indicação do dispenser n°1
	BTG         PORTA+0, 0 
;TCC_5.c,693 :: 		}                                              //end if temp_led>=10
L_piscaLED139:
;TCC_5.c,695 :: 		}                                               //end if ligar && !toque && num!=0
	GOTO        L_piscaLED140
L_piscaLED138:
;TCC_5.c,699 :: 		if(ligar && toque)                             //se ligar for 1 e toque for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED143
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_piscaLED143
L__piscaLED286:
;TCC_5.c,701 :: 		if(temp_led>=2)                               //conta 200ms
	MOVLW       0
	SUBWF       _temp_led+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED382
	MOVLW       2
	SUBWF       _temp_led+0, 0 
L__piscaLED382:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED144
;TCC_5.c,703 :: 		temp_led=0x00;                               //zera temp_led
	CLRF        _temp_led+0 
	CLRF        _temp_led+1 
;TCC_5.c,704 :: 		LED = ~LED;                                  //inverte LED de indicação do dispenser n°1
	BTG         PORTA+0, 0 
;TCC_5.c,706 :: 		}                                             //end if temp_led>=2
L_piscaLED144:
;TCC_5.c,708 :: 		}                                              //end if ligar && toque
	GOTO        L_piscaLED145
L_piscaLED143:
;TCC_5.c,711 :: 		if(prog>0 && option==0)                       //se estiver em programação e dispenser n°1 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED383
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED383:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED148
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED384
	MOVLW       0
	XORWF       _option+0, 0 
L__piscaLED384:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED148
L__piscaLED285:
;TCC_5.c,713 :: 		LED = 0x01;                                  //LED do dispenser n°1 aceso
	BSF         PORTA+0, 0 
;TCC_5.c,714 :: 		}                                             //end if prog>0 && option==0
	GOTO        L_piscaLED149
L_piscaLED148:
;TCC_5.c,716 :: 		else LED = 0x00;                              //senão, LED do dispenser n°1 desligado
	BCF         PORTA+0, 0 
L_piscaLED149:
;TCC_5.c,718 :: 		}                                              //end else
L_piscaLED145:
;TCC_5.c,720 :: 		}                                               //end else
L_piscaLED140:
;TCC_5.c,724 :: 		if(temp_led2 ==5)                                //conta 500ms
	MOVLW       0
	XORWF       _temp_led2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED385
	MOVLW       5
	XORWF       _temp_led2+0, 0 
L__piscaLED385:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED150
;TCC_5.c,726 :: 		temp_led2=0x00;                                 //zera temp_led2
	CLRF        _temp_led2+0 
	CLRF        _temp_led2+1 
;TCC_5.c,727 :: 		LED2 = ~LED2;                                   //inverte estado do LED de indicação geral
	BTG         PORTA+0, 3 
;TCC_5.c,729 :: 		}                                                //end if temp_led==5
L_piscaLED150:
;TCC_5.c,731 :: 		if(ligar && !toque2 && num2!=0)                  //se ligar for 1, toque 2 for 0 e num2 diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED153
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_piscaLED153
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED386
	MOVLW       0
	XORWF       _num2+0, 0 
L__piscaLED386:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED153
L__piscaLED284:
;TCC_5.c,733 :: 		if(temp_led3>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED387
	MOVLW       10
	SUBWF       _temp_led3+0, 0 
L__piscaLED387:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED154
;TCC_5.c,735 :: 		temp_led3 = 0x00;                              //zera temp_led3
	CLRF        _temp_led3+0 
	CLRF        _temp_led3+1 
;TCC_5.c,736 :: 		LED3 = ~LED3;                                  //inverte estado do LED de indicação do dispenser n°2
	BTG         PORTB+0, 0 
;TCC_5.c,738 :: 		}                                               //end if temp_led3>=10
L_piscaLED154:
;TCC_5.c,740 :: 		}                                                //end if ligar && !toque2 && num2!=0
	GOTO        L_piscaLED155
L_piscaLED153:
;TCC_5.c,744 :: 		if(ligar && toque2)                             //se ligar e toque2 for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED158
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_piscaLED158
L__piscaLED283:
;TCC_5.c,746 :: 		if(temp_led3>=2)                               //conta 200 milisegundos
	MOVLW       0
	SUBWF       _temp_led3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED388
	MOVLW       2
	SUBWF       _temp_led3+0, 0 
L__piscaLED388:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED159
;TCC_5.c,748 :: 		temp_led3=0x00;                               //zera temp_led3
	CLRF        _temp_led3+0 
	CLRF        _temp_led3+1 
;TCC_5.c,749 :: 		LED3 = ~LED3;                                 //inverte estado do LED de indicação do dispenser n°2
	BTG         PORTB+0, 0 
;TCC_5.c,751 :: 		}                                              //end if temp_led3>=2
L_piscaLED159:
;TCC_5.c,753 :: 		}                                               //end if ligar && toque2
	GOTO        L_piscaLED160
L_piscaLED158:
;TCC_5.c,757 :: 		if(prog>0 && option==1)                        //se estiver em programação e dispenser n°2 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED389
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED389:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED163
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED390
	MOVLW       1
	XORWF       _option+0, 0 
L__piscaLED390:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED163
L__piscaLED282:
;TCC_5.c,759 :: 		LED3 = 0x01;                                  //LED do dispenser n°2 aceso
	BSF         PORTB+0, 0 
;TCC_5.c,760 :: 		}                                              //end if prog>0 && option==1
	GOTO        L_piscaLED164
L_piscaLED163:
;TCC_5.c,762 :: 		else LED3 = 0x00;                               //senão, LED do dispenser n°2 desligado
	BCF         PORTB+0, 0 
L_piscaLED164:
;TCC_5.c,764 :: 		}                                               //end else
L_piscaLED160:
;TCC_5.c,766 :: 		}                                                //end else
L_piscaLED155:
;TCC_5.c,768 :: 		if(ligar && !toque3 && num3!=0)                  //se ligar for 1, toque3 for 0 e num3 diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED167
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_piscaLED167
	MOVLW       0
	XORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED391
	MOVLW       0
	XORWF       _num3+0, 0 
L__piscaLED391:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED167
L__piscaLED281:
;TCC_5.c,770 :: 		if(temp_led4>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED392
	MOVLW       10
	SUBWF       _temp_led4+0, 0 
L__piscaLED392:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED168
;TCC_5.c,772 :: 		temp_led4 = 0x00;                              //zera temp_led4
	CLRF        _temp_led4+0 
	CLRF        _temp_led4+1 
;TCC_5.c,773 :: 		LED4 = ~LED4;                                  //inverte estado do LED de indicação do dispenser n°3
	BTG         PORTB+0, 1 
;TCC_5.c,775 :: 		}                                               //end if temp_led4>=10
L_piscaLED168:
;TCC_5.c,777 :: 		}                                                //end if ligar && !toque3 && num3!=0
	GOTO        L_piscaLED169
L_piscaLED167:
;TCC_5.c,781 :: 		if(ligar && toque3)                             //se ligar e toque3 for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED172
	BTFSS       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_piscaLED172
L__piscaLED280:
;TCC_5.c,783 :: 		if(temp_led4>=2)                               //conta 200 milisegundos
	MOVLW       0
	SUBWF       _temp_led4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED393
	MOVLW       2
	SUBWF       _temp_led4+0, 0 
L__piscaLED393:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED173
;TCC_5.c,785 :: 		temp_led4=0x00;                               //zera temp_led4
	CLRF        _temp_led4+0 
	CLRF        _temp_led4+1 
;TCC_5.c,786 :: 		LED4 = ~LED4;                                 //inverte estado do LED de indicação do dispenser n°3
	BTG         PORTB+0, 1 
;TCC_5.c,788 :: 		}                                              //end if temp_led4>=2
L_piscaLED173:
;TCC_5.c,790 :: 		}                                               //end if ligar && toque3
	GOTO        L_piscaLED174
L_piscaLED172:
;TCC_5.c,794 :: 		if(prog>0 && option==2)                        //se estiver em programação e dispenser n°3 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED394
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED394:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED177
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED395
	MOVLW       2
	XORWF       _option+0, 0 
L__piscaLED395:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED177
L__piscaLED279:
;TCC_5.c,796 :: 		LED4 = 0x01;                                  //LED do dispenser n°3 aceso
	BSF         PORTB+0, 1 
;TCC_5.c,797 :: 		}                                              //end if prog>0 && option==2
	GOTO        L_piscaLED178
L_piscaLED177:
;TCC_5.c,799 :: 		else LED4 = 0x00;                               //senão, LED do dispenser n°3 desligado
	BCF         PORTB+0, 1 
L_piscaLED178:
;TCC_5.c,801 :: 		}                                               //end else
L_piscaLED174:
;TCC_5.c,803 :: 		}                                                //end else
L_piscaLED169:
;TCC_5.c,805 :: 		}                                                 //end piscaLED()
L_end_piscaLED:
	RETURN      0
; end of _piscaLED

_timebase:

;TCC_5.c,812 :: 		void timebase()
;TCC_5.c,814 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase179
;TCC_5.c,816 :: 		temp_ligado = 0x00;                            //zera temp_ligado
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
;TCC_5.c,817 :: 		}
L_timebase179:
;TCC_5.c,818 :: 		if(ligar && num!=0)                             //se ligar for 1 e num diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase182
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase397
	MOVLW       0
	XORWF       _num+0, 0 
L__timebase397:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase182
L__timebase288:
;TCC_5.c,820 :: 		if(temp==10)                                   //conta 1 segundo
	MOVLW       0
	XORWF       _temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase398
	MOVLW       10
	XORWF       _temp+0, 0 
L__timebase398:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase183
;TCC_5.c,822 :: 		temp = 0x00;                                  //zera temp
	CLRF        _temp+0 
	CLRF        _temp+1 
;TCC_5.c,823 :: 		temp_ligado++;                                //incrementa temp_ligado a cada 1 segundo
	INFSNZ      _temp_ligado+0, 1 
	INCF        _temp_ligado+1, 1 
;TCC_5.c,825 :: 		}                                              //end if temp==10
L_timebase183:
;TCC_5.c,827 :: 		if(temp_ligado==mult)                          //compara a igualdade de temp_ligado com mult
	MOVF        _temp_ligado+1, 0 
	XORWF       _mult+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase399
	MOVF        _mult+0, 0 
	XORWF       _temp_ligado+0, 0 
L__timebase399:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase184
;TCC_5.c,829 :: 		toque = 0x01;                                 //liga o bit toque
	BSF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,830 :: 		atv_mot = 0x01;                               //liga o bit de ativação do motor
	BSF         _atv_mot+0, BitPos(_atv_mot+0) 
;TCC_5.c,831 :: 		abre_mot();                                   //define os bits de controle do motor para abri-lo
	CALL        _abre_mot+0, 0
;TCC_5.c,833 :: 		}                                              //end if temp_ligado==mult
L_timebase184:
;TCC_5.c,835 :: 		if(atv_mot)                                    //se ativação do motor for ligada...
	BTFSS       _atv_mot+0, BitPos(_atv_mot+0) 
	GOTO        L_timebase185
;TCC_5.c,837 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,839 :: 		}                                              //end if atv_mot
	GOTO        L_timebase186
L_timebase185:
;TCC_5.c,843 :: 		alarme();                                     //executa o alarme
	CALL        _alarme+0, 0
;TCC_5.c,844 :: 		}
L_timebase186:
;TCC_5.c,845 :: 		}                                               //end if ligar
L_timebase182:
;TCC_5.c,847 :: 		}                                                 //end timebase()
L_end_timebase:
	RETURN      0
; end of _timebase

_timebase2:

;TCC_5.c,854 :: 		void timebase2()
;TCC_5.c,856 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase2187
;TCC_5.c,858 :: 		temp_ligado2 = 0x00;                           //zera temp_ligado2
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
;TCC_5.c,859 :: 		}
L_timebase2187:
;TCC_5.c,861 :: 		if(ligar && num2!=0)                            //se ligar for 1 e num2 diferente de 0
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase2190
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2401
	MOVLW       0
	XORWF       _num2+0, 0 
L__timebase2401:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase2190
L__timebase2289:
;TCC_5.c,863 :: 		if(temp2==10)                                  //conta 1 segundo
	MOVLW       0
	XORWF       _temp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2402
	MOVLW       10
	XORWF       _temp2+0, 0 
L__timebase2402:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase2191
;TCC_5.c,865 :: 		temp2 = 0x00;                                 //zera temp2
	CLRF        _temp2+0 
	CLRF        _temp2+1 
;TCC_5.c,866 :: 		temp_ligado2++;                               //incrementa temp_ligado2 a cada 1 segundo
	INFSNZ      _temp_ligado2+0, 1 
	INCF        _temp_ligado2+1, 1 
;TCC_5.c,868 :: 		}                                              //end if temp2==10
L_timebase2191:
;TCC_5.c,870 :: 		if(temp_ligado2==mult2)                        //compara igualdade entre temp_ligado2 e mult2
	MOVF        _temp_ligado2+1, 0 
	XORWF       _mult2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2403
	MOVF        _mult2+0, 0 
	XORWF       _temp_ligado2+0, 0 
L__timebase2403:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase2192
;TCC_5.c,872 :: 		toque2 = 0x01;                                //liga o bit toque2
	BSF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,873 :: 		atv_mot2 = 0x01;                              //liga o bit de aativação do motor 2
	BSF         _atv_mot2+0, BitPos(_atv_mot2+0) 
;TCC_5.c,874 :: 		abre_mot2();                                  //define os bits de controle do motor 2 para abrir
	CALL        _abre_mot2+0, 0
;TCC_5.c,876 :: 		}                                              //end if temp_ligado2==mult2
L_timebase2192:
;TCC_5.c,878 :: 		if(atv_mot2)                                   //se ativação do motor 2 ligada...
	BTFSS       _atv_mot2+0, BitPos(_atv_mot2+0) 
	GOTO        L_timebase2193
;TCC_5.c,880 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,882 :: 		}                                              //end if atv_mot2
	GOTO        L_timebase2194
L_timebase2193:
;TCC_5.c,886 :: 		alarme();                                     //aciona o alarme
	CALL        _alarme+0, 0
;TCC_5.c,888 :: 		}                                              //end else
L_timebase2194:
;TCC_5.c,890 :: 		}                                               //end if ligar && num2!=0
L_timebase2190:
;TCC_5.c,892 :: 		}                                                 //end timebase2()
L_end_timebase2:
	RETURN      0
; end of _timebase2

_timebase3:

;TCC_5.c,899 :: 		void timebase3()
;TCC_5.c,901 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase3195
;TCC_5.c,903 :: 		temp_ligado3 = 0x00;                           //zera temp_ligado3
	CLRF        _temp_ligado3+0 
	CLRF        _temp_ligado3+1 
;TCC_5.c,904 :: 		}
L_timebase3195:
;TCC_5.c,906 :: 		if(ligar && num3!=0)                            //se ligar for 1 e num3 diferente de 0
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase3198
	MOVLW       0
	XORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3405
	MOVLW       0
	XORWF       _num3+0, 0 
L__timebase3405:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase3198
L__timebase3290:
;TCC_5.c,908 :: 		if(temp3==10)                                  //conta 1 segundo
	MOVLW       0
	XORWF       _temp3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3406
	MOVLW       10
	XORWF       _temp3+0, 0 
L__timebase3406:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase3199
;TCC_5.c,910 :: 		temp3 = 0x00;                                 //zera temp3
	CLRF        _temp3+0 
	CLRF        _temp3+1 
;TCC_5.c,911 :: 		temp_ligado3++;                               //incrementa temp_ligado3 a cada 1 segundo
	INFSNZ      _temp_ligado3+0, 1 
	INCF        _temp_ligado3+1, 1 
;TCC_5.c,913 :: 		}                                              //end if temp3==10
L_timebase3199:
;TCC_5.c,915 :: 		if(temp_ligado3==mult3)                        //compara igualdade entre temp_ligado3 e mult3
	MOVF        _temp_ligado3+1, 0 
	XORWF       _mult3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3407
	MOVF        _mult3+0, 0 
	XORWF       _temp_ligado3+0, 0 
L__timebase3407:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase3200
;TCC_5.c,917 :: 		toque3 = 0x01;                                //liga o bit toque3
	BSF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,918 :: 		atv_mot3 = 0x01;                              //liga o bit de aativação do motor 3
	BSF         _atv_mot3+0, BitPos(_atv_mot3+0) 
;TCC_5.c,919 :: 		abre_mot3();                                  //define os bits de controle do motor 3 para abrir
	CALL        _abre_mot3+0, 0
;TCC_5.c,921 :: 		}                                              //end if temp_ligado3==mult3
L_timebase3200:
;TCC_5.c,923 :: 		if(atv_mot3)                                   //se ativação do motor 3 ligada...
	BTFSS       _atv_mot3+0, BitPos(_atv_mot3+0) 
	GOTO        L_timebase3201
;TCC_5.c,925 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,927 :: 		}                                              //end if atv_mot3
	GOTO        L_timebase3202
L_timebase3201:
;TCC_5.c,931 :: 		alarme();                                     //aciona o alarme
	CALL        _alarme+0, 0
;TCC_5.c,933 :: 		}                                              //end else
L_timebase3202:
;TCC_5.c,935 :: 		}                                               //end if ligar && num3!=0
L_timebase3198:
;TCC_5.c,937 :: 		}                                                 //end timebase3()
L_end_timebase3:
	RETURN      0
; end of _timebase3

_alarme:

;TCC_5.c,943 :: 		void alarme()
;TCC_5.c,945 :: 		if(toque || toque2 || toque3)                    //se toque, toque2 ou toque3 for 1
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L__alarme291
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L__alarme291
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L__alarme291
	GOTO        L_alarme205
L__alarme291:
;TCC_5.c,947 :: 		if(vezes <200)                                 //se vezes for menor que 200 (toca por 1 minuto)
	MOVLW       0
	SUBWF       _vezes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__alarme409
	MOVLW       200
	SUBWF       _vezes+0, 0 
L__alarme409:
	BTFSC       STATUS+0, 0 
	GOTO        L_alarme206
;TCC_5.c,949 :: 		toca_som();                                   //executa a toca do SOM
	CALL        _toca_som+0, 0
;TCC_5.c,950 :: 		}                                              //end if vezes<10
	GOTO        L_alarme207
L_alarme206:
;TCC_5.c,954 :: 		if(toque)                                     //se toque for 1
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_alarme208
;TCC_5.c,956 :: 		toque=0x00;                                  //limpa o bit toque
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,957 :: 		temp_ligado=0x00;                            //zera temp_ligado para recomeçar a contagem
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
;TCC_5.c,959 :: 		}                                             //end if toque
L_alarme208:
;TCC_5.c,961 :: 		if(toque2)                                    //se toque2 for 1
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_alarme209
;TCC_5.c,963 :: 		toque2=0x00;                                 //limpa o bit toque 2
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,964 :: 		temp_ligado2=0x00;                           //zera temp_ligado2 para recomeçar a contagem
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
;TCC_5.c,966 :: 		}                                             //end if toque2
L_alarme209:
;TCC_5.c,968 :: 		if(toque3)                                    //se toque2 for 1
	BTFSS       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_alarme210
;TCC_5.c,970 :: 		toque3=0x00;                                 //limpa o bit toque3
	BCF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,971 :: 		temp_ligado3=0x00;                           //zera temp_ligado3 para recomeçar a contagem
	CLRF        _temp_ligado3+0 
	CLRF        _temp_ligado3+1 
;TCC_5.c,973 :: 		}                                             //end if toque3
L_alarme210:
;TCC_5.c,975 :: 		vezes=0x00;                                  //zera vezes
	CLRF        _vezes+0 
	CLRF        _vezes+1 
;TCC_5.c,976 :: 		SOM = 0x00;                                  //desliga o som
	BCF         PORTA+0, 2 
;TCC_5.c,978 :: 		}                                              //end else
L_alarme207:
;TCC_5.c,980 :: 		}                                                //end if toque || toque2 || toque3
L_alarme205:
;TCC_5.c,982 :: 		}                                                 //end alarme()
L_end_alarme:
	RETURN      0
; end of _alarme

_toca_som:

;TCC_5.c,988 :: 		void toca_som()
;TCC_5.c,990 :: 		if(temp_som>3) temp_som=0x00;                    //se temp_som for maior que 3, zera temp_som
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_som+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__toca_som411
	MOVF        _temp_som+0, 0 
	SUBLW       3
L__toca_som411:
	BTFSC       STATUS+0, 0 
	GOTO        L_toca_som211
	CLRF        _temp_som+0 
	CLRF        _temp_som+1 
L_toca_som211:
;TCC_5.c,991 :: 		if(temp_som==3)                               //conta 300 milisegundos...
	MOVLW       0
	XORWF       _temp_som+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__toca_som412
	MOVLW       3
	XORWF       _temp_som+0, 0 
L__toca_som412:
	BTFSS       STATUS+0, 2 
	GOTO        L_toca_som212
;TCC_5.c,993 :: 		temp_som = 0x00;                             //zera temp_som
	CLRF        _temp_som+0 
	CLRF        _temp_som+1 
;TCC_5.c,994 :: 		SOM = ~SOM;                                  //inverte o estado do buzzer
	BTG         PORTA+0, 2 
;TCC_5.c,995 :: 		vezes++;                                     //incrementa vezes
	INFSNZ      _vezes+0, 1 
	INCF        _vezes+1, 1 
;TCC_5.c,997 :: 		if(!ligar)                                   //se ligar for 0 (desligado)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_toca_som213
;TCC_5.c,999 :: 		vezes = 0x00;                               //zera vezes
	CLRF        _vezes+0 
	CLRF        _vezes+1 
;TCC_5.c,1000 :: 		SOM   = 0x00;                               //desliga o buzzer
	BCF         PORTA+0, 2 
;TCC_5.c,1002 :: 		}                                            //end if !ligar
L_toca_som213:
;TCC_5.c,1004 :: 		}                                             //end if temp_som==3
L_toca_som212:
;TCC_5.c,1006 :: 		}                                                 //end toca_som()
L_end_toca_som:
	RETURN      0
; end of _toca_som

_abre_mot:

;TCC_5.c,1013 :: 		void abre_mot()
;TCC_5.c,1015 :: 		open_bit  = 0x01;                                //seta bit de abertura
	BSF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,1016 :: 		close_bit = 0x00;                                //limpa bit de fechamento
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,1017 :: 		x_mot     = 0x00;                                //zera x_mot
	CLRF        _x_mot+0 
	CLRF        _x_mot+1 
;TCC_5.c,1019 :: 		}                                                 //end abre_mot()
L_end_abre_mot:
	RETURN      0
; end of _abre_mot

_abre_mot2:

;TCC_5.c,1026 :: 		void abre_mot2()
;TCC_5.c,1028 :: 		open_bit2  = 0x01;                               //seta bit de abertura
	BSF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,1029 :: 		close_bit2 = 0x00;                               //limpa bit de fechamento
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,1030 :: 		x_mot2     = 0x00;                               //zera x_mot
	CLRF        _x_mot2+0 
	CLRF        _x_mot2+1 
;TCC_5.c,1032 :: 		}                                                 //end abre_mot2()
L_end_abre_mot2:
	RETURN      0
; end of _abre_mot2

_abre_mot3:

;TCC_5.c,1039 :: 		void abre_mot3()
;TCC_5.c,1041 :: 		open_bit3  = 0x01;                               //seta bit de abertura
	BSF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,1042 :: 		close_bit3 = 0x00;                               //limpa bit de fechamento
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1043 :: 		x_mot3     = 0x00;                               //zera x_mot
	CLRF        _x_mot3+0 
	CLRF        _x_mot3+1 
;TCC_5.c,1045 :: 		}                                                 //end abre_mot3()
L_end_abre_mot3:
	RETURN      0
; end of _abre_mot3

_mot_aberto:

;TCC_5.c,1051 :: 		void mot_aberto()
;TCC_5.c,1053 :: 		if(x_mot<10)                                     //se x_mot for menor que 10...
	MOVLW       0
	SUBWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto417
	MOVLW       10
	SUBWF       _x_mot+0, 0 
L__mot_aberto417:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto214
;TCC_5.c,1055 :: 		SM=0;                                         //  ||
	BCF         PORTA+0, 1 
;TCC_5.c,1056 :: 		delay_us(18000);                              //  ||
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto215:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto215
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto215
	NOP
	NOP
;TCC_5.c,1057 :: 		SM=1;                                         //  ||
	BSF         PORTA+0, 1 
;TCC_5.c,1058 :: 		delay_us(2000);                               //  \/
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto216:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto216
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto216
	NOP
;TCC_5.c,1059 :: 		SM=0;                                         // liga motor 1 no sentido horário
	BCF         PORTA+0, 1 
;TCC_5.c,1060 :: 		x_mot ++;                                     //incrementa x_mot
	INFSNZ      _x_mot+0, 1 
	INCF        _x_mot+1, 1 
;TCC_5.c,1062 :: 		}                                               //end if x_mot<10
L_mot_aberto214:
;TCC_5.c,1064 :: 		if(x_mot == 10)                                 //se x_mot for 10...
	MOVLW       0
	XORWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto418
	MOVLW       10
	XORWF       _x_mot+0, 0 
L__mot_aberto418:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto217
;TCC_5.c,1066 :: 		fecha_mot();                                  //executa a configuração dos bits de controle do motor 1 para fechar
	CALL        _fecha_mot+0, 0
;TCC_5.c,1068 :: 		}                                              //end if x_mot==10
L_mot_aberto217:
;TCC_5.c,1070 :: 		}                                                 //end mot_aberto()
L_end_mot_aberto:
	RETURN      0
; end of _mot_aberto

_mot_aberto2:

;TCC_5.c,1076 :: 		void mot_aberto2()
;TCC_5.c,1078 :: 		if(x_mot2<10)                                    //se x_mot2 for menor que 10...
	MOVLW       0
	SUBWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2420
	MOVLW       10
	SUBWF       _x_mot2+0, 0 
L__mot_aberto2420:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto2218
;TCC_5.c,1080 :: 		SM2=0;                                        //  ||
	BCF         PORTA+0, 4 
;TCC_5.c,1081 :: 		delay_us(18000);                              //  ||
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto2219:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto2219
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto2219
	NOP
	NOP
;TCC_5.c,1082 :: 		SM2=1;                                        //  ||
	BSF         PORTA+0, 4 
;TCC_5.c,1083 :: 		delay_us(2000);                               //  \/
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto2220:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto2220
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto2220
	NOP
;TCC_5.c,1084 :: 		SM2=0;                                        //liga motor 2 no sentido horário
	BCF         PORTA+0, 4 
;TCC_5.c,1085 :: 		x_mot2 ++;                                    //incrementa x_mot2
	INFSNZ      _x_mot2+0, 1 
	INCF        _x_mot2+1, 1 
;TCC_5.c,1087 :: 		}                                               //end if x_mot2<10
L_mot_aberto2218:
;TCC_5.c,1089 :: 		if(x_mot2 == 10)                                //se x_mot2 for 10...
	MOVLW       0
	XORWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2421
	MOVLW       10
	XORWF       _x_mot2+0, 0 
L__mot_aberto2421:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto2221
;TCC_5.c,1091 :: 		fecha_mot2();                                 //executa a configuração dos bits de controle do motor 2 para fechar
	CALL        _fecha_mot2+0, 0
;TCC_5.c,1093 :: 		}                                              //end if x_mot2==10
L_mot_aberto2221:
;TCC_5.c,1095 :: 		}                                                 //end mot_aberto2()
L_end_mot_aberto2:
	RETURN      0
; end of _mot_aberto2

_mot_aberto3:

;TCC_5.c,1101 :: 		void mot_aberto3()
;TCC_5.c,1103 :: 		if(x_mot3<10)                                    //se x_mot3 for menor que 10...
	MOVLW       0
	SUBWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto3423
	MOVLW       10
	SUBWF       _x_mot3+0, 0 
L__mot_aberto3423:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto3222
;TCC_5.c,1105 :: 		SM3=0;                                        //  ||
	BCF         PORTA+0, 5 
;TCC_5.c,1106 :: 		delay_us(18000);                              //  ||
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto3223:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto3223
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto3223
	NOP
	NOP
;TCC_5.c,1107 :: 		SM3=1;                                        //  ||
	BSF         PORTA+0, 5 
;TCC_5.c,1108 :: 		delay_us(2000);                               //  \/
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto3224:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto3224
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto3224
	NOP
;TCC_5.c,1109 :: 		SM3=0;                                        // liga motor 1 no sentido horário
	BCF         PORTA+0, 5 
;TCC_5.c,1110 :: 		x_mot3 ++;                                    //incrementa x_mot3
	INFSNZ      _x_mot3+0, 1 
	INCF        _x_mot3+1, 1 
;TCC_5.c,1112 :: 		}                                               //end if x_mot3<10
L_mot_aberto3222:
;TCC_5.c,1114 :: 		if(x_mot3 == 10)                                //se x_mot3 for 10...
	MOVLW       0
	XORWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto3424
	MOVLW       10
	XORWF       _x_mot3+0, 0 
L__mot_aberto3424:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto3225
;TCC_5.c,1116 :: 		fecha_mot3();                                 //executa a configuração dos bits de controle do motor 3 para fechar
	CALL        _fecha_mot3+0, 0
;TCC_5.c,1118 :: 		}                                              //end if x_mot3==10
L_mot_aberto3225:
;TCC_5.c,1120 :: 		}                                                 //end mot_aberto3()
L_end_mot_aberto3:
	RETURN      0
; end of _mot_aberto3

_fecha_mot:

;TCC_5.c,1127 :: 		void fecha_mot()
;TCC_5.c,1129 :: 		open_bit  = 0x00;                                //limpa o bit de abertura
	BCF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,1130 :: 		close_bit = 0x01;                                //seta o bit de fechamento
	BSF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,1131 :: 		x_mot     = 0x00;                                //zera x_mot
	CLRF        _x_mot+0 
	CLRF        _x_mot+1 
;TCC_5.c,1133 :: 		}                                                 //end fecha_mot()
L_end_fecha_mot:
	RETURN      0
; end of _fecha_mot

_fecha_mot2:

;TCC_5.c,1140 :: 		void fecha_mot2()
;TCC_5.c,1142 :: 		open_bit2  = 0x00;                               //limpa o bit de abertura
	BCF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,1143 :: 		close_bit2 = 0x01;                               //seta o bit de fechamento
	BSF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,1144 :: 		x_mot2     = 0x00;                               //zera x_mot2
	CLRF        _x_mot2+0 
	CLRF        _x_mot2+1 
;TCC_5.c,1146 :: 		}                                                 //end fecha_mot2()
L_end_fecha_mot2:
	RETURN      0
; end of _fecha_mot2

_fecha_mot3:

;TCC_5.c,1153 :: 		void fecha_mot3()
;TCC_5.c,1155 :: 		open_bit3  = 0x00;                               //limpa o bit de abertura
	BCF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,1156 :: 		close_bit3 = 0x01;                               //seta o bit de fechamento
	BSF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1157 :: 		x_mot3     = 0x00;                               //zera x_mot3
	CLRF        _x_mot3+0 
	CLRF        _x_mot3+1 
;TCC_5.c,1159 :: 		}                                                 //end fecha_mot3()
L_end_fecha_mot3:
	RETURN      0
; end of _fecha_mot3

_mot_fechado:

;TCC_5.c,1165 :: 		void mot_fechado()
;TCC_5.c,1167 :: 		if(x_mot<10)                                     //se x_mot for menor que 10
	MOVLW       0
	SUBWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado429
	MOVLW       10
	SUBWF       _x_mot+0, 0 
L__mot_fechado429:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado226
;TCC_5.c,1169 :: 		SM=0;                                         //  ||
	BCF         PORTA+0, 1 
;TCC_5.c,1170 :: 		delay_us(18500);                              //  ||
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado227:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado227
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado227
	NOP
	NOP
;TCC_5.c,1171 :: 		SM=1;                                         //  ||
	BSF         PORTA+0, 1 
;TCC_5.c,1172 :: 		delay_us(1500);                               //  \/
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado228:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado228
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado228
	NOP
;TCC_5.c,1173 :: 		SM=0;                                         //leva o motor para a posição inicial
	BCF         PORTA+0, 1 
;TCC_5.c,1174 :: 		x_mot++;                                      //incrementa x_mot
	INFSNZ      _x_mot+0, 1 
	INCF        _x_mot+1, 1 
;TCC_5.c,1176 :: 		}                                               //end if x_mot<10
L_mot_fechado226:
;TCC_5.c,1178 :: 		if(x_mot==10)                                   //se x_mot for 10
	MOVLW       0
	XORWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado430
	MOVLW       10
	XORWF       _x_mot+0, 0 
L__mot_fechado430:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado229
;TCC_5.c,1180 :: 		close_bit = 0x00;                            //limpa o bit de fechamento
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,1182 :: 		}                                             //end if x_mot==10
L_mot_fechado229:
;TCC_5.c,1184 :: 		}                                                 //end mot_fechado
L_end_mot_fechado:
	RETURN      0
; end of _mot_fechado

_mot_fechado2:

;TCC_5.c,1190 :: 		void mot_fechado2()
;TCC_5.c,1192 :: 		if(x_mot2<10)                                   //se x_mot2 for menor que 10
	MOVLW       0
	SUBWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2432
	MOVLW       10
	SUBWF       _x_mot2+0, 0 
L__mot_fechado2432:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado2230
;TCC_5.c,1194 :: 		SM2=0;                                        //  ||
	BCF         PORTA+0, 4 
;TCC_5.c,1195 :: 		delay_us(18500);                              //  ||
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado2231:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado2231
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado2231
	NOP
	NOP
;TCC_5.c,1196 :: 		SM2=1;                                        //  ||
	BSF         PORTA+0, 4 
;TCC_5.c,1197 :: 		delay_us(1500);                               //  \/
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado2232:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado2232
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado2232
	NOP
;TCC_5.c,1198 :: 		SM2=0;                                        //leva o motor 2 para a posição inicial
	BCF         PORTA+0, 4 
;TCC_5.c,1199 :: 		x_mot2++;                                     //incrementa x_mot2
	INFSNZ      _x_mot2+0, 1 
	INCF        _x_mot2+1, 1 
;TCC_5.c,1201 :: 		}                                               //end if x_mot2<10
L_mot_fechado2230:
;TCC_5.c,1203 :: 		if(x_mot2==10)                                  //se x_mot2 for 10
	MOVLW       0
	XORWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2433
	MOVLW       10
	XORWF       _x_mot2+0, 0 
L__mot_fechado2433:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado2233
;TCC_5.c,1205 :: 		close_bit2 = 0x00;                           //limpa o bit de fechamento
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,1207 :: 		}                                             //end if x_mot2==10
L_mot_fechado2233:
;TCC_5.c,1209 :: 		}                                                 //end mot_fechado2()
L_end_mot_fechado2:
	RETURN      0
; end of _mot_fechado2

_mot_fechado3:

;TCC_5.c,1215 :: 		void mot_fechado3()
;TCC_5.c,1217 :: 		if(x_mot3<10)                                   //se x_mot3 for menor que 10
	MOVLW       0
	SUBWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado3435
	MOVLW       10
	SUBWF       _x_mot3+0, 0 
L__mot_fechado3435:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado3234
;TCC_5.c,1219 :: 		SM3=0;                                        //  ||
	BCF         PORTA+0, 5 
;TCC_5.c,1220 :: 		delay_us(18500);                              //  ||
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado3235:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado3235
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado3235
	NOP
	NOP
;TCC_5.c,1221 :: 		SM3=1;                                        //  ||
	BSF         PORTA+0, 5 
;TCC_5.c,1222 :: 		delay_us(1500);                               //  \/
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado3236:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado3236
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado3236
	NOP
;TCC_5.c,1223 :: 		SM3=0;                                        //leva o motor 3 para a posição inicial
	BCF         PORTA+0, 5 
;TCC_5.c,1224 :: 		x_mot3++;                                     //incrementa x_mot3
	INFSNZ      _x_mot3+0, 1 
	INCF        _x_mot3+1, 1 
;TCC_5.c,1226 :: 		}                                               //end if x_mot2<10
L_mot_fechado3234:
;TCC_5.c,1228 :: 		if(x_mot3==10)                                  //se x_mot3 for 10
	MOVLW       0
	XORWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado3436
	MOVLW       10
	XORWF       _x_mot3+0, 0 
L__mot_fechado3436:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado3237
;TCC_5.c,1230 :: 		close_bit3 = 0x00;                           //limpa o bit de fechamento
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1232 :: 		}                                             //end if x_mot3==10
L_mot_fechado3237:
;TCC_5.c,1234 :: 		}                                                 //end mot_fechado3()
L_end_mot_fechado3:
	RETURN      0
; end of _mot_fechado3

_read_motbits:

;TCC_5.c,1241 :: 		void read_motbits()
;TCC_5.c,1243 :: 		if(!open_bit && !close_bit) atv_mot = 0x00;    //se os bits de abertura e fechamento do motor 1 forem 0,
	BTFSC       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits240
	BTFSC       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits240
L__read_motbits300:
	BCF         _atv_mot+0, BitPos(_atv_mot+0) 
L_read_motbits240:
;TCC_5.c,1246 :: 		if(open_bit && !close_bit)                     //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits243
	BTFSC       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits243
L__read_motbits299:
;TCC_5.c,1248 :: 		mot_aberto();                                 //executa a abertura do motor 1
	CALL        _mot_aberto+0, 0
;TCC_5.c,1250 :: 		}                                              //end if open_bit && !close_bit
L_read_motbits243:
;TCC_5.c,1252 :: 		if(!open_bit && close_bit)                     //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits246
	BTFSS       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits246
L__read_motbits298:
;TCC_5.c,1254 :: 		mot_fechado();                                //executa o fechamento do motor 1
	CALL        _mot_fechado+0, 0
;TCC_5.c,1256 :: 		}                                              //end if !open_bit && close_bit
L_read_motbits246:
;TCC_5.c,1259 :: 		if(!open_bit2 && !close_bit2) atv_mot2 = 0x00; //se os bits de abertura e fechamento do motor 2 forem 0,
	BTFSC       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits249
	BTFSC       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits249
L__read_motbits297:
	BCF         _atv_mot2+0, BitPos(_atv_mot2+0) 
L_read_motbits249:
;TCC_5.c,1262 :: 		if(open_bit2 && !close_bit2)                   //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits252
	BTFSC       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits252
L__read_motbits296:
;TCC_5.c,1264 :: 		mot_aberto2();                                //executa a abertura do motor 2
	CALL        _mot_aberto2+0, 0
;TCC_5.c,1266 :: 		}                                              //end if open_bit2 && !close_bit2
L_read_motbits252:
;TCC_5.c,1268 :: 		if(!open_bit2 && close_bit2)                   //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits255
	BTFSS       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits255
L__read_motbits295:
;TCC_5.c,1270 :: 		mot_fechado2();                               //executa o fechamento do motor 2
	CALL        _mot_fechado2+0, 0
;TCC_5.c,1272 :: 		}                                              //end if !open_bit2 && close_bit2
L_read_motbits255:
;TCC_5.c,1275 :: 		if(!open_bit3 && !close_bit3) atv_mot3 = 0x00; //se os bits de abertura e fechamento do motor 3 forem 0,
	BTFSC       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits258
	BTFSC       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits258
L__read_motbits294:
	BCF         _atv_mot3+0, BitPos(_atv_mot3+0) 
L_read_motbits258:
;TCC_5.c,1278 :: 		if(open_bit3 && !close_bit3)                   //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits261
	BTFSC       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits261
L__read_motbits293:
;TCC_5.c,1280 :: 		mot_aberto3();                                //executa a abertura do motor 3
	CALL        _mot_aberto3+0, 0
;TCC_5.c,1282 :: 		}                                              //end if open_bit3 && !close_bit3
L_read_motbits261:
;TCC_5.c,1284 :: 		if(!open_bit3 && close_bit3)                   //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits264
	BTFSS       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits264
L__read_motbits292:
;TCC_5.c,1286 :: 		mot_fechado3();                               //executa o fechamento do motor 3
	CALL        _mot_fechado3+0, 0
;TCC_5.c,1288 :: 		}                                              //end if !open_bit3 && close_bit3
L_read_motbits264:
;TCC_5.c,1290 :: 		}                                                 //end read_motbits()
L_end_read_motbits:
	RETURN      0
; end of _read_motbits
