
_interrupt:

;TCC_5.c,179 :: 		void interrupt()                          //interrupção
;TCC_5.c,182 :: 		if(TMR0IF_bit)                        //overflow em 100ms overflow
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;TCC_5.c,184 :: 		TMR0IF_bit =  0x00;                  //zera flag do timer0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;TCC_5.c,185 :: 		TMR0H      =  0xED;
	MOVLW       237
	MOVWF       TMR0H+0 
;TCC_5.c,186 :: 		TMR0L      =  0xB1;                  //seta timer0 em 60849
	MOVLW       177
	MOVWF       TMR0L+0 
;TCC_5.c,187 :: 		temp++;                              //incrementa temp
	INFSNZ      _temp+0, 1 
	INCF        _temp+1, 1 
;TCC_5.c,188 :: 		temp2++;                             //incrementa temp2
	INFSNZ      _temp2+0, 1 
	INCF        _temp2+1, 1 
;TCC_5.c,189 :: 		temp3++;                             //incrementa temp3
	INFSNZ      _temp3+0, 1 
	INCF        _temp3+1, 1 
;TCC_5.c,190 :: 		temp4++;                             //incrementa temp4
	INFSNZ      _temp4+0, 1 
	INCF        _temp4+1, 1 
;TCC_5.c,192 :: 		temp_led++;                         //incrementa temp_led
	INFSNZ      _temp_led+0, 1 
	INCF        _temp_led+1, 1 
;TCC_5.c,193 :: 		temp_led2++;                        //incrementa temp_led2
	INFSNZ      _temp_led2+0, 1 
	INCF        _temp_led2+1, 1 
;TCC_5.c,194 :: 		temp_led3++;                        //incrementa temp_led3
	INFSNZ      _temp_led3+0, 1 
	INCF        _temp_led3+1, 1 
;TCC_5.c,195 :: 		temp_led4++;                        //incrementa temp_led4
	INFSNZ      _temp_led4+0, 1 
	INCF        _temp_led4+1, 1 
;TCC_5.c,196 :: 		temp_led5++;                        //incrementa temp_led5
	INFSNZ      _temp_led5+0, 1 
	INCF        _temp_led5+1, 1 
;TCC_5.c,197 :: 		temp_disp++;                        //incrementa temp_disp
	INFSNZ      _temp_disp+0, 1 
	INCF        _temp_disp+1, 1 
;TCC_5.c,198 :: 		temp_som++;                         //incrementa temp_som
	INFSNZ      _temp_som+0, 1 
	INCF        _temp_som+1, 1 
;TCC_5.c,199 :: 		temp_inc++;                         //incrementa temp_inc
	INFSNZ      _temp_inc+0, 1 
	INCF        _temp_inc+1, 1 
;TCC_5.c,200 :: 		temp_lcd++;                         //incrementa temp_lcd
	INFSNZ      _temp_lcd+0, 1 
	INCF        _temp_lcd+1, 1 
;TCC_5.c,201 :: 		temp_num++;                         //icrementa temp_num
	INFSNZ      _temp_num+0, 1 
	INCF        _temp_num+1, 1 
;TCC_5.c,203 :: 		}                                     //end if TMR0IF
L_interrupt0:
;TCC_5.c,207 :: 		piscaLED();                           //executa piscaLED
	CALL        _piscaLED+0, 0
;TCC_5.c,208 :: 		timebase();                           //executa timebase
	CALL        _timebase+0, 0
;TCC_5.c,209 :: 		timebase2();                          //executa timebase2
	CALL        _timebase2+0, 0
;TCC_5.c,210 :: 		timebase3();                          //executa timebase3
	CALL        _timebase3+0, 0
;TCC_5.c,211 :: 		timebase4();                          //executa timebase4
	CALL        _timebase4+0, 0
;TCC_5.c,214 :: 		}                                          //end interrupt()
L_end_interrupt:
L__interrupt430:
	RETFIE      1
; end of _interrupt

_main:

;TCC_5.c,220 :: 		void main (void)
;TCC_5.c,225 :: 		ADCON1        =   0x0F;                   //Define os pinos como digital
	MOVLW       15
	MOVWF       ADCON1+0 
;TCC_5.c,226 :: 		CMCON         =   0x07;                   //Desativa os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;TCC_5.c,228 :: 		TMR0H         =   0xED;
	MOVLW       237
	MOVWF       TMR0H+0 
;TCC_5.c,229 :: 		TMR0L         =   0xB1;                   //Inicia timer0 em 60849
	MOVLW       177
	MOVWF       TMR0L+0 
;TCC_5.c,232 :: 		INTCON.GIE    =   0x01;                   //Ativa interrupção global
	BSF         INTCON+0, 7 
;TCC_5.c,233 :: 		INTCON.PEIE   =   0x01;                   //Ativa interrupção por periféricos
	BSF         INTCON+0, 6 
;TCC_5.c,234 :: 		INTCON.TMR0IE =   0x01;                   //Ativa interrupção por overflow
	BSF         INTCON+0, 5 
;TCC_5.c,236 :: 		TMR0IF_bit    =   0x00;                   //zera a flag do timer0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;TCC_5.c,239 :: 		INTCON2.RBPU  =   0x01;                   //Desliga os resistores de pull-ups do portB
	BSF         INTCON2+0, 7 
;TCC_5.c,240 :: 		T0CON         =   0x87;                   //TMR0 16 bits, prescaler 1:256
	MOVLW       135
	MOVWF       T0CON+0 
;TCC_5.c,244 :: 		ligar         =   0x00;                   //     |
	BCF         _ligar+0, BitPos(_ligar+0) 
;TCC_5.c,245 :: 		block_cmd     =   0x00;                   //     |
	BCF         _block_cmd+0, BitPos(_block_cmd+0) 
;TCC_5.c,246 :: 		b1_flag       =   0x00;                   //     |
	BCF         _b1_flag+0, BitPos(_b1_flag+0) 
;TCC_5.c,247 :: 		b2_flag       =   0x00;                   //     |
	BCF         _b2_flag+0, BitPos(_b2_flag+0) 
;TCC_5.c,248 :: 		b3_flag       =   0x00;                   //     |
	BCF         _b3_flag+0, BitPos(_b3_flag+0) 
;TCC_5.c,249 :: 		b4_flag       =   0x00;                   //     |
	BCF         _b4_flag+0, BitPos(_b4_flag+0) 
;TCC_5.c,250 :: 		b5_flag       =   0x00;                   //     |
	BCF         _b5_flag+0, BitPos(_b5_flag+0) 
;TCC_5.c,251 :: 		display       =   0x00;                   //     |
	BCF         _display+0, BitPos(_display+0) 
;TCC_5.c,252 :: 		fast_inc      =   0x00;                   //     |
	CLRF        _fast_inc+0 
	CLRF        _fast_inc+1 
;TCC_5.c,253 :: 		toque         =   0x00;                   //     |
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,254 :: 		toque2        =   0x00;                   //     |
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,255 :: 		toque3        =   0x00;                   //     |
	BCF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,256 :: 		toque4        =   0x00;                   //     |
	BCF         _toque4+0, BitPos(_toque4+0) 
;TCC_5.c,257 :: 		open_bit      =   0x00;                   //     |
	BCF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,258 :: 		open_bit2     =   0x00;                   //     |
	BCF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,259 :: 		open_bit3     =   0x00;                   //     |
	BCF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,260 :: 		open_bit4     =   0x00;                   //     |
	BCF         _open_bit4+0, BitPos(_open_bit4+0) 
;TCC_5.c,261 :: 		close_bit     =   0x00;                   //     |
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,262 :: 		close_bit2    =   0x00;                   //     |
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,263 :: 		close_bit3    =   0x00;                   //     |
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,264 :: 		close_bit4    =   0x00;                   //     |
	BCF         _close_bit4+0, BitPos(_close_bit4+0) 
;TCC_5.c,265 :: 		atv_mot       =   0x00;                   //     |
	BCF         _atv_mot+0, BitPos(_atv_mot+0) 
;TCC_5.c,266 :: 		atv_mot2      =   0x00;                   //     |
	BCF         _atv_mot2+0, BitPos(_atv_mot2+0) 
;TCC_5.c,267 :: 		atv_mot3      =   0x00;                   //     |
	BCF         _atv_mot3+0, BitPos(_atv_mot3+0) 
;TCC_5.c,268 :: 		atv_mot4      =   0x00;                   //    \ /
	BCF         _atv_mot4+0, BitPos(_atv_mot4+0) 
;TCC_5.c,270 :: 		SM            =   0x00;                   //zerando todos os bits
	BCF         PORTB+0, 0 
;TCC_5.c,271 :: 		SM2           =   0x00;
	BCF         PORTB+0, 1 
;TCC_5.c,272 :: 		SM3           =   0x00;
	BCF         PORTB+0, 3 
;TCC_5.c,273 :: 		SM4           =   0x00;
	BCF         PORTB+0, 2 
;TCC_5.c,275 :: 		LED2          =   0x00;
	BCF         PORTA+0, 0 
;TCC_5.c,276 :: 		LCD_LED       =   0x01;
	BSF         PORTC+0, 2 
;TCC_5.c,278 :: 		num           =   EEPROM_Read(0x01);      //lê os dados da EEPROM para variável num
	MOVLW       1
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVLW       0
	MOVWF       _num+1 
;TCC_5.c,279 :: 		un            =   EEPROM_Read(0x03);      //lê os dados da EEPROM para variável un
	MOVLW       3
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main432
	BCF         _un+0, BitPos(_un+0) 
	GOTO        L__main433
L__main432:
	BSF         _un+0, BitPos(_un+0) 
L__main433:
;TCC_5.c,280 :: 		num2          =   EEPROM_Read(0x02);      //lê os dados da EEPROM para variável num2
	MOVLW       2
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num2+0 
	MOVLW       0
	MOVWF       _num2+1 
;TCC_5.c,281 :: 		un2           =   EEPROM_Read(0x04);      //lê os dados da EEPROM para variável un2
	MOVLW       4
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main434
	BCF         _un2+0, BitPos(_un2+0) 
	GOTO        L__main435
L__main434:
	BSF         _un2+0, BitPos(_un2+0) 
L__main435:
;TCC_5.c,282 :: 		num3          =   EEPROM_Read(0x05);      //lê os dados da EEPROM para variável num3
	MOVLW       5
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num3+0 
	MOVLW       0
	MOVWF       _num3+1 
;TCC_5.c,283 :: 		un3           =   EEPROM_Read(0x06);      //lê os dados da EEPROM para variável un3
	MOVLW       6
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main436
	BCF         _un3+0, BitPos(_un3+0) 
	GOTO        L__main437
L__main436:
	BSF         _un3+0, BitPos(_un3+0) 
L__main437:
;TCC_5.c,284 :: 		num4          =   EEPROM_Read(0x07);      //lê os dados da EEPROM para variável num4
	MOVLW       7
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num4+0 
	MOVLW       0
	MOVWF       _num4+1 
;TCC_5.c,285 :: 		un4           =   EEPROM_Read(0x08);      //lê os dados da EEPROM para variável un4
	MOVLW       8
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main438
	BCF         _un4+0, BitPos(_un4+0) 
	GOTO        L__main439
L__main438:
	BSF         _un4+0, BitPos(_un4+0) 
L__main439:
;TCC_5.c,286 :: 		qtd_comp      =   EEPROM_Read(0x09);      //lê os dados da EEPROM para variavel qtd_comp
	MOVLW       9
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _qtd_comp+0 
	MOVLW       0
	MOVWF       _qtd_comp+1 
;TCC_5.c,287 :: 		qtd_comp2     =   EEPROM_Read(0x0A);      //lê os dados da EEPROM para variavel qtd_comp2
	MOVLW       10
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _qtd_comp2+0 
	MOVLW       0
	MOVWF       _qtd_comp2+1 
;TCC_5.c,288 :: 		qtd_comp3     =   EEPROM_Read(0x0B);      //lê os dados da EEPROM para variavel qtd_comp3
	MOVLW       11
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _qtd_comp3+0 
	MOVLW       0
	MOVWF       _qtd_comp3+1 
;TCC_5.c,289 :: 		qtd_comp4     =   EEPROM_Read(0x0C);      //lê os dados da EEPROM para variavel qtd_comp4
	MOVLW       12
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _qtd_comp4+0 
	MOVLW       0
	MOVWF       _qtd_comp4+1 
;TCC_5.c,291 :: 		if(qtd_comp==0xFF)qtd_comp=0x01;
	MOVLW       0
	XORWF       _qtd_comp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main440
	MOVLW       255
	XORWF       _qtd_comp+0, 0 
L__main440:
	BTFSS       STATUS+0, 2 
	GOTO        L_main1
	MOVLW       1
	MOVWF       _qtd_comp+0 
	MOVLW       0
	MOVWF       _qtd_comp+1 
L_main1:
;TCC_5.c,292 :: 		if(qtd_comp2==0xFF)qtd_comp2=0x01;
	MOVLW       0
	XORWF       _qtd_comp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main441
	MOVLW       255
	XORWF       _qtd_comp2+0, 0 
L__main441:
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
	MOVLW       1
	MOVWF       _qtd_comp2+0 
	MOVLW       0
	MOVWF       _qtd_comp2+1 
L_main2:
;TCC_5.c,293 :: 		if(qtd_comp3==0xFF)qtd_comp3=0x01;
	MOVLW       0
	XORWF       _qtd_comp3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main442
	MOVLW       255
	XORWF       _qtd_comp3+0, 0 
L__main442:
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	MOVLW       1
	MOVWF       _qtd_comp3+0 
	MOVLW       0
	MOVWF       _qtd_comp3+1 
L_main3:
;TCC_5.c,294 :: 		if(qtd_comp4==0xFF)qtd_comp4=0x01;
	MOVLW       0
	XORWF       _qtd_comp4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main443
	MOVLW       255
	XORWF       _qtd_comp4+0, 0 
L__main443:
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
	MOVLW       1
	MOVWF       _qtd_comp4+0 
	MOVLW       0
	MOVWF       _qtd_comp4+1 
L_main4:
;TCC_5.c,296 :: 		TRISA = 0x20;                             //seta todos os bits do TRISA como saída
	MOVLW       32
	MOVWF       TRISA+0 
;TCC_5.c,297 :: 		TRISC = 0xC3;                             //seta os bits 0,1,2,6,7 como entrada
	MOVLW       195
	MOVWF       TRISC+0 
;TCC_5.c,298 :: 		TRISB = 0x00;                             //seta todos os bits do TRISB como saída
	CLRF        TRISB+0 
;TCC_5.c,300 :: 		LCD_Init();                               //inicia o LCD
	CALL        _Lcd_Init+0, 0
;TCC_5.c,301 :: 		LCD_Cmd(_LCD_CLEAR);                      //limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,302 :: 		LCD_Cmd(_LCD_CURSOR_OFF);                 //desliga cursor do LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,305 :: 		while(1)                                         //loop infinito
L_main5:
;TCC_5.c,307 :: 		ler_bot();                                     //executa ler_bot
	CALL        _ler_bot+0, 0
;TCC_5.c,309 :: 		disp();                                        //executa disp
	CALL        _disp+0, 0
;TCC_5.c,310 :: 		}                                                //end while
	GOTO        L_main5
;TCC_5.c,312 :: 		}                                                 //end main
L_end_main:
	GOTO        $+0
; end of _main

_ler_bot:

;TCC_5.c,317 :: 		void ler_bot()
;TCC_5.c,320 :: 		if(!BOTAO1) b1_flag=0x01;                       //se botão1 for pressionado, flag do botão1 = 1
	BTFSC       PORTC+0, 0 
	GOTO        L_ler_bot7
	BSF         _b1_flag+0, BitPos(_b1_flag+0) 
L_ler_bot7:
;TCC_5.c,322 :: 		if(BOTAO1 && b1_flag)                           //se botão1 estiver solto e flag do botão1 = 1
	BTFSS       PORTC+0, 0 
	GOTO        L_ler_bot10
	BTFSS       _b1_flag+0, BitPos(_b1_flag+0) 
	GOTO        L_ler_bot10
L__ler_bot391:
;TCC_5.c,324 :: 		LCD_Cmd(_LCD_CLEAR);                           //limpa o LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,325 :: 		b1_flag = 0x00;                                //lmpa a flag do botão1
	BCF         _b1_flag+0, BitPos(_b1_flag+0) 
;TCC_5.c,326 :: 		LCD_LED = 0x01;                                //liga o LED do LCD
	BSF         PORTC+0, 2 
;TCC_5.c,327 :: 		if(!ligar)                                     //se bit ligar = 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot11
;TCC_5.c,329 :: 		prog++;                                       //incrementa prog, muda a programação
	INFSNZ      _prog+0, 1 
	INCF        _prog+1, 1 
;TCC_5.c,330 :: 		if(prog==4)                                   //se prog = 3
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot445
	MOVLW       4
	XORWF       _prog+0, 0 
L__ler_bot445:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot12
;TCC_5.c,332 :: 		prog=0x00;                                   //zera a variável prog
	CLRF        _prog+0 
	CLRF        _prog+1 
;TCC_5.c,333 :: 		EEPROM_Write(0x01,num);                      //grava num na EEPROM
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,334 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_ler_bot13:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot13
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot13
;TCC_5.c,335 :: 		EEPROM_Write(0x03,un);                       //grava un na EEPROM
	MOVLW       3
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un+0, BitPos(_un+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,336 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_ler_bot14:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot14
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot14
;TCC_5.c,337 :: 		EEPROM_Write(0x02,num2);                     //grava num2 na EEPROM
	MOVLW       2
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num2+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,338 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_ler_bot15:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot15
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot15
;TCC_5.c,339 :: 		EEPROM_Write(0x04,un2);                      //grava un2 na EEPROM
	MOVLW       4
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un2+0, BitPos(_un2+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,340 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_ler_bot16:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot16
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot16
;TCC_5.c,341 :: 		EEPROM_Write(0x05,num3);                     //grava num3 na EEPROM
	MOVLW       5
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num3+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,342 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_ler_bot17:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot17
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot17
;TCC_5.c,343 :: 		EEPROM_Write(0x06,un3);                      //grava un3 na EEPROM
	MOVLW       6
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un3+0, BitPos(_un3+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,344 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_ler_bot18:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot18
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot18
;TCC_5.c,345 :: 		EEPROM_Write(0x07,num4);                     //grava num4 na EEPROM
	MOVLW       7
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num4+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,346 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_ler_bot19:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot19
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot19
;TCC_5.c,347 :: 		EEPROM_Write(0x08,un4);                      //grava un4 na EEPROM
	MOVLW       8
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un4+0, BitPos(_un4+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,348 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_ler_bot20:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot20
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot20
;TCC_5.c,349 :: 		EEPROM_Write(0x09,qtd_comp);                 //grava qtd_comp na EEPROM
	MOVLW       9
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _qtd_comp+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,350 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_ler_bot21:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot21
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot21
;TCC_5.c,351 :: 		EEPROM_Write(0x0A,qtd_comp2);                //grava qtd_comp2 na EEPROM
	MOVLW       10
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _qtd_comp2+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,352 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_ler_bot22:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot22
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot22
;TCC_5.c,353 :: 		EEPROM_Write(0x0B,qtd_comp3);                //grava qtd_comp3 na EEPROM
	MOVLW       11
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _qtd_comp3+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,354 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_ler_bot23:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot23
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot23
;TCC_5.c,355 :: 		EEPROM_Write(0x0C,qtd_comp4);                //grava qtd_comp4 na EEPROM
	MOVLW       12
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _qtd_comp4+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,356 :: 		delay_ms(10);                                //espera 10 micro segundos
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_ler_bot24:
	DECFSZ      R13, 1, 1
	BRA         L_ler_bot24
	DECFSZ      R12, 1, 1
	BRA         L_ler_bot24
;TCC_5.c,357 :: 		display=0x01;                                //bit display em 1
	BSF         _display+0, BitPos(_display+0) 
;TCC_5.c,359 :: 		}                                             //end if prog = 3
L_ler_bot12:
;TCC_5.c,361 :: 		}                                              //end if !ligar
L_ler_bot11:
;TCC_5.c,363 :: 		}                                               //end if BOTAO1 && b1_flag
L_ler_bot10:
;TCC_5.c,368 :: 		if(!BOTAO2)
	BTFSC       PORTC+0, 1 
	GOTO        L_ler_bot25
;TCC_5.c,370 :: 		b2_flag=0x01;                                  //se botão2 for pressionado, flag do botão2 = 1
	BSF         _b2_flag+0, BitPos(_b2_flag+0) 
;TCC_5.c,371 :: 		fast_incr();                                   //executa fast_incr
	CALL        _fast_incr+0, 0
;TCC_5.c,372 :: 		}
L_ler_bot25:
;TCC_5.c,374 :: 		if(BOTAO2 && b2_flag)                           //se botão2 for solto e flag do botão2 for 1
	BTFSS       PORTC+0, 1 
	GOTO        L_ler_bot28
	BTFSS       _b2_flag+0, BitPos(_b2_flag+0) 
	GOTO        L_ler_bot28
L__ler_bot390:
;TCC_5.c,376 :: 		LCD_Cmd(_LCD_CLEAR);                          //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,377 :: 		b2_flag    =  0x00;                           //limpa flag do botão
	BCF         _b2_flag+0, BitPos(_b2_flag+0) 
;TCC_5.c,378 :: 		fast_inc   =  0x00;                           //limpa bit de incremento rápido
	CLRF        _fast_inc+0 
	CLRF        _fast_inc+1 
;TCC_5.c,379 :: 		LCD_LED = 0x01;                               //liga o LED do LCD
	BSF         PORTC+0, 2 
;TCC_5.c,380 :: 		if(option==0)                                  //dispenser n°1
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot446
	MOVLW       0
	XORWF       _option+0, 0 
L__ler_bot446:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot29
;TCC_5.c,382 :: 		if(prog==1)                                   //programação de numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot447
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot447:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot30
;TCC_5.c,384 :: 		num++;                                       //incrementa num
	INFSNZ      _num+0, 1 
	INCF        _num+1, 1 
;TCC_5.c,385 :: 		}
L_ler_bot30:
;TCC_5.c,386 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot448
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot448:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot31
;TCC_5.c,388 :: 		un = ~un;                                   //inverte un
	BTG         _un+0, BitPos(_un+0) 
;TCC_5.c,389 :: 		}                                             //end if prog==2
L_ler_bot31:
;TCC_5.c,391 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot449
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot449:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot32
;TCC_5.c,393 :: 		qtd_comp++;                                  //incrementa qtd_comp
	INFSNZ      _qtd_comp+0, 1 
	INCF        _qtd_comp+1, 1 
;TCC_5.c,394 :: 		}
L_ler_bot32:
;TCC_5.c,396 :: 		if(qtd_comp>4) qtd_comp = 0x01;               //se quantidade de comprimidos passar de 4, retorna para 1
	MOVLW       0
	MOVWF       R0 
	MOVF        _qtd_comp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot450
	MOVF        _qtd_comp+0, 0 
	SUBLW       4
L__ler_bot450:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot33
	MOVLW       1
	MOVWF       _qtd_comp+0 
	MOVLW       0
	MOVWF       _qtd_comp+1 
L_ler_bot33:
;TCC_5.c,397 :: 		if(num>24) num=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot451
	MOVF        _num+0, 0 
	SUBLW       24
L__ler_bot451:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot34
	CLRF        _num+0 
	CLRF        _num+1 
L_ler_bot34:
;TCC_5.c,399 :: 		}                                              //end if option==0
L_ler_bot29:
;TCC_5.c,401 :: 		if(option==1)                                  //dispenser n°2
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot452
	MOVLW       1
	XORWF       _option+0, 0 
L__ler_bot452:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot35
;TCC_5.c,403 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot453
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot453:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot36
;TCC_5.c,405 :: 		num2++;                                      //incrementa num2
	INFSNZ      _num2+0, 1 
	INCF        _num2+1, 1 
;TCC_5.c,406 :: 		}
L_ler_bot36:
;TCC_5.c,407 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot454
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot454:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot37
;TCC_5.c,409 :: 		un2 = ~un2;                                 //inverte un2
	BTG         _un2+0, BitPos(_un2+0) 
;TCC_5.c,410 :: 		}
L_ler_bot37:
;TCC_5.c,411 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot455
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot455:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot38
;TCC_5.c,413 :: 		qtd_comp2++;                                 //incrementa qtd_comp2
	INFSNZ      _qtd_comp2+0, 1 
	INCF        _qtd_comp2+1, 1 
;TCC_5.c,414 :: 		}
L_ler_bot38:
;TCC_5.c,416 :: 		if(qtd_comp2>4) qtd_comp2 = 0x01;             //se quantidade de comprimidos passar de 4, retorna para 1
	MOVLW       0
	MOVWF       R0 
	MOVF        _qtd_comp2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot456
	MOVF        _qtd_comp2+0, 0 
	SUBLW       4
L__ler_bot456:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot39
	MOVLW       1
	MOVWF       _qtd_comp2+0 
	MOVLW       0
	MOVWF       _qtd_comp2+1 
L_ler_bot39:
;TCC_5.c,417 :: 		if(num2>24) num2=0x00;                        //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot457
	MOVF        _num2+0, 0 
	SUBLW       24
L__ler_bot457:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot40
	CLRF        _num2+0 
	CLRF        _num2+1 
L_ler_bot40:
;TCC_5.c,419 :: 		}                                              //end if option==1
L_ler_bot35:
;TCC_5.c,421 :: 		if(option==2)                                  //dispenser n°3
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot458
	MOVLW       2
	XORWF       _option+0, 0 
L__ler_bot458:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot41
;TCC_5.c,423 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot459
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot459:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot42
;TCC_5.c,425 :: 		num3++;                                      //incrementa num3
	INFSNZ      _num3+0, 1 
	INCF        _num3+1, 1 
;TCC_5.c,426 :: 		}
L_ler_bot42:
;TCC_5.c,427 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot460
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot460:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot43
;TCC_5.c,429 :: 		un3 = ~un3;                                 //inverte un3
	BTG         _un3+0, BitPos(_un3+0) 
;TCC_5.c,430 :: 		}
L_ler_bot43:
;TCC_5.c,431 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot461
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot461:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot44
;TCC_5.c,433 :: 		qtd_comp3++;                                 //incrementa qtd_comp3
	INFSNZ      _qtd_comp3+0, 1 
	INCF        _qtd_comp3+1, 1 
;TCC_5.c,434 :: 		}
L_ler_bot44:
;TCC_5.c,436 :: 		if(qtd_comp3>4) qtd_comp3 = 0x01;             //se quantidade de comprimidos passar de 4, retorna para 1
	MOVLW       0
	MOVWF       R0 
	MOVF        _qtd_comp3+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot462
	MOVF        _qtd_comp3+0, 0 
	SUBLW       4
L__ler_bot462:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot45
	MOVLW       1
	MOVWF       _qtd_comp3+0 
	MOVLW       0
	MOVWF       _qtd_comp3+1 
L_ler_bot45:
;TCC_5.c,437 :: 		if(num3>24) num3=0x00;                        //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num3+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot463
	MOVF        _num3+0, 0 
	SUBLW       24
L__ler_bot463:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot46
	CLRF        _num3+0 
	CLRF        _num3+1 
L_ler_bot46:
;TCC_5.c,439 :: 		}                                              //end if option==2
L_ler_bot41:
;TCC_5.c,441 :: 		if(option==3)                                  //dispenser n°4
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot464
	MOVLW       3
	XORWF       _option+0, 0 
L__ler_bot464:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot47
;TCC_5.c,443 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot465
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot465:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot48
;TCC_5.c,445 :: 		num4++;                                      //incrementa num4
	INFSNZ      _num4+0, 1 
	INCF        _num4+1, 1 
;TCC_5.c,446 :: 		}
L_ler_bot48:
;TCC_5.c,447 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot466
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot466:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot49
;TCC_5.c,449 :: 		un4 = ~un4;                                 //inverte un4
	BTG         _un4+0, BitPos(_un4+0) 
;TCC_5.c,450 :: 		}
L_ler_bot49:
;TCC_5.c,451 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot467
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot467:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot50
;TCC_5.c,453 :: 		qtd_comp4++;                                 //incrementa qtd_comp4
	INFSNZ      _qtd_comp4+0, 1 
	INCF        _qtd_comp4+1, 1 
;TCC_5.c,454 :: 		}
L_ler_bot50:
;TCC_5.c,456 :: 		if(qtd_comp4>4) qtd_comp4 = 0x01;             //se quantidade de comprimidos passar de 4, retorna para 1
	MOVLW       0
	MOVWF       R0 
	MOVF        _qtd_comp4+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot468
	MOVF        _qtd_comp4+0, 0 
	SUBLW       4
L__ler_bot468:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot51
	MOVLW       1
	MOVWF       _qtd_comp4+0 
	MOVLW       0
	MOVWF       _qtd_comp4+1 
L_ler_bot51:
;TCC_5.c,457 :: 		if(num4>24) num4=0x00;                        //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num4+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot469
	MOVF        _num4+0, 0 
	SUBLW       24
L__ler_bot469:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot52
	CLRF        _num4+0 
	CLRF        _num4+1 
L_ler_bot52:
;TCC_5.c,459 :: 		}                                              //end if option==3
L_ler_bot47:
;TCC_5.c,461 :: 		comp  = qtd_comp;
	MOVF        _qtd_comp+0, 0 
	MOVWF       _comp+0 
	MOVF        _qtd_comp+1, 0 
	MOVWF       _comp+1 
;TCC_5.c,462 :: 		comp2 = qtd_comp2;
	MOVF        _qtd_comp2+0, 0 
	MOVWF       _comp2+0 
	MOVF        _qtd_comp2+1, 0 
	MOVWF       _comp2+1 
;TCC_5.c,463 :: 		comp3 = qtd_comp3;
	MOVF        _qtd_comp3+0, 0 
	MOVWF       _comp3+0 
	MOVF        _qtd_comp3+1, 0 
	MOVWF       _comp3+1 
;TCC_5.c,464 :: 		comp4 = qtd_comp4;                             //igualando as variaveis para despejar o numero certo de comprimidos
	MOVF        _qtd_comp4+0, 0 
	MOVWF       _comp4+0 
	MOVF        _qtd_comp4+1, 0 
	MOVWF       _comp4+1 
;TCC_5.c,466 :: 		}                                               //end if BOTAO2 e b2_flag
L_ler_bot28:
;TCC_5.c,469 :: 		if(!BOTAO3) b3_flag=0x01;                       //se botão3 for pressionado, flag do botão3 = 1
	BTFSC       PORTA+0, 5 
	GOTO        L_ler_bot53
	BSF         _b3_flag+0, BitPos(_b3_flag+0) 
L_ler_bot53:
;TCC_5.c,471 :: 		if(BOTAO3 && b3_flag)                           //se botão3 for solto e flag do botão3 for 1
	BTFSS       PORTA+0, 5 
	GOTO        L_ler_bot56
	BTFSS       _b3_flag+0, BitPos(_b3_flag+0) 
	GOTO        L_ler_bot56
L__ler_bot389:
;TCC_5.c,473 :: 		LCD_Cmd(_LCD_CLEAR);                           //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,474 :: 		b3_flag     =  0x00;                           //limpa flag do botão3
	BCF         _b3_flag+0, BitPos(_b3_flag+0) 
;TCC_5.c,475 :: 		LCD_LED = 0x01;                                //liga o LED do LCD
	BSF         PORTC+0, 2 
;TCC_5.c,476 :: 		if(option==0)                                  //dispenser n°1
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot470
	MOVLW       0
	XORWF       _option+0, 0 
L__ler_bot470:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot57
;TCC_5.c,478 :: 		if(prog==1)                                   //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot471
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot471:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot58
;TCC_5.c,480 :: 		num--;                                       //decrementa num
	MOVLW       1
	SUBWF       _num+0, 1 
	MOVLW       0
	SUBWFB      _num+1, 1 
;TCC_5.c,482 :: 		}
L_ler_bot58:
;TCC_5.c,483 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot472
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot472:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot59
;TCC_5.c,485 :: 		un = ~un;                                    //inverte un
	BTG         _un+0, BitPos(_un+0) 
;TCC_5.c,486 :: 		}
L_ler_bot59:
;TCC_5.c,487 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot473
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot473:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot60
;TCC_5.c,489 :: 		qtd_comp--;                                  //decrementa qtd_comp3
	MOVLW       1
	SUBWF       _qtd_comp+0, 1 
	MOVLW       0
	SUBWFB      _qtd_comp+1, 1 
;TCC_5.c,490 :: 		}
L_ler_bot60:
;TCC_5.c,492 :: 		if(qtd_comp<1) qtd_comp = 0x04;               //se quantidade de comprimidos passar de 1, retorna para 4
	MOVLW       0
	SUBWF       _qtd_comp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot474
	MOVLW       1
	SUBWF       _qtd_comp+0, 0 
L__ler_bot474:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot61
	MOVLW       4
	MOVWF       _qtd_comp+0 
	MOVLW       0
	MOVWF       _qtd_comp+1 
L_ler_bot61:
;TCC_5.c,493 :: 		if(num>24) num=24;                            //se o numero for maior que 24, vai para 24
	MOVLW       0
	MOVWF       R0 
	MOVF        _num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot475
	MOVF        _num+0, 0 
	SUBLW       24
L__ler_bot475:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot62
	MOVLW       24
	MOVWF       _num+0 
	MOVLW       0
	MOVWF       _num+1 
L_ler_bot62:
;TCC_5.c,494 :: 		}                                              //end if option==0
L_ler_bot57:
;TCC_5.c,496 :: 		if(option==1)                                  //dispenser n°2
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot476
	MOVLW       1
	XORWF       _option+0, 0 
L__ler_bot476:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot63
;TCC_5.c,498 :: 		if(prog==1)                                   //programação do número
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot477
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot477:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot64
;TCC_5.c,500 :: 		num2--;                                      //decrementa num2
	MOVLW       1
	SUBWF       _num2+0, 1 
	MOVLW       0
	SUBWFB      _num2+1, 1 
;TCC_5.c,502 :: 		}
L_ler_bot64:
;TCC_5.c,503 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot478
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot478:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot65
;TCC_5.c,505 :: 		un2 = ~un2;                                  //inverte un2
	BTG         _un2+0, BitPos(_un2+0) 
;TCC_5.c,506 :: 		}
L_ler_bot65:
;TCC_5.c,507 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot479
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot479:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot66
;TCC_5.c,509 :: 		qtd_comp2--;                                 //decrementa qtd_comp2
	MOVLW       1
	SUBWF       _qtd_comp2+0, 1 
	MOVLW       0
	SUBWFB      _qtd_comp2+1, 1 
;TCC_5.c,510 :: 		}
L_ler_bot66:
;TCC_5.c,512 :: 		if(qtd_comp2<1) qtd_comp2 = 0x04;             //se quantidade de comprimidos passar de 1, retorna para 4
	MOVLW       0
	SUBWF       _qtd_comp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot480
	MOVLW       1
	SUBWF       _qtd_comp2+0, 0 
L__ler_bot480:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot67
	MOVLW       4
	MOVWF       _qtd_comp2+0 
	MOVLW       0
	MOVWF       _qtd_comp2+1 
L_ler_bot67:
;TCC_5.c,513 :: 		if(num2>24) num2=24;                          //se o numero for maior que 24, vai para 24
	MOVLW       0
	MOVWF       R0 
	MOVF        _num2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot481
	MOVF        _num2+0, 0 
	SUBLW       24
L__ler_bot481:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot68
	MOVLW       24
	MOVWF       _num2+0 
	MOVLW       0
	MOVWF       _num2+1 
L_ler_bot68:
;TCC_5.c,515 :: 		}                                              //end if option==1
L_ler_bot63:
;TCC_5.c,517 :: 		if(option==2)                                  //dispenser n°3
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot482
	MOVLW       2
	XORWF       _option+0, 0 
L__ler_bot482:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot69
;TCC_5.c,519 :: 		if(prog==1)                                   //programação do número
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot483
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot483:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot70
;TCC_5.c,521 :: 		num3--;                                      //decrementa num3
	MOVLW       1
	SUBWF       _num3+0, 1 
	MOVLW       0
	SUBWFB      _num3+1, 1 
;TCC_5.c,523 :: 		}
L_ler_bot70:
;TCC_5.c,524 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot484
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot484:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot71
;TCC_5.c,526 :: 		un3 = ~un3;                                  //inverte un3
	BTG         _un3+0, BitPos(_un3+0) 
;TCC_5.c,527 :: 		}
L_ler_bot71:
;TCC_5.c,528 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot485
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot485:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot72
;TCC_5.c,530 :: 		qtd_comp3--;                                 //decrementa qtd_comp3
	MOVLW       1
	SUBWF       _qtd_comp3+0, 1 
	MOVLW       0
	SUBWFB      _qtd_comp3+1, 1 
;TCC_5.c,531 :: 		}
L_ler_bot72:
;TCC_5.c,533 :: 		if(qtd_comp3<1) qtd_comp3 = 0x04;             //se quantidade de comprimidos passar de 1, retorna para 4
	MOVLW       0
	SUBWF       _qtd_comp3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot486
	MOVLW       1
	SUBWF       _qtd_comp3+0, 0 
L__ler_bot486:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot73
	MOVLW       4
	MOVWF       _qtd_comp3+0 
	MOVLW       0
	MOVWF       _qtd_comp3+1 
L_ler_bot73:
;TCC_5.c,534 :: 		if(num3>24) num3=24;                          //se o numero for maior que 24, vai para 24
	MOVLW       0
	MOVWF       R0 
	MOVF        _num3+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot487
	MOVF        _num3+0, 0 
	SUBLW       24
L__ler_bot487:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot74
	MOVLW       24
	MOVWF       _num3+0 
	MOVLW       0
	MOVWF       _num3+1 
L_ler_bot74:
;TCC_5.c,536 :: 		}                                              //end if option==2
L_ler_bot69:
;TCC_5.c,538 :: 		if(option==3)                                  //dispenser n°4
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot488
	MOVLW       3
	XORWF       _option+0, 0 
L__ler_bot488:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot75
;TCC_5.c,540 :: 		if(prog==1)                                   //programação do número
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot489
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot489:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot76
;TCC_5.c,542 :: 		num4--;                                      //decrementa num4
	MOVLW       1
	SUBWF       _num4+0, 1 
	MOVLW       0
	SUBWFB      _num4+1, 1 
;TCC_5.c,544 :: 		}
L_ler_bot76:
;TCC_5.c,545 :: 		if (prog==2)                                  //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot490
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot490:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot77
;TCC_5.c,547 :: 		un4 = ~un4;                                  //inverte un4
	BTG         _un4+0, BitPos(_un4+0) 
;TCC_5.c,548 :: 		}
L_ler_bot77:
;TCC_5.c,549 :: 		if (prog==3)                                  //programação de quantidade de remédio
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot491
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot491:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot78
;TCC_5.c,551 :: 		qtd_comp4--;                                 //decrementa qtd_comp4
	MOVLW       1
	SUBWF       _qtd_comp4+0, 1 
	MOVLW       0
	SUBWFB      _qtd_comp4+1, 1 
;TCC_5.c,552 :: 		}
L_ler_bot78:
;TCC_5.c,554 :: 		if(qtd_comp4<1) qtd_comp4 = 0x04;             //se quantidade de comprimidos passar de 1, retorna para 4
	MOVLW       0
	SUBWF       _qtd_comp4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot492
	MOVLW       1
	SUBWF       _qtd_comp4+0, 0 
L__ler_bot492:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot79
	MOVLW       4
	MOVWF       _qtd_comp4+0 
	MOVLW       0
	MOVWF       _qtd_comp4+1 
L_ler_bot79:
;TCC_5.c,556 :: 		if(num4>24) num4=24;                          //se o numero for maior que 24, vai para 24
	MOVLW       0
	MOVWF       R0 
	MOVF        _num4+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot493
	MOVF        _num4+0, 0 
	SUBLW       24
L__ler_bot493:
	BTFSC       STATUS+0, 0 
	GOTO        L_ler_bot80
	MOVLW       24
	MOVWF       _num4+0 
	MOVLW       0
	MOVWF       _num4+1 
L_ler_bot80:
;TCC_5.c,558 :: 		}                                              //end if option==3
L_ler_bot75:
;TCC_5.c,560 :: 		comp  = qtd_comp;
	MOVF        _qtd_comp+0, 0 
	MOVWF       _comp+0 
	MOVF        _qtd_comp+1, 0 
	MOVWF       _comp+1 
;TCC_5.c,561 :: 		comp2 = qtd_comp2;
	MOVF        _qtd_comp2+0, 0 
	MOVWF       _comp2+0 
	MOVF        _qtd_comp2+1, 0 
	MOVWF       _comp2+1 
;TCC_5.c,562 :: 		comp3 = qtd_comp3;
	MOVF        _qtd_comp3+0, 0 
	MOVWF       _comp3+0 
	MOVF        _qtd_comp3+1, 0 
	MOVWF       _comp3+1 
;TCC_5.c,563 :: 		comp4 = qtd_comp4;                             //igualando as variaveis para despejar o numero certo de comprimidos
	MOVF        _qtd_comp4+0, 0 
	MOVWF       _comp4+0 
	MOVF        _qtd_comp4+1, 0 
	MOVWF       _comp4+1 
;TCC_5.c,565 :: 		}                                               //end if botão3 e b3_flag
L_ler_bot56:
;TCC_5.c,568 :: 		if(!BOTAO4) b4_flag=0x01;                       //se botão4 for pressionado, flag do botão4 = 1
	BTFSC       PORTC+0, 6 
	GOTO        L_ler_bot81
	BSF         _b4_flag+0, BitPos(_b4_flag+0) 
L_ler_bot81:
;TCC_5.c,570 :: 		if(BOTAO4 && b4_flag)                           //se botão4 for solto e flag do botão4 for 1
	BTFSS       PORTC+0, 6 
	GOTO        L_ler_bot84
	BTFSS       _b4_flag+0, BitPos(_b4_flag+0) 
	GOTO        L_ler_bot84
L__ler_bot388:
;TCC_5.c,572 :: 		LCD_Cmd(_LCD_CLEAR);                          //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,573 :: 		b4_flag    =  0x00;                           //limpa flag do botão4
	BCF         _b4_flag+0, BitPos(_b4_flag+0) 
;TCC_5.c,574 :: 		if(num!=0 || num2!=0 || num3!=0 || num4!=0)    //se num, num2, num3 ou num4 for diferente 0
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot494
	MOVLW       0
	XORWF       _num+0, 0 
L__ler_bot494:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot387
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot495
	MOVLW       0
	XORWF       _num2+0, 0 
L__ler_bot495:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot387
	MOVLW       0
	XORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot496
	MOVLW       0
	XORWF       _num3+0, 0 
L__ler_bot496:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot387
	MOVLW       0
	XORWF       _num4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot497
	MOVLW       0
	XORWF       _num4+0, 0 
L__ler_bot497:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot387
	GOTO        L_ler_bot87
L__ler_bot387:
;TCC_5.c,576 :: 		if(prog==0)                                   //se prog = 0
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot498
	MOVLW       0
	XORWF       _prog+0, 0 
L__ler_bot498:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot88
;TCC_5.c,578 :: 		if(!toque && !toque2 && !toque3 && !toque4)  //se nenhum contador tiver finalizado...
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L_ler_bot91
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_ler_bot91
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_ler_bot91
	BTFSC       _toque4+0, BitPos(_toque4+0) 
	GOTO        L_ler_bot91
L__ler_bot386:
;TCC_5.c,580 :: 		if(!ligar)                                  //se bit de ligar = 0 (desligado)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot92
;TCC_5.c,582 :: 		temp =0x00;                                //zera temp
	CLRF        _temp+0 
	CLRF        _temp+1 
;TCC_5.c,583 :: 		temp2=0x00;                                //zera temp2
	CLRF        _temp2+0 
	CLRF        _temp2+1 
;TCC_5.c,584 :: 		temp3=0x00;                                //zera temp3
	CLRF        _temp3+0 
	CLRF        _temp3+1 
;TCC_5.c,585 :: 		temp4=0x00;                                //zera temp4
	CLRF        _temp4+0 
	CLRF        _temp4+1 
;TCC_5.c,587 :: 		}                                           //end if !ligar
L_ler_bot92:
;TCC_5.c,588 :: 		ligar = ~ligar;                              //inverte ligar
	BTG         _ligar+0, BitPos(_ligar+0) 
;TCC_5.c,589 :: 		if(!ligar) display2 = 0x01;                  //se ligar for 0, bit display2 = 1
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot93
	BSF         _display2+0, BitPos(_display2+0) 
L_ler_bot93:
;TCC_5.c,591 :: 		}                                            //end if !toque && !toque2 && !toque3 && !toque4
L_ler_bot91:
;TCC_5.c,593 :: 		}                                             //end if prog==0
L_ler_bot88:
;TCC_5.c,595 :: 		}                                              //end if num!=0 || num2!=0 ||num3!=0 || num4!=0
L_ler_bot87:
;TCC_5.c,597 :: 		}                                               //end if BOTAO4 && b4_flag
L_ler_bot84:
;TCC_5.c,599 :: 		if(!un)                                         //se un = 0
	BTFSC       _un+0, BitPos(_un+0) 
	GOTO        L_ler_bot94
;TCC_5.c,601 :: 		mult = num * 1;                                //mult é num * 3600 (hora)
	MOVF        _num+0, 0 
	MOVWF       _mult+0 
	MOVF        _num+1, 0 
	MOVWF       _mult+1 
;TCC_5.c,602 :: 		}
L_ler_bot94:
;TCC_5.c,603 :: 		if(un)                                          //se un = 1
	BTFSS       _un+0, BitPos(_un+0) 
	GOTO        L_ler_bot95
;TCC_5.c,605 :: 		mult = num * 5;                                //mult é num * 86400 (dia)
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
;TCC_5.c,606 :: 		}
L_ler_bot95:
;TCC_5.c,608 :: 		if(!un2)                                        //se un2 = 0
	BTFSC       _un2+0, BitPos(_un2+0) 
	GOTO        L_ler_bot96
;TCC_5.c,610 :: 		mult2 = num2 * 1;                              //mult2 é num2 * 3600 (hora)
	MOVF        _num2+0, 0 
	MOVWF       _mult2+0 
	MOVF        _num2+1, 0 
	MOVWF       _mult2+1 
;TCC_5.c,611 :: 		}
L_ler_bot96:
;TCC_5.c,612 :: 		if(un2)                                         //se un2 = 1
	BTFSS       _un2+0, BitPos(_un2+0) 
	GOTO        L_ler_bot97
;TCC_5.c,614 :: 		mult2 = num2 * 5;                              //mult2 é num2 * 86400 (dia)
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
;TCC_5.c,615 :: 		}
L_ler_bot97:
;TCC_5.c,617 :: 		if(!un3)                                        //se un3 = 0
	BTFSC       _un3+0, BitPos(_un3+0) 
	GOTO        L_ler_bot98
;TCC_5.c,619 :: 		mult3 = num3 * 1;                              //mult3 é num3 * 3600 (hora)
	MOVF        _num3+0, 0 
	MOVWF       _mult3+0 
	MOVF        _num3+1, 0 
	MOVWF       _mult3+1 
;TCC_5.c,620 :: 		}
L_ler_bot98:
;TCC_5.c,621 :: 		if(un3)                                         //se un3 = 1
	BTFSS       _un3+0, BitPos(_un3+0) 
	GOTO        L_ler_bot99
;TCC_5.c,623 :: 		mult3 = num3 * 5;                              //mult3 é num3 * 86400 (dia)
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
;TCC_5.c,624 :: 		}
L_ler_bot99:
;TCC_5.c,626 :: 		if(!un4)                                        //se un4 = 0
	BTFSC       _un4+0, BitPos(_un4+0) 
	GOTO        L_ler_bot100
;TCC_5.c,628 :: 		mult4 = num4 * 1;                              //mult4 é num4 * 3600 (hora)
	MOVF        _num4+0, 0 
	MOVWF       _mult4+0 
	MOVF        _num4+1, 0 
	MOVWF       _mult4+1 
;TCC_5.c,629 :: 		}
L_ler_bot100:
;TCC_5.c,630 :: 		if(un4)                                         //se un4 = 1
	BTFSS       _un4+0, BitPos(_un4+0) 
	GOTO        L_ler_bot101
;TCC_5.c,632 :: 		mult4 = num4 * 5;                              //mult4 é num4 * 86400 (dia)
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
;TCC_5.c,633 :: 		}
L_ler_bot101:
;TCC_5.c,636 :: 		if(!BOTAO5)
	BTFSC       PORTC+0, 7 
	GOTO        L_ler_bot102
;TCC_5.c,638 :: 		b5_flag = 0x01;                                //se botão5 for pressionado, flag do botão5 = 1
	BSF         _b5_flag+0, BitPos(_b5_flag+0) 
;TCC_5.c,639 :: 		luz_lcd();                                     //executa a função de controle da luminosidade do display
	CALL        _luz_lcd+0, 0
;TCC_5.c,641 :: 		}                                               //end if !BOTAO5
L_ler_bot102:
;TCC_5.c,643 :: 		if(BOTAO5 && b5_flag)                           //se botão5 for solto e flag do botão5 for 1
	BTFSS       PORTC+0, 7 
	GOTO        L_ler_bot105
	BTFSS       _b5_flag+0, BitPos(_b5_flag+0) 
	GOTO        L_ler_bot105
L__ler_bot385:
;TCC_5.c,645 :: 		LCD_Cmd(_LCD_CLEAR);                           //limpa LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,646 :: 		b5_flag = 0x00;                                //limpa flag do botão5
	BCF         _b5_flag+0, BitPos(_b5_flag+0) 
;TCC_5.c,647 :: 		if(!block_cmd)                                 //se bloqueio desativado
	BTFSC       _block_cmd+0, BitPos(_block_cmd+0) 
	GOTO        L_ler_bot106
;TCC_5.c,649 :: 		if(prog != 0)                                 //se prog for diferente de 0
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot499
	MOVLW       0
	XORWF       _prog+0, 0 
L__ler_bot499:
	BTFSC       STATUS+0, 2 
	GOTO        L_ler_bot107
;TCC_5.c,651 :: 		option++;                                    //incrementa option
	INFSNZ      _option+0, 1 
	INCF        _option+1, 1 
;TCC_5.c,652 :: 		if(option == 4) option=0x00;                 //se option for 4, option = 0
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot500
	MOVLW       4
	XORWF       _option+0, 0 
L__ler_bot500:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot108
	CLRF        _option+0 
	CLRF        _option+1 
L_ler_bot108:
;TCC_5.c,653 :: 		}
L_ler_bot107:
;TCC_5.c,654 :: 		}                                              //end if !block_cmd
L_ler_bot106:
;TCC_5.c,656 :: 		if(toque || toque2 || toque3 || toque4)      //se algum comando do SOM estiver ativado...
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L__ler_bot384
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L__ler_bot384
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L__ler_bot384
	BTFSC       _toque4+0, BitPos(_toque4+0) 
	GOTO        L__ler_bot384
	GOTO        L_ler_bot111
L__ler_bot384:
;TCC_5.c,658 :: 		if(toque)temp_ligado=0x00;                   //se for o toque 1, zera o contador 1
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_ler_bot112
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
L_ler_bot112:
;TCC_5.c,659 :: 		if(toque2)temp_ligado2=0x00;                 //se for o toque 2, zera o contador 2
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_ler_bot113
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
L_ler_bot113:
;TCC_5.c,660 :: 		if(toque3)temp_ligado3=0x00;                 //se for o toque 3, zera o contador 3
	BTFSS       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_ler_bot114
	CLRF        _temp_ligado3+0 
	CLRF        _temp_ligado3+1 
L_ler_bot114:
;TCC_5.c,661 :: 		if(toque4)temp_ligado4=0x00;                 //se for o toque 4, zera o contador 4
	BTFSS       _toque4+0, BitPos(_toque4+0) 
	GOTO        L_ler_bot115
	CLRF        _temp_ligado4+0 
	CLRF        _temp_ligado4+1 
L_ler_bot115:
;TCC_5.c,662 :: 		toque =0x00;
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,663 :: 		toque2=0x00;
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,664 :: 		toque3=0x00;
	BCF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,665 :: 		toque4=0x00;                                //zera todos os bits de SOM
	BCF         _toque4+0, BitPos(_toque4+0) 
;TCC_5.c,666 :: 		SOM=0x00;
	BCF         PORTB+0, 4 
;TCC_5.c,668 :: 		}                                            //end if toque || toque2 || toque3 || toque4
L_ler_bot111:
;TCC_5.c,671 :: 		block_cmd = 0x00;                              //desativa o bloqueio
	BCF         _block_cmd+0, BitPos(_block_cmd+0) 
;TCC_5.c,672 :: 		temp_lcd = 0x00;                               //zera o temp_lcd
	CLRF        _temp_lcd+0 
	CLRF        _temp_lcd+1 
;TCC_5.c,673 :: 		}                                               //end if BOTAO5 && b5_flag
L_ler_bot105:
;TCC_5.c,675 :: 		}                                                 //end ler_bot()
L_end_ler_bot:
	RETURN      0
; end of _ler_bot

_fast_incr:

;TCC_5.c,681 :: 		void fast_incr()
;TCC_5.c,683 :: 		if(temp_inc>7)temp_inc=0x00;                     //se temp_inc maior que 7, zera temp_inc
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_inc+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr502
	MOVF        _temp_inc+0, 0 
	SUBLW       7
L__fast_incr502:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr116
	CLRF        _temp_inc+0 
	CLRF        _temp_inc+1 
L_fast_incr116:
;TCC_5.c,684 :: 		if(temp_inc==7)                                  //conta 700ms...
	MOVLW       0
	XORWF       _temp_inc+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr503
	MOVLW       7
	XORWF       _temp_inc+0, 0 
L__fast_incr503:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr117
;TCC_5.c,686 :: 		temp_inc=0x00;                                  //zera temp_inc
	CLRF        _temp_inc+0 
	CLRF        _temp_inc+1 
;TCC_5.c,687 :: 		fast_inc=0x01;                                  //ativa fast_inc
	MOVLW       1
	MOVWF       _fast_inc+0 
	MOVLW       0
	MOVWF       _fast_inc+1 
;TCC_5.c,688 :: 		}                                                //end if temp_inc==7
L_fast_incr117:
;TCC_5.c,690 :: 		if(fast_inc)                                     //se fast_inc for ativado...
	MOVF        _fast_inc+0, 0 
	IORWF       _fast_inc+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_fast_incr118
;TCC_5.c,692 :: 		if(option==0 && prog==1)                        //se dispenser n°1 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr504
	MOVLW       0
	XORWF       _option+0, 0 
L__fast_incr504:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr121
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr505
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr505:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr121
L__fast_incr395:
;TCC_5.c,694 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr506
	MOVF        _temp_num+0, 0 
	SUBLW       5
L__fast_incr506:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr122
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr122:
;TCC_5.c,695 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr507
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr507:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr123
;TCC_5.c,697 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,698 :: 		num += 2;                                     //acrescenta 2 em num
	MOVLW       2
	ADDWF       _num+0, 1 
	MOVLW       0
	ADDWFC      _num+1, 1 
;TCC_5.c,700 :: 		}                                              //end if temp_num==5
L_fast_incr123:
;TCC_5.c,702 :: 		}                                               //end if option==0 && prog=1
L_fast_incr121:
;TCC_5.c,705 :: 		if(option==1 && prog==1)                        //se dispenser n°2 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr508
	MOVLW       1
	XORWF       _option+0, 0 
L__fast_incr508:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr126
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr509
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr509:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr126
L__fast_incr394:
;TCC_5.c,707 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr510
	MOVF        _temp_num+0, 0 
	SUBLW       5
L__fast_incr510:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr127
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr127:
;TCC_5.c,708 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr511
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr511:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr128
;TCC_5.c,710 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,711 :: 		num2 += 2;                                    //acrescenta 2 em num2
	MOVLW       2
	ADDWF       _num2+0, 1 
	MOVLW       0
	ADDWFC      _num2+1, 1 
;TCC_5.c,713 :: 		}                                              //end if temp_num==5
L_fast_incr128:
;TCC_5.c,715 :: 		}                                               //end if option==1 && prog=1
L_fast_incr126:
;TCC_5.c,717 :: 		if(option==2 && prog==1)                       //se dispenser n°3 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr512
	MOVLW       2
	XORWF       _option+0, 0 
L__fast_incr512:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr131
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr513
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr513:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr131
L__fast_incr393:
;TCC_5.c,719 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr514
	MOVF        _temp_num+0, 0 
	SUBLW       5
L__fast_incr514:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr132
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr132:
;TCC_5.c,720 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr515
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr515:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr133
;TCC_5.c,722 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,723 :: 		num3 += 2;                                    //acrescenta 2 em num3
	MOVLW       2
	ADDWF       _num3+0, 1 
	MOVLW       0
	ADDWFC      _num3+1, 1 
;TCC_5.c,725 :: 		}                                              //end if temp_num==5
L_fast_incr133:
;TCC_5.c,727 :: 		}                                               //end if option==2 && prog=1
L_fast_incr131:
;TCC_5.c,729 :: 		if(option==3 && prog==1)                       //se dispenser n°4 selecionado e programção de número
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr516
	MOVLW       3
	XORWF       _option+0, 0 
L__fast_incr516:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr136
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr517
	MOVLW       1
	XORWF       _prog+0, 0 
L__fast_incr517:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr136
L__fast_incr392:
;TCC_5.c,731 :: 		if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr518
	MOVF        _temp_num+0, 0 
	SUBLW       5
L__fast_incr518:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr137
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
L_fast_incr137:
;TCC_5.c,732 :: 		if(temp_num==5)                                //conta 500ms...
	MOVLW       0
	XORWF       _temp_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr519
	MOVLW       5
	XORWF       _temp_num+0, 0 
L__fast_incr519:
	BTFSS       STATUS+0, 2 
	GOTO        L_fast_incr138
;TCC_5.c,734 :: 		temp_num=0x00;                                //zera temp_num
	CLRF        _temp_num+0 
	CLRF        _temp_num+1 
;TCC_5.c,735 :: 		num4 += 2;                                    //acrescenta 2 em num4
	MOVLW       2
	ADDWF       _num4+0, 1 
	MOVLW       0
	ADDWFC      _num4+1, 1 
;TCC_5.c,737 :: 		}                                              //end if temp_num==5
L_fast_incr138:
;TCC_5.c,739 :: 		}                                               //end if option==3 && prog=1
L_fast_incr136:
;TCC_5.c,741 :: 		if(num >24) num =0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr520
	MOVF        _num+0, 0 
	SUBLW       24
L__fast_incr520:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr139
	CLRF        _num+0 
	CLRF        _num+1 
L_fast_incr139:
;TCC_5.c,742 :: 		if(num2>24) num2=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr521
	MOVF        _num2+0, 0 
	SUBLW       24
L__fast_incr521:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr140
	CLRF        _num2+0 
	CLRF        _num2+1 
L_fast_incr140:
;TCC_5.c,743 :: 		if(num3>24) num3=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num3+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr522
	MOVF        _num3+0, 0 
	SUBLW       24
L__fast_incr522:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr141
	CLRF        _num3+0 
	CLRF        _num3+1 
L_fast_incr141:
;TCC_5.c,744 :: 		if(num4>24) num4=0x00;                          //se o numero passar de 24, retorna para 0
	MOVLW       0
	MOVWF       R0 
	MOVF        _num4+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__fast_incr523
	MOVF        _num4+0, 0 
	SUBLW       24
L__fast_incr523:
	BTFSC       STATUS+0, 0 
	GOTO        L_fast_incr142
	CLRF        _num4+0 
	CLRF        _num4+1 
L_fast_incr142:
;TCC_5.c,746 :: 		}                                                //end if fast_inc
L_fast_incr118:
;TCC_5.c,751 :: 		}                                                 //end void fast_incr()
L_end_fast_incr:
	RETURN      0
; end of _fast_incr

_luz_lcd:

;TCC_5.c,757 :: 		void luz_lcd()
;TCC_5.c,759 :: 		if(temp_lcd > 15)  temp_lcd = 0x00;
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_lcd+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__luz_lcd525
	MOVF        _temp_lcd+0, 0 
	SUBLW       15
L__luz_lcd525:
	BTFSC       STATUS+0, 0 
	GOTO        L_luz_lcd143
	CLRF        _temp_lcd+0 
	CLRF        _temp_lcd+1 
L_luz_lcd143:
;TCC_5.c,760 :: 		if(temp_lcd == 15)                               //se o botão for segurado por ~= 1500ms
	MOVLW       0
	XORWF       _temp_lcd+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__luz_lcd526
	MOVLW       15
	XORWF       _temp_lcd+0, 0 
L__luz_lcd526:
	BTFSS       STATUS+0, 2 
	GOTO        L_luz_lcd144
;TCC_5.c,762 :: 		LCD_LED  = ~LCD_LED;                            //inverte a saída do LED do LCD
	BTG         PORTC+0, 2 
;TCC_5.c,763 :: 		temp_lcd = 0x00;                                //zera o temp_lcd
	CLRF        _temp_lcd+0 
	CLRF        _temp_lcd+1 
;TCC_5.c,764 :: 		block_cmd = 0x01;                               //bloqueia a ação do botão
	BSF         _block_cmd+0, BitPos(_block_cmd+0) 
;TCC_5.c,766 :: 		}                                                //end if temp_lcd
L_luz_lcd144:
;TCC_5.c,768 :: 		}                                                 //end void luz_lcd
L_end_luz_lcd:
	RETURN      0
; end of _luz_lcd

_disp:

;TCC_5.c,773 :: 		void disp()
;TCC_5.c,775 :: 		if(!ligar && prog==0)                           //se ligar for 0 e prog for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_disp147
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp528
	MOVLW       0
	XORWF       _prog+0, 0 
L__disp528:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp147
L__disp399:
;TCC_5.c,777 :: 		if(SM) SM   = 0x00;
	BTFSS       PORTB+0, 0 
	GOTO        L_disp148
	BCF         PORTB+0, 0 
L_disp148:
;TCC_5.c,778 :: 		if(SM2)SM2  = 0x00;
	BTFSS       PORTB+0, 1 
	GOTO        L_disp149
	BCF         PORTB+0, 1 
L_disp149:
;TCC_5.c,779 :: 		if(SM3)SM3  = 0x00;
	BTFSS       PORTB+0, 3 
	GOTO        L_disp150
	BCF         PORTB+0, 3 
L_disp150:
;TCC_5.c,780 :: 		if(SM4)SM4  = 0x00;
	BTFSS       PORTB+0, 2 
	GOTO        L_disp151
	BCF         PORTB+0, 2 
L_disp151:
;TCC_5.c,781 :: 		if(!display && !display2)                      //se os bits diplay e display2 forem 0
	BTFSC       _display+0, BitPos(_display+0) 
	GOTO        L_disp154
	BTFSC       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp154
L__disp398:
;TCC_5.c,783 :: 		LCD_Out(1,1,"  DISPENSER DE  ");             //exibe "DISPENSER DE"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,784 :: 		LCD_Out(2,1,"    REMEDIOS    ");             //      "  REMEDIOS  "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,786 :: 		}
	GOTO        L_disp155
L_disp154:
;TCC_5.c,789 :: 		if(display && !display2)                      //se bits display for 1 e display2 for 0
	BTFSS       _display+0, BitPos(_display+0) 
	GOTO        L_disp158
	BTFSC       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp158
L__disp397:
;TCC_5.c,791 :: 		display=0x00;                                //limpa bit display
	BCF         _display+0, BitPos(_display+0) 
;TCC_5.c,792 :: 		LCD_Out(1,1,"ETEC LAURO GOMES");             //exibe "ETEC LAURO GOMES"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,793 :: 		LCD_Out(2,1,"  3A MECA 2021  ");             //      "  3A MECA 2021  "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,794 :: 		delay_ms(1000);                              //espera 1 segundo
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_disp159:
	DECFSZ      R13, 1, 1
	BRA         L_disp159
	DECFSZ      R12, 1, 1
	BRA         L_disp159
	DECFSZ      R11, 1, 1
	BRA         L_disp159
	NOP
	NOP
;TCC_5.c,795 :: 		}
L_disp158:
;TCC_5.c,796 :: 		if(!display && display2)                      //se os bits display for 0 e display2 for 1
	BTFSC       _display+0, BitPos(_display+0) 
	GOTO        L_disp162
	BTFSS       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp162
L__disp396:
;TCC_5.c,798 :: 		display2=0x00;                               //limpa bit display2
	BCF         _display2+0, BitPos(_display2+0) 
;TCC_5.c,799 :: 		LCD_Out(1,1,"     PARANDO    ");             //exibe "     PARANDO    "
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,800 :: 		LCD_Out(2,1,"     CONTAGEM   ");             //      "     CONTAGEM   "
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,801 :: 		delay_ms(1000);                              //espera 1 segundo
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_disp163:
	DECFSZ      R13, 1, 1
	BRA         L_disp163
	DECFSZ      R12, 1, 1
	BRA         L_disp163
	DECFSZ      R11, 1, 1
	BRA         L_disp163
	NOP
	NOP
;TCC_5.c,802 :: 		}
L_disp162:
;TCC_5.c,803 :: 		}                                              //end else
L_disp155:
;TCC_5.c,804 :: 		}                                               //end if !ligar && prog==0
L_disp147:
;TCC_5.c,806 :: 		if(prog==1)                                     //programação de numeros
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp529
	MOVLW       1
	XORWF       _prog+0, 0 
L__disp529:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp164
;TCC_5.c,808 :: 		LCD_Out(1,1,"PROGRAME NUMERO:");               //exibe "PROGRAME NUMERO:
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,809 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,810 :: 		if(option==0) LCD_Chr(2,1,'1');               //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp530
	MOVLW       0
	XORWF       _option+0, 0 
L__disp530:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp165
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp165:
;TCC_5.c,811 :: 		if(option==1) LCD_Chr(2,1,'2');               //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp531
	MOVLW       1
	XORWF       _option+0, 0 
L__disp531:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp166
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp166:
;TCC_5.c,812 :: 		if(option==2) LCD_Chr(2,1,'3');               //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp532
	MOVLW       2
	XORWF       _option+0, 0 
L__disp532:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp167
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp167:
;TCC_5.c,813 :: 		if(option==3) LCD_Chr(2,1,'4');               //se option for 2, exibe "4"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp533
	MOVLW       3
	XORWF       _option+0, 0 
L__disp533:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp168
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       52
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp168:
;TCC_5.c,814 :: 		}
L_disp164:
;TCC_5.c,816 :: 		if(prog==2)                                     //se prog for 2
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp534
	MOVLW       2
	XORWF       _prog+0, 0 
L__disp534:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp169
;TCC_5.c,818 :: 		LCD_Out(1,1,"PROGRAME Un.:");                  //exibe "PROGRAME Un.:"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,819 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,820 :: 		if(option==0) LCD_Chr(2,1,'1');               //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp535
	MOVLW       0
	XORWF       _option+0, 0 
L__disp535:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp170
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp170:
;TCC_5.c,821 :: 		if(option==1) LCD_Chr(2,1,'2');               //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp536
	MOVLW       1
	XORWF       _option+0, 0 
L__disp536:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp171
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp171:
;TCC_5.c,822 :: 		if(option==2) LCD_Chr(2,1,'3');               //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp537
	MOVLW       2
	XORWF       _option+0, 0 
L__disp537:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp172
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp172:
;TCC_5.c,823 :: 		if(option==3) LCD_Chr(2,1,'4');               //se option for 2, exibe "4"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp538
	MOVLW       3
	XORWF       _option+0, 0 
L__disp538:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp173
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       52
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp173:
;TCC_5.c,824 :: 		}
L_disp169:
;TCC_5.c,826 :: 		if(prog==3)                                     //programação de quantidade de comprimidos
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp539
	MOVLW       3
	XORWF       _prog+0, 0 
L__disp539:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp174
;TCC_5.c,828 :: 		LCD_Out(1,1,"Qtd. COMPRIMIDOS");               //exibe "Qtd. COMPRIMIDOS"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,829 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,830 :: 		if(option==0) LCD_Chr(2,1,'1');               //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp540
	MOVLW       0
	XORWF       _option+0, 0 
L__disp540:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp175
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp175:
;TCC_5.c,831 :: 		if(option==1) LCD_Chr(2,1,'2');               //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp541
	MOVLW       1
	XORWF       _option+0, 0 
L__disp541:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp176
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp176:
;TCC_5.c,832 :: 		if(option==2) LCD_Chr(2,1,'3');               //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp542
	MOVLW       2
	XORWF       _option+0, 0 
L__disp542:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp177
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp177:
;TCC_5.c,833 :: 		if(option==3) LCD_Chr(2,1,'4');               //se option for 2, exibe "4"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp543
	MOVLW       3
	XORWF       _option+0, 0 
L__disp543:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp178
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       52
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp178:
;TCC_5.c,834 :: 		}
L_disp174:
;TCC_5.c,836 :: 		if(ligar)                                       //se ligar for 1 (ligado)
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_disp179
;TCC_5.c,838 :: 		LCD_Out(1,1,"DISP  TEMPO  Qtd");               //exibe "CONTANDO:   DISP";
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,839 :: 		if(temp_disp>20) temp_disp=0x00;               //se temp_disp for maior que 20, zera temp_disp
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_disp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp544
	MOVF        _temp_disp+0, 0 
	SUBLW       20
L__disp544:
	BTFSC       STATUS+0, 0 
	GOTO        L_disp180
	CLRF        _temp_disp+0 
	CLRF        _temp_disp+1 
L_disp180:
;TCC_5.c,840 :: 		if(temp_disp == 20)                            //se temp_disp for 20 (2 segundos)
	MOVLW       0
	XORWF       _temp_disp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp545
	MOVLW       20
	XORWF       _temp_disp+0, 0 
L__disp545:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp181
;TCC_5.c,842 :: 		temp_disp=0x00;                               //zera temp_disp
	CLRF        _temp_disp+0 
	CLRF        _temp_disp+1 
;TCC_5.c,843 :: 		option++;                                     //incrementa option
	INFSNZ      _option+0, 1 
	INCF        _option+1, 1 
;TCC_5.c,844 :: 		if(option == 4) option=0x00;                  //se option for 3, option = 0
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp546
	MOVLW       4
	XORWF       _option+0, 0 
L__disp546:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp182
	CLRF        _option+0 
	CLRF        _option+1 
L_disp182:
;TCC_5.c,845 :: 		if(option==0) LCD_Chr(2,1,'1');              //se option for 0, exibe "1"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp547
	MOVLW       0
	XORWF       _option+0, 0 
L__disp547:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp183
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp183:
;TCC_5.c,846 :: 		if(option==1) LCD_Chr(2,1,'2');              //se option for 1, exibe "2"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp548
	MOVLW       1
	XORWF       _option+0, 0 
L__disp548:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp184
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp184:
;TCC_5.c,847 :: 		if(option==2) LCD_Chr(2,1,'3');              //se option for 2, exibe "3"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp549
	MOVLW       2
	XORWF       _option+0, 0 
L__disp549:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp185
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       51
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp185:
;TCC_5.c,848 :: 		if(option==3) LCD_Chr(2,1,'4');              //se option for 2, exibe "4"
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp550
	MOVLW       3
	XORWF       _option+0, 0 
L__disp550:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp186
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       52
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp186:
;TCC_5.c,849 :: 		}
L_disp181:
;TCC_5.c,850 :: 		num_un();                                      //executa num_un
	CALL        _num_un+0, 0
;TCC_5.c,851 :: 		}
L_disp179:
;TCC_5.c,853 :: 		}                                                 //end disp()
L_end_disp:
	RETURN      0
; end of _disp

_num_un:

;TCC_5.c,859 :: 		void num_un()
;TCC_5.c,863 :: 		if(option==0)                                    //se option for 0 (dispenser n° 1 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un552
	MOVLW       0
	XORWF       _option+0, 0 
L__num_un552:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un187
;TCC_5.c,865 :: 		dig2 = num/10;                                  //dígito 2 é igual a num dividido por 10
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
;TCC_5.c,866 :: 		dig1 = num%10;                                  //digito 1 é igual a sobra da divisão de num por 10
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
;TCC_5.c,871 :: 		if(!un) LCD_Out(2,10,hora);                      //se un for zero, exibe "hora"
	BTFSC       _un+0, BitPos(_un+0) 
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
;TCC_5.c,873 :: 		if(un) LCD_Out(2,10,dia);                        //se un for um, exibe "dia"
	BTFSS       _un+0, BitPos(_un+0) 
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
;TCC_5.c,875 :: 		}                                                //end if option==0
L_num_un187:
;TCC_5.c,878 :: 		if(option==1)                                    //se option for 1 (dispenser n°2 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un553
	MOVLW       1
	XORWF       _option+0, 0 
L__num_un553:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un190
;TCC_5.c,880 :: 		dig2 = num2/10;                                 //digito 2 é igual a num2 dividido por 10
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
;TCC_5.c,881 :: 		dig1 = num2%10;                                 //digito 1 é igual a sobra da divisão de num2 por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,883 :: 		LCD_Chr(2,7,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,884 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,886 :: 		if(!un2) LCD_Out(2,10,hora);                     //se un2 for zero, exibe "hora"
	BTFSC       _un2+0, BitPos(_un2+0) 
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
;TCC_5.c,888 :: 		if(un2) LCD_Out(2,10,dia);                       //se un2 for um, exibe "dia"
	BTFSS       _un2+0, BitPos(_un2+0) 
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
;TCC_5.c,890 :: 		}                                                //end if option==1
L_num_un190:
;TCC_5.c,892 :: 		if(option==2)                                    //se option for 2 (dispenser n°3 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un554
	MOVLW       2
	XORWF       _option+0, 0 
L__num_un554:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un193
;TCC_5.c,894 :: 		dig2 = num3/10;                                 //digito 2 é igual a num3 dividido por 10
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
;TCC_5.c,895 :: 		dig1 = num3%10;                                 //digito 1 é igual a sobra da divisão de num3 por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,897 :: 		LCD_Chr(2,7,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,898 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,900 :: 		if(!un3) LCD_Out(2,10,hora);                     //se un3 for zero, exibe "hora"
	BTFSC       _un3+0, BitPos(_un3+0) 
	GOTO        L_num_un194
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un194:
;TCC_5.c,902 :: 		if(un3) LCD_Out(2,10,dia);                       //se un3 for um, exibe "dia"
	BTFSS       _un3+0, BitPos(_un3+0) 
	GOTO        L_num_un195
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un195:
;TCC_5.c,904 :: 		}                                                //end if option==2
L_num_un193:
;TCC_5.c,906 :: 		if(option==3)                                    //se option for 3 (dispenser n°4 selecionado)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un555
	MOVLW       3
	XORWF       _option+0, 0 
L__num_un555:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un196
;TCC_5.c,908 :: 		dig2 = num4/10;                                 //digito 2 é igual a num4 dividido por 10
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
;TCC_5.c,909 :: 		dig1 = num4%10;                                 //digito 1 é igual a sobra da divisão de num4 por 10
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,911 :: 		LCD_Chr(2,7,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,912 :: 		LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,914 :: 		if(!un4) LCD_Out(2,10,hora);                     //se u4 for zero, exibe "hora"
	BTFSC       _un4+0, BitPos(_un4+0) 
	GOTO        L_num_un197
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un197:
;TCC_5.c,916 :: 		if(un4) LCD_Out(2,10,dia);                       //se un4 for um, exibe "dia"
	BTFSS       _un4+0, BitPos(_un4+0) 
	GOTO        L_num_un198
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un198:
;TCC_5.c,918 :: 		}                                                //end if option==3
L_num_un196:
;TCC_5.c,921 :: 		if(option==0)                                   //se dispenser n°1 selecionado
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un556
	MOVLW       0
	XORWF       _option+0, 0 
L__num_un556:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un199
;TCC_5.c,924 :: 		LCD_Chr(2,15,digcomp+0x30);                    //soma digito 1 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _qtd_comp+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,925 :: 		}
L_num_un199:
;TCC_5.c,927 :: 		if(option==1)                                   //se dispenser n°2 selecionado
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un557
	MOVLW       1
	XORWF       _option+0, 0 
L__num_un557:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un200
;TCC_5.c,930 :: 		LCD_Chr(2,15,digcomp+0x30);                    //soma digito 1 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _qtd_comp2+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,931 :: 		}
L_num_un200:
;TCC_5.c,933 :: 		if(option==2)                                   //se dispenser n°3 selecionado
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un558
	MOVLW       2
	XORWF       _option+0, 0 
L__num_un558:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un201
;TCC_5.c,936 :: 		LCD_Chr(2,15,digcomp+0x30);                    //soma digito 1 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _qtd_comp3+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,937 :: 		}
L_num_un201:
;TCC_5.c,939 :: 		if(option==3)                                   //se dispenser n°4 selecionado
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un559
	MOVLW       3
	XORWF       _option+0, 0 
L__num_un559:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un202
;TCC_5.c,942 :: 		LCD_Chr(2,15,digcomp+0x30);                    //soma digito 1 com 30 hexa para exibição no display
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       _qtd_comp4+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,943 :: 		}
L_num_un202:
;TCC_5.c,946 :: 		}                                                 //end num_un()
L_end_num_un:
	RETURN      0
; end of _num_un

_piscaLED:

;TCC_5.c,952 :: 		void piscaLED()
;TCC_5.c,955 :: 		if(ligar && !toque && num!=0)                   //se ligar for um(ligado), toque for zero e num diferente de zero...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED205
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L_piscaLED205
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED561
	MOVLW       0
	XORWF       _num+0, 0 
L__piscaLED561:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED205
L__piscaLED411:
;TCC_5.c,957 :: 		if(temp_led>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED562
	MOVLW       10
	SUBWF       _temp_led+0, 0 
L__piscaLED562:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED206
;TCC_5.c,959 :: 		temp_led = 0x00;                      //zera temp_led
	CLRF        _temp_led+0 
	CLRF        _temp_led+1 
;TCC_5.c,960 :: 		LED  = ~LED;                          //inverte LED de indicação do dispenser n°1
	BTG         PORTA+0, 3 
;TCC_5.c,961 :: 		}                                              //end if temp_led>=10
L_piscaLED206:
;TCC_5.c,963 :: 		}                                               //end if ligar && !toque && num!=0
	GOTO        L_piscaLED207
L_piscaLED205:
;TCC_5.c,967 :: 		if(ligar && toque)                             //se ligar for 1 e toque for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED210
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_piscaLED210
L__piscaLED410:
;TCC_5.c,969 :: 		if(temp_led>=2)                               //conta 200ms
	MOVLW       0
	SUBWF       _temp_led+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED563
	MOVLW       2
	SUBWF       _temp_led+0, 0 
L__piscaLED563:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED211
;TCC_5.c,971 :: 		temp_led=0x00;                               //zera temp_led
	CLRF        _temp_led+0 
	CLRF        _temp_led+1 
;TCC_5.c,972 :: 		LED = ~LED;                                  //inverte LED de indicação do dispenser n°1
	BTG         PORTA+0, 3 
;TCC_5.c,974 :: 		}                                             //end if temp_led>=2
L_piscaLED211:
;TCC_5.c,976 :: 		}                                              //end if ligar && toque
	GOTO        L_piscaLED212
L_piscaLED210:
;TCC_5.c,979 :: 		if(prog>0 && option==0)                       //se estiver em programação e dispenser n°1 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED564
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED564:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED215
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED565
	MOVLW       0
	XORWF       _option+0, 0 
L__piscaLED565:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED215
L__piscaLED409:
;TCC_5.c,981 :: 		LED = 0x01;                                  //LED do dispenser n°1 aceso
	BSF         PORTA+0, 3 
;TCC_5.c,982 :: 		}                                             //end if prog>0 && option==0
	GOTO        L_piscaLED216
L_piscaLED215:
;TCC_5.c,984 :: 		else LED = 0x00;                              //senão, LED do dispenser n°1 desligado
	BCF         PORTA+0, 3 
L_piscaLED216:
;TCC_5.c,986 :: 		}                                              //end else
L_piscaLED212:
;TCC_5.c,988 :: 		}                                               //end else
L_piscaLED207:
;TCC_5.c,992 :: 		if(temp_led2 ==5)                                //conta 500ms
	MOVLW       0
	XORWF       _temp_led2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED566
	MOVLW       5
	XORWF       _temp_led2+0, 0 
L__piscaLED566:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED217
;TCC_5.c,994 :: 		temp_led2=0x00;                                 //zera temp_led2
	CLRF        _temp_led2+0 
	CLRF        _temp_led2+1 
;TCC_5.c,995 :: 		LED2 = ~LED2;                                   //inverte estado do LED de indicação geral
	BTG         PORTA+0, 0 
;TCC_5.c,997 :: 		}                                                //end if temp_led==5
L_piscaLED217:
;TCC_5.c,999 :: 		if(ligar && !toque2 && num2!=0)                  //se ligar for 1, toque 2 for 0 e num2 diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED220
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_piscaLED220
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED567
	MOVLW       0
	XORWF       _num2+0, 0 
L__piscaLED567:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED220
L__piscaLED408:
;TCC_5.c,1001 :: 		if(temp_led3>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED568
	MOVLW       10
	SUBWF       _temp_led3+0, 0 
L__piscaLED568:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED221
;TCC_5.c,1003 :: 		temp_led3 = 0x00;                              //zera temp_led3
	CLRF        _temp_led3+0 
	CLRF        _temp_led3+1 
;TCC_5.c,1004 :: 		LED3 = ~LED3;                                  //inverte estado do LED de indicação do dispenser n°2
	BTG         PORTA+0, 1 
;TCC_5.c,1006 :: 		}                                               //end if temp_led3>=10
L_piscaLED221:
;TCC_5.c,1008 :: 		}                                                //end if ligar && !toque2 && num2!=0
	GOTO        L_piscaLED222
L_piscaLED220:
;TCC_5.c,1012 :: 		if(ligar && toque2)                             //se ligar e toque2 for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED225
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_piscaLED225
L__piscaLED407:
;TCC_5.c,1014 :: 		if(temp_led3>=2)                               //conta 200 milisegundos
	MOVLW       0
	SUBWF       _temp_led3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED569
	MOVLW       2
	SUBWF       _temp_led3+0, 0 
L__piscaLED569:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED226
;TCC_5.c,1016 :: 		temp_led3=0x00;                               //zera temp_led3
	CLRF        _temp_led3+0 
	CLRF        _temp_led3+1 
;TCC_5.c,1017 :: 		LED3 = ~LED3;                                 //inverte estado do LED de indicação do dispenser n°2
	BTG         PORTA+0, 1 
;TCC_5.c,1019 :: 		}                                              //end if temp_led3>=2
L_piscaLED226:
;TCC_5.c,1021 :: 		}                                               //end if ligar && toque2
	GOTO        L_piscaLED227
L_piscaLED225:
;TCC_5.c,1025 :: 		if(prog>0 && option==1)                        //se estiver em programação e dispenser n°2 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED570
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED570:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED230
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED571
	MOVLW       1
	XORWF       _option+0, 0 
L__piscaLED571:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED230
L__piscaLED406:
;TCC_5.c,1027 :: 		LED3 = 0x01;                                  //LED do dispenser n°2 aceso
	BSF         PORTA+0, 1 
;TCC_5.c,1028 :: 		}                                              //end if prog>0 && option==1
	GOTO        L_piscaLED231
L_piscaLED230:
;TCC_5.c,1030 :: 		else LED3 = 0x00;                               //senão, LED do dispenser n°2 desligado
	BCF         PORTA+0, 1 
L_piscaLED231:
;TCC_5.c,1032 :: 		}                                               //end else
L_piscaLED227:
;TCC_5.c,1034 :: 		}                                                //end else
L_piscaLED222:
;TCC_5.c,1036 :: 		if(ligar && !toque3 && num3!=0)                  //se ligar for 1, toque3 for 0 e num3 diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED234
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_piscaLED234
	MOVLW       0
	XORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED572
	MOVLW       0
	XORWF       _num3+0, 0 
L__piscaLED572:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED234
L__piscaLED405:
;TCC_5.c,1038 :: 		if(temp_led4>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED573
	MOVLW       10
	SUBWF       _temp_led4+0, 0 
L__piscaLED573:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED235
;TCC_5.c,1040 :: 		temp_led4 = 0x00;                              //zera temp_led4
	CLRF        _temp_led4+0 
	CLRF        _temp_led4+1 
;TCC_5.c,1041 :: 		LED4 = ~LED4;                                  //inverte estado do LED de indicação do dispenser n°3
	BTG         PORTA+0, 2 
;TCC_5.c,1043 :: 		}                                               //end if temp_led4>=10
L_piscaLED235:
;TCC_5.c,1045 :: 		}                                                //end if ligar && !toque3 && num3!=0
	GOTO        L_piscaLED236
L_piscaLED234:
;TCC_5.c,1049 :: 		if(ligar && toque3)                             //se ligar e toque3 for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED239
	BTFSS       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_piscaLED239
L__piscaLED404:
;TCC_5.c,1051 :: 		if(temp_led4>=2)                               //conta 200 milisegundos
	MOVLW       0
	SUBWF       _temp_led4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED574
	MOVLW       2
	SUBWF       _temp_led4+0, 0 
L__piscaLED574:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED240
;TCC_5.c,1053 :: 		temp_led4=0x00;                               //zera temp_led4
	CLRF        _temp_led4+0 
	CLRF        _temp_led4+1 
;TCC_5.c,1054 :: 		LED4 = ~LED4;                                 //inverte estado do LED de indicação do dispenser n°3
	BTG         PORTA+0, 2 
;TCC_5.c,1056 :: 		}                                              //end if temp_led4>=2
L_piscaLED240:
;TCC_5.c,1058 :: 		}                                               //end if ligar && toque3
	GOTO        L_piscaLED241
L_piscaLED239:
;TCC_5.c,1062 :: 		if(prog>0 && option==2)                        //se estiver em programação e dispenser n°3 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED575
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED575:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED244
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED576
	MOVLW       2
	XORWF       _option+0, 0 
L__piscaLED576:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED244
L__piscaLED403:
;TCC_5.c,1064 :: 		LED4 = 0x01;                                  //LED do dispenser n°3 aceso
	BSF         PORTA+0, 2 
;TCC_5.c,1065 :: 		}                                              //end if prog>0 && option==2
	GOTO        L_piscaLED245
L_piscaLED244:
;TCC_5.c,1067 :: 		else LED4 = 0x00;                               //senão, LED do dispenser n°3 desligado
	BCF         PORTA+0, 2 
L_piscaLED245:
;TCC_5.c,1069 :: 		}                                               //end else
L_piscaLED241:
;TCC_5.c,1071 :: 		}                                                //end else
L_piscaLED236:
;TCC_5.c,1074 :: 		if(ligar && !toque4 && num4!=0)                  //se ligar for 1, toque4 for 0 e num4 diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED248
	BTFSC       _toque4+0, BitPos(_toque4+0) 
	GOTO        L_piscaLED248
	MOVLW       0
	XORWF       _num4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED577
	MOVLW       0
	XORWF       _num4+0, 0 
L__piscaLED577:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED248
L__piscaLED402:
;TCC_5.c,1076 :: 		if(temp_led5>=10)                               //conta 1 segundo
	MOVLW       0
	SUBWF       _temp_led5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED578
	MOVLW       10
	SUBWF       _temp_led5+0, 0 
L__piscaLED578:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED249
;TCC_5.c,1078 :: 		temp_led5 = 0x00;                              //zera temp_led5
	CLRF        _temp_led5+0 
	CLRF        _temp_led5+1 
;TCC_5.c,1079 :: 		LED5 = ~LED5;                                  //inverte estado do LED de indicação do dispenser n°4
	BTG         PORTA+0, 4 
;TCC_5.c,1081 :: 		}                                               //end if temp_led5>=10
L_piscaLED249:
;TCC_5.c,1083 :: 		}                                                //end if ligar && !toque4 && num4!=0
	GOTO        L_piscaLED250
L_piscaLED248:
;TCC_5.c,1087 :: 		if(ligar && toque4)                             //se ligar e toque4 for 1
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED253
	BTFSS       _toque4+0, BitPos(_toque4+0) 
	GOTO        L_piscaLED253
L__piscaLED401:
;TCC_5.c,1089 :: 		if(temp_led5>=2)                               //conta 200 milisegundos
	MOVLW       0
	SUBWF       _temp_led5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED579
	MOVLW       2
	SUBWF       _temp_led5+0, 0 
L__piscaLED579:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED254
;TCC_5.c,1091 :: 		temp_led5=0x00;                               //zera temp_led5
	CLRF        _temp_led5+0 
	CLRF        _temp_led5+1 
;TCC_5.c,1092 :: 		LED5 = ~LED5;                                 //inverte estado do LED de indicação do dispenser n°4
	BTG         PORTA+0, 4 
;TCC_5.c,1094 :: 		}                                              //end if temp_led5>=2
L_piscaLED254:
;TCC_5.c,1096 :: 		}                                               //end if ligar && toque4
	GOTO        L_piscaLED255
L_piscaLED253:
;TCC_5.c,1100 :: 		if(prog>0 && option==3)                        //se estiver em programação e dispenser n°4 selecionado
	MOVLW       0
	MOVWF       R0 
	MOVF        _prog+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED580
	MOVF        _prog+0, 0 
	SUBLW       0
L__piscaLED580:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED258
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED581
	MOVLW       3
	XORWF       _option+0, 0 
L__piscaLED581:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED258
L__piscaLED400:
;TCC_5.c,1102 :: 		LED5 = 0x01;                                  //LED do dispenser n°4 aceso
	BSF         PORTA+0, 4 
;TCC_5.c,1103 :: 		}                                              //end if prog>0 && option==3
	GOTO        L_piscaLED259
L_piscaLED258:
;TCC_5.c,1105 :: 		else LED5 = 0x00;                               //senão, LED do dispenser n°4 desligado
	BCF         PORTA+0, 4 
L_piscaLED259:
;TCC_5.c,1107 :: 		}                                               //end else
L_piscaLED255:
;TCC_5.c,1109 :: 		}                                                //end else
L_piscaLED250:
;TCC_5.c,1111 :: 		}                                                 //end piscaLED()
L_end_piscaLED:
	RETURN      0
; end of _piscaLED

_timebase:

;TCC_5.c,1118 :: 		void timebase()
;TCC_5.c,1120 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase260
;TCC_5.c,1122 :: 		temp_ligado = 0x00;                            //zera temp_ligado
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
;TCC_5.c,1123 :: 		}
L_timebase260:
;TCC_5.c,1124 :: 		if(ligar && num!=0)                             //se ligar for 1 e num diferente de 0...
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase263
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase583
	MOVLW       0
	XORWF       _num+0, 0 
L__timebase583:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase263
L__timebase412:
;TCC_5.c,1126 :: 		if(temp==10)                                   //conta 1 segundo
	MOVLW       0
	XORWF       _temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase584
	MOVLW       10
	XORWF       _temp+0, 0 
L__timebase584:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase264
;TCC_5.c,1128 :: 		temp = 0x00;                                  //zera temp
	CLRF        _temp+0 
	CLRF        _temp+1 
;TCC_5.c,1129 :: 		temp_ligado++;                                //incrementa temp_ligado a cada 1 segundo
	INFSNZ      _temp_ligado+0, 1 
	INCF        _temp_ligado+1, 1 
;TCC_5.c,1131 :: 		}                                              //end if temp==10
L_timebase264:
;TCC_5.c,1133 :: 		if(temp_ligado==mult)                          //compara a igualdade de temp_ligado com mult
	MOVF        _temp_ligado+1, 0 
	XORWF       _mult+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase585
	MOVF        _mult+0, 0 
	XORWF       _temp_ligado+0, 0 
L__timebase585:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase265
;TCC_5.c,1135 :: 		toque = 0x01;                                 //liga o bit toque
	BSF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,1136 :: 		atv_mot = 0x01;                               //liga o bit de ativação do motor
	BSF         _atv_mot+0, BitPos(_atv_mot+0) 
;TCC_5.c,1137 :: 		comp = qtd_comp;
	MOVF        _qtd_comp+0, 0 
	MOVWF       _comp+0 
	MOVF        _qtd_comp+1, 0 
	MOVWF       _comp+1 
;TCC_5.c,1138 :: 		abre_mot();                                   //define os bits de controle do motor para abri-lo
	CALL        _abre_mot+0, 0
;TCC_5.c,1140 :: 		}                                              //end if temp_ligado==mult
L_timebase265:
;TCC_5.c,1142 :: 		if(atv_mot)                                    //se ativação do motor for ligada...
	BTFSS       _atv_mot+0, BitPos(_atv_mot+0) 
	GOTO        L_timebase266
;TCC_5.c,1144 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,1146 :: 		}                                              //end if atv_mot
	GOTO        L_timebase267
L_timebase266:
;TCC_5.c,1150 :: 		alarme();                                     //executa o alarme
	CALL        _alarme+0, 0
;TCC_5.c,1151 :: 		}
L_timebase267:
;TCC_5.c,1152 :: 		}                                               //end if ligar
L_timebase263:
;TCC_5.c,1154 :: 		}                                                 //end timebase()
L_end_timebase:
	RETURN      0
; end of _timebase

_timebase2:

;TCC_5.c,1161 :: 		void timebase2()
;TCC_5.c,1163 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase2268
;TCC_5.c,1165 :: 		temp_ligado2 = 0x00;                           //zera temp_ligado2
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
;TCC_5.c,1166 :: 		}
L_timebase2268:
;TCC_5.c,1168 :: 		if(ligar && num2!=0)                            //se ligar for 1 e num2 diferente de 0
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase2271
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2587
	MOVLW       0
	XORWF       _num2+0, 0 
L__timebase2587:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase2271
L__timebase2413:
;TCC_5.c,1170 :: 		if(temp2==10)                                  //conta 1 segundo
	MOVLW       0
	XORWF       _temp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2588
	MOVLW       10
	XORWF       _temp2+0, 0 
L__timebase2588:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase2272
;TCC_5.c,1172 :: 		temp2 = 0x00;                                 //zera temp2
	CLRF        _temp2+0 
	CLRF        _temp2+1 
;TCC_5.c,1173 :: 		temp_ligado2++;                               //incrementa temp_ligado2 a cada 1 segundo
	INFSNZ      _temp_ligado2+0, 1 
	INCF        _temp_ligado2+1, 1 
;TCC_5.c,1175 :: 		}                                              //end if temp2==10
L_timebase2272:
;TCC_5.c,1177 :: 		if(temp_ligado2==mult2)                        //compara igualdade entre temp_ligado2 e mult2
	MOVF        _temp_ligado2+1, 0 
	XORWF       _mult2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2589
	MOVF        _mult2+0, 0 
	XORWF       _temp_ligado2+0, 0 
L__timebase2589:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase2273
;TCC_5.c,1179 :: 		toque2 = 0x01;                                //liga o bit toque2
	BSF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,1180 :: 		atv_mot2 = 0x01;                              //liga o bit de aativação do motor 2
	BSF         _atv_mot2+0, BitPos(_atv_mot2+0) 
;TCC_5.c,1181 :: 		comp2 = qtd_comp2;
	MOVF        _qtd_comp2+0, 0 
	MOVWF       _comp2+0 
	MOVF        _qtd_comp2+1, 0 
	MOVWF       _comp2+1 
;TCC_5.c,1182 :: 		abre_mot2();                                  //define os bits de controle do motor 2 para abrir
	CALL        _abre_mot2+0, 0
;TCC_5.c,1184 :: 		}                                              //end if temp_ligado2==mult2
L_timebase2273:
;TCC_5.c,1186 :: 		if(atv_mot2)                                   //se ativação do motor 2 ligada...
	BTFSS       _atv_mot2+0, BitPos(_atv_mot2+0) 
	GOTO        L_timebase2274
;TCC_5.c,1188 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,1190 :: 		}                                              //end if atv_mot2
	GOTO        L_timebase2275
L_timebase2274:
;TCC_5.c,1194 :: 		alarme();                                     //aciona o alarme
	CALL        _alarme+0, 0
;TCC_5.c,1196 :: 		}                                              //end else
L_timebase2275:
;TCC_5.c,1198 :: 		}                                               //end if ligar && num2!=0
L_timebase2271:
;TCC_5.c,1200 :: 		}                                                 //end timebase2()
L_end_timebase2:
	RETURN      0
; end of _timebase2

_timebase3:

;TCC_5.c,1207 :: 		void timebase3()
;TCC_5.c,1209 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase3276
;TCC_5.c,1211 :: 		temp_ligado3 = 0x00;                           //zera temp_ligado3
	CLRF        _temp_ligado3+0 
	CLRF        _temp_ligado3+1 
;TCC_5.c,1212 :: 		}
L_timebase3276:
;TCC_5.c,1214 :: 		if(ligar && num3!=0)                            //se ligar for 1 e num3 diferente de 0
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase3279
	MOVLW       0
	XORWF       _num3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3591
	MOVLW       0
	XORWF       _num3+0, 0 
L__timebase3591:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase3279
L__timebase3414:
;TCC_5.c,1216 :: 		if(temp3==10)                                  //conta 1 segundo
	MOVLW       0
	XORWF       _temp3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3592
	MOVLW       10
	XORWF       _temp3+0, 0 
L__timebase3592:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase3280
;TCC_5.c,1218 :: 		temp3 = 0x00;                                 //zera temp3
	CLRF        _temp3+0 
	CLRF        _temp3+1 
;TCC_5.c,1219 :: 		temp_ligado3++;                               //incrementa temp_ligado3 a cada 1 segundo
	INFSNZ      _temp_ligado3+0, 1 
	INCF        _temp_ligado3+1, 1 
;TCC_5.c,1221 :: 		}                                              //end if temp3==10
L_timebase3280:
;TCC_5.c,1223 :: 		if(temp_ligado3==mult3)                        //compara igualdade entre temp_ligado3 e mult3
	MOVF        _temp_ligado3+1, 0 
	XORWF       _mult3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase3593
	MOVF        _mult3+0, 0 
	XORWF       _temp_ligado3+0, 0 
L__timebase3593:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase3281
;TCC_5.c,1225 :: 		toque3 = 0x01;                                //liga o bit toque3
	BSF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,1226 :: 		atv_mot3 = 0x01;                              //liga o bit de aativação do motor 3
	BSF         _atv_mot3+0, BitPos(_atv_mot3+0) 
;TCC_5.c,1227 :: 		comp3 = qtd_comp3;
	MOVF        _qtd_comp3+0, 0 
	MOVWF       _comp3+0 
	MOVF        _qtd_comp3+1, 0 
	MOVWF       _comp3+1 
;TCC_5.c,1228 :: 		abre_mot3();                                  //define os bits de controle do motor 3 para abrir
	CALL        _abre_mot3+0, 0
;TCC_5.c,1230 :: 		}                                              //end if temp_ligado3==mult3
L_timebase3281:
;TCC_5.c,1232 :: 		if(atv_mot3)                                   //se ativação do motor 3 ligada...
	BTFSS       _atv_mot3+0, BitPos(_atv_mot3+0) 
	GOTO        L_timebase3282
;TCC_5.c,1234 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,1236 :: 		}                                              //end if atv_mot3
	GOTO        L_timebase3283
L_timebase3282:
;TCC_5.c,1240 :: 		alarme();                                     //aciona o alarme
	CALL        _alarme+0, 0
;TCC_5.c,1242 :: 		}                                              //end else
L_timebase3283:
;TCC_5.c,1244 :: 		}                                               //end if ligar && num3!=0
L_timebase3279:
;TCC_5.c,1246 :: 		}                                                 //end timebase3()
L_end_timebase3:
	RETURN      0
; end of _timebase3

_timebase4:

;TCC_5.c,1253 :: 		void timebase4()
;TCC_5.c,1255 :: 		if(!ligar)                                      //se ligar for 0
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase4284
;TCC_5.c,1257 :: 		temp_ligado4 = 0x00;                           //zera temp_ligado4
	CLRF        _temp_ligado4+0 
	CLRF        _temp_ligado4+1 
;TCC_5.c,1258 :: 		}
L_timebase4284:
;TCC_5.c,1260 :: 		if(ligar && num4!=0)                            //se ligar for 1 e num4 diferente de 0
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase4287
	MOVLW       0
	XORWF       _num4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase4595
	MOVLW       0
	XORWF       _num4+0, 0 
L__timebase4595:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase4287
L__timebase4415:
;TCC_5.c,1262 :: 		if(temp4==10)                                  //conta 1 segundo
	MOVLW       0
	XORWF       _temp4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase4596
	MOVLW       10
	XORWF       _temp4+0, 0 
L__timebase4596:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase4288
;TCC_5.c,1264 :: 		temp4 = 0x00;                                 //zera temp4
	CLRF        _temp4+0 
	CLRF        _temp4+1 
;TCC_5.c,1265 :: 		temp_ligado4++;                               //incrementa temp_ligado4 a cada 1 segundo
	INFSNZ      _temp_ligado4+0, 1 
	INCF        _temp_ligado4+1, 1 
;TCC_5.c,1267 :: 		}                                              //end if temp3==10
L_timebase4288:
;TCC_5.c,1269 :: 		if(temp_ligado4==mult4)                        //compara igualdade entre temp_ligado4 e mult4
	MOVF        _temp_ligado4+1, 0 
	XORWF       _mult4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase4597
	MOVF        _mult4+0, 0 
	XORWF       _temp_ligado4+0, 0 
L__timebase4597:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase4289
;TCC_5.c,1271 :: 		toque4 = 0x01;                                //liga o bit toque4
	BSF         _toque4+0, BitPos(_toque4+0) 
;TCC_5.c,1272 :: 		atv_mot4 = 0x01;                              //liga o bit de ativação do motor 4
	BSF         _atv_mot4+0, BitPos(_atv_mot4+0) 
;TCC_5.c,1273 :: 		comp4 = qtd_comp4;
	MOVF        _qtd_comp4+0, 0 
	MOVWF       _comp4+0 
	MOVF        _qtd_comp4+1, 0 
	MOVWF       _comp4+1 
;TCC_5.c,1274 :: 		abre_mot4();                                  //define os bits de controle do motor 4 para abrir
	CALL        _abre_mot4+0, 0
;TCC_5.c,1276 :: 		}                                              //end if temp_ligado4==mult4
L_timebase4289:
;TCC_5.c,1278 :: 		if(atv_mot4)                                   //se ativação do motor 4 ligada...
	BTFSS       _atv_mot4+0, BitPos(_atv_mot4+0) 
	GOTO        L_timebase4290
;TCC_5.c,1280 :: 		read_motbits();                               //executa a leitura dos bits de controle dos motores
	CALL        _read_motbits+0, 0
;TCC_5.c,1282 :: 		}                                              //end if atv_mot4
	GOTO        L_timebase4291
L_timebase4290:
;TCC_5.c,1286 :: 		alarme();                                     //aciona o alarme
	CALL        _alarme+0, 0
;TCC_5.c,1288 :: 		}                                              //end else
L_timebase4291:
;TCC_5.c,1290 :: 		}                                               //end if ligar && num4!=0
L_timebase4287:
;TCC_5.c,1292 :: 		}                                                 //end timebase4()
L_end_timebase4:
	RETURN      0
; end of _timebase4

_alarme:

;TCC_5.c,1298 :: 		void alarme()
;TCC_5.c,1300 :: 		if(toque || toque2 || toque3 || toque4)          //se toque, toque2, toque3 ou toque4 for 1
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L__alarme416
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L__alarme416
	BTFSC       _toque3+0, BitPos(_toque3+0) 
	GOTO        L__alarme416
	BTFSC       _toque4+0, BitPos(_toque4+0) 
	GOTO        L__alarme416
	GOTO        L_alarme294
L__alarme416:
;TCC_5.c,1302 :: 		if(vezes <200)                                 //se vezes for menor que 200 (toca por 1 minuto)
	MOVLW       0
	SUBWF       _vezes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__alarme599
	MOVLW       200
	SUBWF       _vezes+0, 0 
L__alarme599:
	BTFSC       STATUS+0, 0 
	GOTO        L_alarme295
;TCC_5.c,1304 :: 		toca_som();                                   //executa a toca do SOM
	CALL        _toca_som+0, 0
;TCC_5.c,1305 :: 		}                                              //end if vezes<10
	GOTO        L_alarme296
L_alarme295:
;TCC_5.c,1309 :: 		if(toque)                                     //se toque for 1
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_alarme297
;TCC_5.c,1311 :: 		toque=0x00;                                  //limpa o bit toque
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,1312 :: 		temp_ligado=0x00;                            //zera temp_ligado para recomeçar a contagem
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
;TCC_5.c,1314 :: 		}                                             //end if toque
L_alarme297:
;TCC_5.c,1316 :: 		if(toque2)                                    //se toque2 for 1
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_alarme298
;TCC_5.c,1318 :: 		toque2=0x00;                                 //limpa o bit toque 2
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,1319 :: 		temp_ligado2=0x00;                           //zera temp_ligado2 para recomeçar a contagem
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
;TCC_5.c,1321 :: 		}                                             //end if toque2
L_alarme298:
;TCC_5.c,1323 :: 		if(toque3)                                    //se toque3 for 1
	BTFSS       _toque3+0, BitPos(_toque3+0) 
	GOTO        L_alarme299
;TCC_5.c,1325 :: 		toque3=0x00;                                 //limpa o bit toque3
	BCF         _toque3+0, BitPos(_toque3+0) 
;TCC_5.c,1326 :: 		temp_ligado3=0x00;                           //zera temp_ligado3 para recomeçar a contagem
	CLRF        _temp_ligado3+0 
	CLRF        _temp_ligado3+1 
;TCC_5.c,1328 :: 		}                                             //end if toque3
L_alarme299:
;TCC_5.c,1330 :: 		if(toque4)                                    //se toque4 for 1
	BTFSS       _toque4+0, BitPos(_toque4+0) 
	GOTO        L_alarme300
;TCC_5.c,1332 :: 		toque4=0x00;                                 //limpa o bit toque4
	BCF         _toque4+0, BitPos(_toque4+0) 
;TCC_5.c,1333 :: 		temp_ligado4=0x00;                           //zera temp_ligado4 para recomeçar a contagem
	CLRF        _temp_ligado4+0 
	CLRF        _temp_ligado4+1 
;TCC_5.c,1335 :: 		}                                             //end if toque4
L_alarme300:
;TCC_5.c,1337 :: 		vezes=0x00;                                  //zera vezes
	CLRF        _vezes+0 
	CLRF        _vezes+1 
;TCC_5.c,1338 :: 		SOM = 0x00;                                  //desliga o som
	BCF         PORTB+0, 4 
;TCC_5.c,1340 :: 		}                                              //end else
L_alarme296:
;TCC_5.c,1342 :: 		}                                                //end if toque || toque2 || toque3 || toque4
L_alarme294:
;TCC_5.c,1344 :: 		}                                                 //end alarme()
L_end_alarme:
	RETURN      0
; end of _alarme

_toca_som:

;TCC_5.c,1350 :: 		void toca_som()
;TCC_5.c,1352 :: 		if(temp_som>3) temp_som=0x00;                    //se temp_som for maior que 3, zera temp_som
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_som+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__toca_som601
	MOVF        _temp_som+0, 0 
	SUBLW       3
L__toca_som601:
	BTFSC       STATUS+0, 0 
	GOTO        L_toca_som301
	CLRF        _temp_som+0 
	CLRF        _temp_som+1 
L_toca_som301:
;TCC_5.c,1353 :: 		if(temp_som==3)                               //conta 300 milisegundos...
	MOVLW       0
	XORWF       _temp_som+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__toca_som602
	MOVLW       3
	XORWF       _temp_som+0, 0 
L__toca_som602:
	BTFSS       STATUS+0, 2 
	GOTO        L_toca_som302
;TCC_5.c,1355 :: 		temp_som = 0x00;                             //zera temp_som
	CLRF        _temp_som+0 
	CLRF        _temp_som+1 
;TCC_5.c,1356 :: 		SOM = ~SOM;                                  //inverte o estado do buzzer
	BTG         PORTB+0, 4 
;TCC_5.c,1357 :: 		vezes++;                                     //incrementa vezes
	INFSNZ      _vezes+0, 1 
	INCF        _vezes+1, 1 
;TCC_5.c,1359 :: 		if(!ligar)                                   //se ligar for 0 (desligado)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_toca_som303
;TCC_5.c,1361 :: 		vezes = 0x00;                               //zera vezes
	CLRF        _vezes+0 
	CLRF        _vezes+1 
;TCC_5.c,1362 :: 		SOM   = 0x00;                               //desliga o buzzer
	BCF         PORTB+0, 4 
;TCC_5.c,1364 :: 		}                                            //end if !ligar
L_toca_som303:
;TCC_5.c,1366 :: 		}                                             //end if temp_som==3
L_toca_som302:
;TCC_5.c,1368 :: 		}                                                 //end toca_som()
L_end_toca_som:
	RETURN      0
; end of _toca_som

_abre_mot:

;TCC_5.c,1375 :: 		void abre_mot()
;TCC_5.c,1377 :: 		open_bit  = 0x01;                                //seta bit de abertura
	BSF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,1378 :: 		close_bit = 0x00;                                //limpa bit de fechamento
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,1379 :: 		x_mot     = 0x00;                                //zera x_mot
	CLRF        _x_mot+0 
	CLRF        _x_mot+1 
;TCC_5.c,1381 :: 		}                                                 //end abre_mot()
L_end_abre_mot:
	RETURN      0
; end of _abre_mot

_abre_mot2:

;TCC_5.c,1388 :: 		void abre_mot2()
;TCC_5.c,1390 :: 		open_bit2  = 0x01;                               //seta bit de abertura
	BSF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,1391 :: 		close_bit2 = 0x00;                               //limpa bit de fechamento
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,1392 :: 		x_mot2     = 0x00;                               //zera x_mot
	CLRF        _x_mot2+0 
	CLRF        _x_mot2+1 
;TCC_5.c,1394 :: 		}                                                 //end abre_mot2()
L_end_abre_mot2:
	RETURN      0
; end of _abre_mot2

_abre_mot3:

;TCC_5.c,1401 :: 		void abre_mot3()
;TCC_5.c,1403 :: 		open_bit3  = 0x01;                               //seta bit de abertura
	BSF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,1404 :: 		close_bit3 = 0x00;                               //limpa bit de fechamento
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1405 :: 		x_mot3     = 0x00;                               //zera x_mot
	CLRF        _x_mot3+0 
	CLRF        _x_mot3+1 
;TCC_5.c,1407 :: 		}                                                 //end abre_mot3()
L_end_abre_mot3:
	RETURN      0
; end of _abre_mot3

_abre_mot4:

;TCC_5.c,1414 :: 		void abre_mot4()
;TCC_5.c,1416 :: 		open_bit4  = 0x01;                               //seta bit de abertura
	BSF         _open_bit4+0, BitPos(_open_bit4+0) 
;TCC_5.c,1417 :: 		close_bit4 = 0x00;                               //limpa bit de fechamento
	BCF         _close_bit4+0, BitPos(_close_bit4+0) 
;TCC_5.c,1418 :: 		x_mot4     = 0x00;                               //zera x_mot
	CLRF        _x_mot4+0 
	CLRF        _x_mot4+1 
;TCC_5.c,1420 :: 		}                                                 //end abre_mot4()
L_end_abre_mot4:
	RETURN      0
; end of _abre_mot4

_mot_aberto:

;TCC_5.c,1426 :: 		void mot_aberto()
;TCC_5.c,1428 :: 		if(comp!=0)                                      //se a quantidade de comprimidos a serem despejados
	MOVLW       0
	XORWF       _comp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto608
	MOVLW       0
	XORWF       _comp+0, 0 
L__mot_aberto608:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_aberto304
;TCC_5.c,1431 :: 		if(x_mot<20)                                     //se x_mot for menor que 10...
	MOVLW       0
	SUBWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto609
	MOVLW       20
	SUBWF       _x_mot+0, 0 
L__mot_aberto609:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto305
;TCC_5.c,1433 :: 		SM=0;                                         //  ||
	BCF         PORTB+0, 0 
;TCC_5.c,1434 :: 		delay_us(18000);                              //  ||
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_mot_aberto306:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto306
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto306
	DECFSZ      R11, 1, 1
	BRA         L_mot_aberto306
	NOP
	NOP
;TCC_5.c,1435 :: 		SM=1;                                         //  ||
	BSF         PORTB+0, 0 
;TCC_5.c,1436 :: 		delay_us(2000);                               //  \/
	MOVLW       32
	MOVWF       R12, 0
	MOVLW       41
	MOVWF       R13, 0
L_mot_aberto307:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto307
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto307
	NOP
	NOP
;TCC_5.c,1437 :: 		SM=0;                                         // liga motor 1 no sentido horário
	BCF         PORTB+0, 0 
;TCC_5.c,1438 :: 		x_mot ++;                                     //incrementa x_mot
	INFSNZ      _x_mot+0, 1 
	INCF        _x_mot+1, 1 
;TCC_5.c,1440 :: 		}                                               //end if x_mot<10
L_mot_aberto305:
;TCC_5.c,1442 :: 		if(x_mot == 20)                                 //se x_mot for 10...
	MOVLW       0
	XORWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto610
	MOVLW       20
	XORWF       _x_mot+0, 0 
L__mot_aberto610:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto308
;TCC_5.c,1444 :: 		fecha_mot();                                  //executa a configuração dos bits de controle do motor 1 para fechar
	CALL        _fecha_mot+0, 0
;TCC_5.c,1446 :: 		}                                              //end if x_mot==10
L_mot_aberto308:
;TCC_5.c,1448 :: 		}                                                //end if comp!=0
	GOTO        L_mot_aberto309
L_mot_aberto304:
;TCC_5.c,1451 :: 		open_bit = 0x00;                                //limpa bit de abertura
	BCF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,1452 :: 		close_bit= 0x00;                                //limpa bit de fechamento
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,1453 :: 		}
L_mot_aberto309:
;TCC_5.c,1455 :: 		}                                                 //end mot_aberto()
L_end_mot_aberto:
	RETURN      0
; end of _mot_aberto

_mot_aberto2:

;TCC_5.c,1461 :: 		void mot_aberto2()
;TCC_5.c,1463 :: 		if(comp2!=0)                                      //se a quantidade de comprimidos a serem despejados
	MOVLW       0
	XORWF       _comp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2612
	MOVLW       0
	XORWF       _comp2+0, 0 
L__mot_aberto2612:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_aberto2310
;TCC_5.c,1465 :: 		if(x_mot2<20)                                    //se x_mot2 for menor que 10...
	MOVLW       0
	SUBWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2613
	MOVLW       20
	SUBWF       _x_mot2+0, 0 
L__mot_aberto2613:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto2311
;TCC_5.c,1467 :: 		SM2=0;                                        //  ||
	BCF         PORTB+0, 1 
;TCC_5.c,1468 :: 		delay_us(18000);                              //  ||
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_mot_aberto2312:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto2312
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto2312
	DECFSZ      R11, 1, 1
	BRA         L_mot_aberto2312
	NOP
	NOP
;TCC_5.c,1469 :: 		SM2=1;                                        //  ||
	BSF         PORTB+0, 1 
;TCC_5.c,1470 :: 		delay_us(2000);                               //  \/
	MOVLW       32
	MOVWF       R12, 0
	MOVLW       41
	MOVWF       R13, 0
L_mot_aberto2313:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto2313
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto2313
	NOP
	NOP
;TCC_5.c,1471 :: 		SM2=0;                                        //liga motor 2 no sentido horário
	BCF         PORTB+0, 1 
;TCC_5.c,1472 :: 		x_mot2 ++;                                    //incrementa x_mot2
	INFSNZ      _x_mot2+0, 1 
	INCF        _x_mot2+1, 1 
;TCC_5.c,1474 :: 		}                                               //end if x_mot2<10
L_mot_aberto2311:
;TCC_5.c,1476 :: 		if(x_mot2 == 20)                                //se x_mot2 for 10...
	MOVLW       0
	XORWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2614
	MOVLW       20
	XORWF       _x_mot2+0, 0 
L__mot_aberto2614:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto2314
;TCC_5.c,1478 :: 		fecha_mot2();                                 //executa a configuração dos bits de controle do motor 2 para fechar
	CALL        _fecha_mot2+0, 0
;TCC_5.c,1480 :: 		}                                              //end if x_mot2==10
L_mot_aberto2314:
;TCC_5.c,1481 :: 		}                                                //end if comp!=0
	GOTO        L_mot_aberto2315
L_mot_aberto2310:
;TCC_5.c,1484 :: 		open_bit2 = 0x00;                                //limpa bit de abertura
	BCF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,1485 :: 		close_bit2= 0x00;                                //limpa bit de fechamento
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,1486 :: 		}
L_mot_aberto2315:
;TCC_5.c,1488 :: 		}                                                 //end mot_aberto2()
L_end_mot_aberto2:
	RETURN      0
; end of _mot_aberto2

_mot_aberto3:

;TCC_5.c,1494 :: 		void mot_aberto3()
;TCC_5.c,1496 :: 		if(comp3!=0)                                     //se a quantidade de comprimidos a serem despejados
	MOVLW       0
	XORWF       _comp3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto3616
	MOVLW       0
	XORWF       _comp3+0, 0 
L__mot_aberto3616:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_aberto3316
;TCC_5.c,1498 :: 		if(x_mot3<20)                                    //se x_mot3 for menor que 10...
	MOVLW       0
	SUBWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto3617
	MOVLW       20
	SUBWF       _x_mot3+0, 0 
L__mot_aberto3617:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto3317
;TCC_5.c,1500 :: 		SM3=0;                                        //  ||
	BCF         PORTB+0, 3 
;TCC_5.c,1501 :: 		delay_us(18000);                              //  ||
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_mot_aberto3318:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto3318
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto3318
	DECFSZ      R11, 1, 1
	BRA         L_mot_aberto3318
	NOP
	NOP
;TCC_5.c,1502 :: 		SM3=1;                                        //  ||
	BSF         PORTB+0, 3 
;TCC_5.c,1503 :: 		delay_us(2000);                               //  \/
	MOVLW       32
	MOVWF       R12, 0
	MOVLW       41
	MOVWF       R13, 0
L_mot_aberto3319:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto3319
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto3319
	NOP
	NOP
;TCC_5.c,1504 :: 		SM3=0;                                        // liga motor 1 no sentido horário
	BCF         PORTB+0, 3 
;TCC_5.c,1505 :: 		x_mot3 ++;                                    //incrementa x_mot3
	INFSNZ      _x_mot3+0, 1 
	INCF        _x_mot3+1, 1 
;TCC_5.c,1507 :: 		}                                               //end if x_mot3<10
L_mot_aberto3317:
;TCC_5.c,1509 :: 		if(x_mot3 == 20)                                //se x_mot3 for 10...
	MOVLW       0
	XORWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto3618
	MOVLW       20
	XORWF       _x_mot3+0, 0 
L__mot_aberto3618:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto3320
;TCC_5.c,1511 :: 		fecha_mot3();                                 //executa a configuração dos bits de controle do motor 3 para fechar
	CALL        _fecha_mot3+0, 0
;TCC_5.c,1513 :: 		}                                              //end if x_mot3==10
L_mot_aberto3320:
;TCC_5.c,1514 :: 		}                                                //end if comp!=0
	GOTO        L_mot_aberto3321
L_mot_aberto3316:
;TCC_5.c,1517 :: 		open_bit3 = 0x00;                               //limpa bit de abertura
	BCF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,1518 :: 		close_bit3= 0x00;                               //limpa bit de fechamento
	BCF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1519 :: 		}
L_mot_aberto3321:
;TCC_5.c,1521 :: 		}                                                 //end mot_aberto3()
L_end_mot_aberto3:
	RETURN      0
; end of _mot_aberto3

_mot_aberto4:

;TCC_5.c,1527 :: 		void mot_aberto4()
;TCC_5.c,1529 :: 		if(comp4!=0)                                      //se a quantidade de comprimidos a serem despejados
	MOVLW       0
	XORWF       _comp4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto4620
	MOVLW       0
	XORWF       _comp4+0, 0 
L__mot_aberto4620:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_aberto4322
;TCC_5.c,1531 :: 		if(x_mot4<20)                                    //se x_mot4 for menor que 10...
	MOVLW       0
	SUBWF       _x_mot4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto4621
	MOVLW       20
	SUBWF       _x_mot4+0, 0 
L__mot_aberto4621:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto4323
;TCC_5.c,1533 :: 		SM4=0;                                        //  ||
	BCF         PORTB+0, 2 
;TCC_5.c,1534 :: 		delay_us(18000);                              //  ||
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_mot_aberto4324:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto4324
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto4324
	DECFSZ      R11, 1, 1
	BRA         L_mot_aberto4324
	NOP
	NOP
;TCC_5.c,1535 :: 		SM4=1;                                        //  ||
	BSF         PORTB+0, 2 
;TCC_5.c,1536 :: 		delay_us(2000);                               //  \/
	MOVLW       32
	MOVWF       R12, 0
	MOVLW       41
	MOVWF       R13, 0
L_mot_aberto4325:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto4325
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto4325
	NOP
	NOP
;TCC_5.c,1537 :: 		SM4=0;                                        // liga motor 1 no sentido horário
	BCF         PORTB+0, 2 
;TCC_5.c,1538 :: 		x_mot4 ++;                                    //incrementa x_mot4
	INFSNZ      _x_mot4+0, 1 
	INCF        _x_mot4+1, 1 
;TCC_5.c,1540 :: 		}                                               //end if x_mot4<10
L_mot_aberto4323:
;TCC_5.c,1542 :: 		if(x_mot4 == 20)                                //se x_mot4 for 10...
	MOVLW       0
	XORWF       _x_mot4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto4622
	MOVLW       20
	XORWF       _x_mot4+0, 0 
L__mot_aberto4622:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto4326
;TCC_5.c,1544 :: 		fecha_mot4();                                 //executa a configuração dos bits de controle do motor 4 para fechar
	CALL        _fecha_mot4+0, 0
;TCC_5.c,1546 :: 		}                                              //end if x_mot4==10
L_mot_aberto4326:
;TCC_5.c,1547 :: 		}                                                //end if comp!=0
	GOTO        L_mot_aberto4327
L_mot_aberto4322:
;TCC_5.c,1550 :: 		open_bit4 = 0x00;                                //limpa bit de abertura
	BCF         _open_bit4+0, BitPos(_open_bit4+0) 
;TCC_5.c,1551 :: 		close_bit4= 0x00;                                //limpa bit de fechamento
	BCF         _close_bit4+0, BitPos(_close_bit4+0) 
;TCC_5.c,1552 :: 		}
L_mot_aberto4327:
;TCC_5.c,1554 :: 		}                                                 //end mot_aberto4()
L_end_mot_aberto4:
	RETURN      0
; end of _mot_aberto4

_fecha_mot:

;TCC_5.c,1561 :: 		void fecha_mot()
;TCC_5.c,1563 :: 		open_bit  = 0x00;                                //limpa o bit de abertura
	BCF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,1564 :: 		close_bit = 0x01;                                //seta o bit de fechamento
	BSF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,1565 :: 		x_mot     = 0x00;                                //zera x_mot
	CLRF        _x_mot+0 
	CLRF        _x_mot+1 
;TCC_5.c,1567 :: 		}                                                 //end fecha_mot()
L_end_fecha_mot:
	RETURN      0
; end of _fecha_mot

_fecha_mot2:

;TCC_5.c,1574 :: 		void fecha_mot2()
;TCC_5.c,1576 :: 		open_bit2  = 0x00;                               //limpa o bit de abertura
	BCF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,1577 :: 		close_bit2 = 0x01;                               //seta o bit de fechamento
	BSF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,1578 :: 		x_mot2     = 0x00;                               //zera x_mot2
	CLRF        _x_mot2+0 
	CLRF        _x_mot2+1 
;TCC_5.c,1580 :: 		}                                                 //end fecha_mot2()
L_end_fecha_mot2:
	RETURN      0
; end of _fecha_mot2

_fecha_mot3:

;TCC_5.c,1587 :: 		void fecha_mot3()
;TCC_5.c,1589 :: 		open_bit3  = 0x00;                               //limpa o bit de abertura
	BCF         _open_bit3+0, BitPos(_open_bit3+0) 
;TCC_5.c,1590 :: 		close_bit3 = 0x01;                               //seta o bit de fechamento
	BSF         _close_bit3+0, BitPos(_close_bit3+0) 
;TCC_5.c,1591 :: 		x_mot3     = 0x00;                               //zera x_mot3
	CLRF        _x_mot3+0 
	CLRF        _x_mot3+1 
;TCC_5.c,1593 :: 		}                                                 //end fecha_mot3()
L_end_fecha_mot3:
	RETURN      0
; end of _fecha_mot3

_fecha_mot4:

;TCC_5.c,1600 :: 		void fecha_mot4()
;TCC_5.c,1602 :: 		open_bit4  = 0x00;                               //limpa o bit de abertura
	BCF         _open_bit4+0, BitPos(_open_bit4+0) 
;TCC_5.c,1603 :: 		close_bit4 = 0x01;                               //seta o bit de fechamento
	BSF         _close_bit4+0, BitPos(_close_bit4+0) 
;TCC_5.c,1604 :: 		x_mot4     = 0x00;                               //zera x_mot4
	CLRF        _x_mot4+0 
	CLRF        _x_mot4+1 
;TCC_5.c,1606 :: 		}                                                 //end fecha_mot4()
L_end_fecha_mot4:
	RETURN      0
; end of _fecha_mot4

_mot_fechado:

;TCC_5.c,1612 :: 		void mot_fechado()
;TCC_5.c,1614 :: 		if(comp!=0)                                      //se a quantidade de comprimidos à despejar
	MOVLW       0
	XORWF       _comp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado628
	MOVLW       0
	XORWF       _comp+0, 0 
L__mot_fechado628:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_fechado328
;TCC_5.c,1616 :: 		if(x_mot<20)                                     //se x_mot for menor que 10
	MOVLW       0
	SUBWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado629
	MOVLW       20
	SUBWF       _x_mot+0, 0 
L__mot_fechado629:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado329
;TCC_5.c,1618 :: 		SM=0;                                         //  ||
	BCF         PORTB+0, 0 
;TCC_5.c,1619 :: 		delay_us(18500);                              //  ||
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       76
	MOVWF       R13, 0
L_mot_fechado330:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado330
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado330
	DECFSZ      R11, 1, 1
	BRA         L_mot_fechado330
	NOP
;TCC_5.c,1620 :: 		SM=1;                                         //  ||
	BSF         PORTB+0, 0 
;TCC_5.c,1621 :: 		delay_us(1500);                               //  \/
	MOVLW       24
	MOVWF       R12, 0
	MOVLW       95
	MOVWF       R13, 0
L_mot_fechado331:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado331
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado331
;TCC_5.c,1622 :: 		SM=0;                                         //leva o motor para a posição inicial
	BCF         PORTB+0, 0 
;TCC_5.c,1623 :: 		x_mot++;                                      //incrementa x_mot
	INFSNZ      _x_mot+0, 1 
	INCF        _x_mot+1, 1 
;TCC_5.c,1625 :: 		}                                               //end if x_mot<10
L_mot_fechado329:
;TCC_5.c,1627 :: 		if(x_mot==20)                                   //se x_mot for 10
	MOVLW       0
	XORWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado630
	MOVLW       20
	XORWF       _x_mot+0, 0 
L__mot_fechado630:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado332
;TCC_5.c,1629 :: 		abre_mot();                                  //define os bit de controle do motor para abrir
	CALL        _abre_mot+0, 0
;TCC_5.c,1630 :: 		comp--;                                      //decrementa comp
	MOVLW       1
	SUBWF       _comp+0, 1 
	MOVLW       0
	SUBWFB      _comp+1, 1 
;TCC_5.c,1632 :: 		}                                             //end if x_mot==10
L_mot_fechado332:
;TCC_5.c,1634 :: 		}                                                //end if comp!=0
L_mot_fechado328:
;TCC_5.c,1636 :: 		}                                                 //end mot_fechado
L_end_mot_fechado:
	RETURN      0
; end of _mot_fechado

_mot_fechado2:

;TCC_5.c,1642 :: 		void mot_fechado2()
;TCC_5.c,1644 :: 		if(comp2!=0)                                      //se a quantidade de comprimidos à despejar
	MOVLW       0
	XORWF       _comp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2632
	MOVLW       0
	XORWF       _comp2+0, 0 
L__mot_fechado2632:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_fechado2333
;TCC_5.c,1646 :: 		if(x_mot2<20)                                   //se x_mot2 for menor que 10
	MOVLW       0
	SUBWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2633
	MOVLW       20
	SUBWF       _x_mot2+0, 0 
L__mot_fechado2633:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado2334
;TCC_5.c,1648 :: 		SM2=0;                                        //  ||
	BCF         PORTB+0, 1 
;TCC_5.c,1649 :: 		delay_us(18500);                              //  ||
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       76
	MOVWF       R13, 0
L_mot_fechado2335:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado2335
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado2335
	DECFSZ      R11, 1, 1
	BRA         L_mot_fechado2335
	NOP
;TCC_5.c,1650 :: 		SM2=1;                                        //  ||
	BSF         PORTB+0, 1 
;TCC_5.c,1651 :: 		delay_us(1500);                               //  \/
	MOVLW       24
	MOVWF       R12, 0
	MOVLW       95
	MOVWF       R13, 0
L_mot_fechado2336:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado2336
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado2336
;TCC_5.c,1652 :: 		SM2=0;                                        //leva o motor 2 para a posição inicial
	BCF         PORTB+0, 1 
;TCC_5.c,1653 :: 		x_mot2++;                                     //incrementa x_mot2
	INFSNZ      _x_mot2+0, 1 
	INCF        _x_mot2+1, 1 
;TCC_5.c,1655 :: 		}                                               //end if x_mot2<10
L_mot_fechado2334:
;TCC_5.c,1657 :: 		if(x_mot2==20)                                  //se x_mot2 for 10
	MOVLW       0
	XORWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2634
	MOVLW       20
	XORWF       _x_mot2+0, 0 
L__mot_fechado2634:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado2337
;TCC_5.c,1659 :: 		abre_mot2();                                 //define os bit de controle do motor para abrir
	CALL        _abre_mot2+0, 0
;TCC_5.c,1660 :: 		comp2--;                                     //decrementa comp2
	MOVLW       1
	SUBWF       _comp2+0, 1 
	MOVLW       0
	SUBWFB      _comp2+1, 1 
;TCC_5.c,1662 :: 		}                                             //end if x_mot2==10
L_mot_fechado2337:
;TCC_5.c,1664 :: 		}                                               //end if comp!=0
L_mot_fechado2333:
;TCC_5.c,1666 :: 		}                                                 //end mot_fechado2()
L_end_mot_fechado2:
	RETURN      0
; end of _mot_fechado2

_mot_fechado3:

;TCC_5.c,1672 :: 		void mot_fechado3()
;TCC_5.c,1674 :: 		if(comp3!=0)                                      //se a quantidade de comprimidos à despejar
	MOVLW       0
	XORWF       _comp3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado3636
	MOVLW       0
	XORWF       _comp3+0, 0 
L__mot_fechado3636:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_fechado3338
;TCC_5.c,1676 :: 		if(x_mot3<20)                                   //se x_mot3 for menor que 10
	MOVLW       0
	SUBWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado3637
	MOVLW       20
	SUBWF       _x_mot3+0, 0 
L__mot_fechado3637:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado3339
;TCC_5.c,1678 :: 		SM3=0;                                        //  ||
	BCF         PORTB+0, 3 
;TCC_5.c,1679 :: 		delay_us(18500);                              //  ||
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       76
	MOVWF       R13, 0
L_mot_fechado3340:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado3340
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado3340
	DECFSZ      R11, 1, 1
	BRA         L_mot_fechado3340
	NOP
;TCC_5.c,1680 :: 		SM3=1;                                        //  ||
	BSF         PORTB+0, 3 
;TCC_5.c,1681 :: 		delay_us(1500);                               //  \/
	MOVLW       24
	MOVWF       R12, 0
	MOVLW       95
	MOVWF       R13, 0
L_mot_fechado3341:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado3341
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado3341
;TCC_5.c,1682 :: 		SM3=0;                                        //leva o motor 3 para a posição inicial
	BCF         PORTB+0, 3 
;TCC_5.c,1683 :: 		x_mot3++;                                     //incrementa x_mot3
	INFSNZ      _x_mot3+0, 1 
	INCF        _x_mot3+1, 1 
;TCC_5.c,1685 :: 		}                                               //end if x_mot2<10
L_mot_fechado3339:
;TCC_5.c,1687 :: 		if(x_mot3==20)                                  //se x_mot3 for 10
	MOVLW       0
	XORWF       _x_mot3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado3638
	MOVLW       20
	XORWF       _x_mot3+0, 0 
L__mot_fechado3638:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado3342
;TCC_5.c,1689 :: 		abre_mot3();                                 //define os bit de controle do motor para abrir
	CALL        _abre_mot3+0, 0
;TCC_5.c,1690 :: 		comp3--;                                     //decrementa comp3
	MOVLW       1
	SUBWF       _comp3+0, 1 
	MOVLW       0
	SUBWFB      _comp3+1, 1 
;TCC_5.c,1692 :: 		}                                             //end if x_mot3==10
L_mot_fechado3342:
;TCC_5.c,1694 :: 		}                                                //end if comp3!=0
L_mot_fechado3338:
;TCC_5.c,1696 :: 		}                                                 //end mot_fechado3()
L_end_mot_fechado3:
	RETURN      0
; end of _mot_fechado3

_mot_fechado4:

;TCC_5.c,1702 :: 		void mot_fechado4()
;TCC_5.c,1704 :: 		if(comp4!=0)                                      //se a quantidade de comprimidos à despejar
	MOVLW       0
	XORWF       _comp4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado4640
	MOVLW       0
	XORWF       _comp4+0, 0 
L__mot_fechado4640:
	BTFSC       STATUS+0, 2 
	GOTO        L_mot_fechado4343
;TCC_5.c,1706 :: 		if(x_mot4<20)                                   //se x_mot4 for menor que 10
	MOVLW       0
	SUBWF       _x_mot4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado4641
	MOVLW       20
	SUBWF       _x_mot4+0, 0 
L__mot_fechado4641:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado4344
;TCC_5.c,1708 :: 		SM4=0;                                        //  ||
	BCF         PORTB+0, 2 
;TCC_5.c,1709 :: 		delay_us(18500);                              //  ||
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       76
	MOVWF       R13, 0
L_mot_fechado4345:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado4345
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado4345
	DECFSZ      R11, 1, 1
	BRA         L_mot_fechado4345
	NOP
;TCC_5.c,1710 :: 		SM4=1;                                        //  ||
	BSF         PORTB+0, 2 
;TCC_5.c,1711 :: 		delay_us(1500);                               //  \/
	MOVLW       24
	MOVWF       R12, 0
	MOVLW       95
	MOVWF       R13, 0
L_mot_fechado4346:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado4346
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado4346
;TCC_5.c,1712 :: 		SM4=0;                                        //leva o motor 4 para a posição inicial
	BCF         PORTB+0, 2 
;TCC_5.c,1713 :: 		x_mot4++;                                     //incrementa x_mot4
	INFSNZ      _x_mot4+0, 1 
	INCF        _x_mot4+1, 1 
;TCC_5.c,1715 :: 		}                                               //end if x_mot4<10
L_mot_fechado4344:
;TCC_5.c,1717 :: 		if(x_mot4==20)                                  //se x_mot4 for 10
	MOVLW       0
	XORWF       _x_mot4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado4642
	MOVLW       20
	XORWF       _x_mot4+0, 0 
L__mot_fechado4642:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado4347
;TCC_5.c,1719 :: 		abre_mot4();                                 //define os bit de controle do motor para abrir
	CALL        _abre_mot4+0, 0
;TCC_5.c,1720 :: 		comp4--;                                     //decrementa comp4
	MOVLW       1
	SUBWF       _comp4+0, 1 
	MOVLW       0
	SUBWFB      _comp4+1, 1 
;TCC_5.c,1722 :: 		}                                             //end if x_mot4==10
L_mot_fechado4347:
;TCC_5.c,1724 :: 		}                                                //end if comp4!=0
L_mot_fechado4343:
;TCC_5.c,1726 :: 		}                                                 //end mot_fechado4()
L_end_mot_fechado4:
	RETURN      0
; end of _mot_fechado4

_read_motbits:

;TCC_5.c,1733 :: 		void read_motbits()
;TCC_5.c,1735 :: 		if(!open_bit && !close_bit) atv_mot = 0x00;    //se os bits de abertura e fechamento do motor 1 forem 0,
	BTFSC       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits350
	BTFSC       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits350
L__read_motbits428:
	BCF         _atv_mot+0, BitPos(_atv_mot+0) 
L_read_motbits350:
;TCC_5.c,1738 :: 		if(open_bit && !close_bit)                     //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits353
	BTFSC       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits353
L__read_motbits427:
;TCC_5.c,1740 :: 		mot_aberto();                                 //executa a abertura do motor 1
	CALL        _mot_aberto+0, 0
;TCC_5.c,1742 :: 		}                                              //end if open_bit && !close_bit
L_read_motbits353:
;TCC_5.c,1744 :: 		if(!open_bit && close_bit)                     //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits356
	BTFSS       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits356
L__read_motbits426:
;TCC_5.c,1746 :: 		mot_fechado();                                //executa o fechamento do motor 1
	CALL        _mot_fechado+0, 0
;TCC_5.c,1748 :: 		}                                              //end if !open_bit && close_bit
L_read_motbits356:
;TCC_5.c,1751 :: 		if(!open_bit2 && !close_bit2) atv_mot2 = 0x00; //se os bits de abertura e fechamento do motor 2 forem 0,
	BTFSC       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits359
	BTFSC       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits359
L__read_motbits425:
	BCF         _atv_mot2+0, BitPos(_atv_mot2+0) 
L_read_motbits359:
;TCC_5.c,1754 :: 		if(open_bit2 && !close_bit2)                   //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits362
	BTFSC       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits362
L__read_motbits424:
;TCC_5.c,1756 :: 		mot_aberto2();                                //executa a abertura do motor 2
	CALL        _mot_aberto2+0, 0
;TCC_5.c,1758 :: 		}                                              //end if open_bit2 && !close_bit2
L_read_motbits362:
;TCC_5.c,1760 :: 		if(!open_bit2 && close_bit2)                   //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits365
	BTFSS       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits365
L__read_motbits423:
;TCC_5.c,1762 :: 		mot_fechado2();                               //executa o fechamento do motor 2
	CALL        _mot_fechado2+0, 0
;TCC_5.c,1764 :: 		}                                              //end if !open_bit2 && close_bit2
L_read_motbits365:
;TCC_5.c,1767 :: 		if(!open_bit3 && !close_bit3) atv_mot3 = 0x00; //se os bits de abertura e fechamento do motor 3 forem 0,
	BTFSC       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits368
	BTFSC       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits368
L__read_motbits422:
	BCF         _atv_mot3+0, BitPos(_atv_mot3+0) 
L_read_motbits368:
;TCC_5.c,1770 :: 		if(open_bit3 && !close_bit3)                   //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits371
	BTFSC       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits371
L__read_motbits421:
;TCC_5.c,1772 :: 		mot_aberto3();                                //executa a abertura do motor 3
	CALL        _mot_aberto3+0, 0
;TCC_5.c,1774 :: 		}                                              //end if open_bit3 && !close_bit3
L_read_motbits371:
;TCC_5.c,1776 :: 		if(!open_bit3 && close_bit3)                   //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit3+0, BitPos(_open_bit3+0) 
	GOTO        L_read_motbits374
	BTFSS       _close_bit3+0, BitPos(_close_bit3+0) 
	GOTO        L_read_motbits374
L__read_motbits420:
;TCC_5.c,1778 :: 		mot_fechado3();                               //executa o fechamento do motor 3
	CALL        _mot_fechado3+0, 0
;TCC_5.c,1780 :: 		}                                              //end if !open_bit3 && close_bit3
L_read_motbits374:
;TCC_5.c,1783 :: 		if(!open_bit4 && !close_bit4) atv_mot4 = 0x00; //se os bits de abertura e fechamento do motor 4 forem 0,
	BTFSC       _open_bit4+0, BitPos(_open_bit4+0) 
	GOTO        L_read_motbits377
	BTFSC       _close_bit4+0, BitPos(_close_bit4+0) 
	GOTO        L_read_motbits377
L__read_motbits419:
	BCF         _atv_mot4+0, BitPos(_atv_mot4+0) 
L_read_motbits377:
;TCC_5.c,1786 :: 		if(open_bit4 && !close_bit4)                   //se o bit de abertura for 1 e o de fechamento for 0...
	BTFSS       _open_bit4+0, BitPos(_open_bit4+0) 
	GOTO        L_read_motbits380
	BTFSC       _close_bit4+0, BitPos(_close_bit4+0) 
	GOTO        L_read_motbits380
L__read_motbits418:
;TCC_5.c,1788 :: 		mot_aberto4();                                //executa a abertura do motor 4
	CALL        _mot_aberto4+0, 0
;TCC_5.c,1790 :: 		}                                              //end if open_bit4 && !close_bit4
L_read_motbits380:
;TCC_5.c,1792 :: 		if(!open_bit4 && close_bit4)                   //se o bit de abertura for 0 e o de fechamento for 1...
	BTFSC       _open_bit4+0, BitPos(_open_bit4+0) 
	GOTO        L_read_motbits383
	BTFSS       _close_bit4+0, BitPos(_close_bit4+0) 
	GOTO        L_read_motbits383
L__read_motbits417:
;TCC_5.c,1794 :: 		mot_fechado4();                               //executa o fechamento do motor 4
	CALL        _mot_fechado4+0, 0
;TCC_5.c,1796 :: 		}                                              //end if !open_bit4 && close_bit4
L_read_motbits383:
;TCC_5.c,1798 :: 		}                                                 //end read_motbits()
L_end_read_motbits:
	RETURN      0
; end of _read_motbits
