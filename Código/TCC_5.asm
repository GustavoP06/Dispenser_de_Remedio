
_interrupt:

;TCC_5.c,99 :: 		void interrupt()
;TCC_5.c,101 :: 		if(TMR1IF_bit)                       //100ms overflow
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt0
;TCC_5.c,103 :: 		TMR1IF_bit  =  0x00;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;TCC_5.c,104 :: 		TMR1H       =  0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;TCC_5.c,105 :: 		TMR1L       =  0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;TCC_5.c,106 :: 		temp_led++;
	INFSNZ      _temp_led+0, 1 
	INCF        _temp_led+1, 1 
;TCC_5.c,107 :: 		temp_som++;
	INFSNZ      _temp_som+0, 1 
	INCF        _temp_som+1, 1 
;TCC_5.c,108 :: 		temp_led2++;
	INFSNZ      _temp_led2+0, 1 
	INCF        _temp_led2+1, 1 
;TCC_5.c,109 :: 		temp_led3++;
	INFSNZ      _temp_led3+0, 1 
	INCF        _temp_led3+1, 1 
;TCC_5.c,110 :: 		temp_disp++;
	INFSNZ      _temp_disp+0, 1 
	INCF        _temp_disp+1, 1 
;TCC_5.c,111 :: 		}
L_interrupt0:
;TCC_5.c,113 :: 		if(TMR0IF_bit)                        //100ms overflow
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt1
;TCC_5.c,115 :: 		TMR0IF_bit =  0x00;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;TCC_5.c,116 :: 		TMR0H      =  0x3C;
	MOVLW       60
	MOVWF       TMR0H+0 
;TCC_5.c,117 :: 		TMR0L      =  0xB0;
	MOVLW       176
	MOVWF       TMR0L+0 
;TCC_5.c,118 :: 		temp++;
	INFSNZ      _temp+0, 1 
	INCF        _temp+1, 1 
;TCC_5.c,119 :: 		temp2++;
	INFSNZ      _temp2+0, 1 
	INCF        _temp2+1, 1 
;TCC_5.c,121 :: 		}                     //end if TMR0IF
L_interrupt1:
;TCC_5.c,125 :: 		piscaLED();
	CALL        _piscaLED+0, 0
;TCC_5.c,126 :: 		timebase();
	CALL        _timebase+0, 0
;TCC_5.c,127 :: 		timebase2();
	CALL        _timebase2+0, 0
;TCC_5.c,130 :: 		}                          //end interrupt()
L_end_interrupt:
L__interrupt192:
	RETFIE      1
; end of _interrupt

_main:

;TCC_5.c,132 :: 		void main (void)
;TCC_5.c,137 :: 		ADCON1        =   0x0F;                   //Define os pinos como digital
	MOVLW       15
	MOVWF       ADCON1+0 
;TCC_5.c,138 :: 		CMCON         =   0x07;                   //Desativa os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;TCC_5.c,140 :: 		TMR0H         =   0x3C;
	MOVLW       60
	MOVWF       TMR0H+0 
;TCC_5.c,141 :: 		TMR0L         =   0xB0;                   //Inicia timer0 em 15536
	MOVLW       176
	MOVWF       TMR0L+0 
;TCC_5.c,142 :: 		TMR1H         =   0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;TCC_5.c,143 :: 		TMR1L         =   0xB0;                   //Inicia TMR1 em 15536
	MOVLW       176
	MOVWF       TMR1L+0 
;TCC_5.c,146 :: 		INTCON.GIE    =   0x01;                   //Ativa interrupção global
	BSF         INTCON+0, 7 
;TCC_5.c,147 :: 		INTCON.PEIE   =   0x01;                   //Ativa interrupção por periféricos
	BSF         INTCON+0, 6 
;TCC_5.c,148 :: 		INTCON.TMR0IE =   0x01;                   //Ativa interrupção por overflow
	BSF         INTCON+0, 5 
;TCC_5.c,150 :: 		TMR0IF_bit    =   0x00;                   //zera a flag do timer0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;TCC_5.c,151 :: 		TMR1IF_bit    =   0x00;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;TCC_5.c,154 :: 		INTCON2.RBPU  =   0x01;                   //Desliga os resistores de pull-ups do portB
	BSF         INTCON2+0, 7 
;TCC_5.c,155 :: 		T0CON         =   0x81;                   //TMR0 16 bits, prescaler 1:4
	MOVLW       129
	MOVWF       T0CON+0 
;TCC_5.c,156 :: 		T1CON         =   0xA1;                   //TMR1 16 bits, prescaler 1:4
	MOVLW       161
	MOVWF       T1CON+0 
;TCC_5.c,159 :: 		ligar         =   0x00;
	BCF         _ligar+0, BitPos(_ligar+0) 
;TCC_5.c,160 :: 		b1_flag       =   0x00;
	BCF         _b1_flag+0, BitPos(_b1_flag+0) 
;TCC_5.c,161 :: 		b2_flag       =   0x00;
	BCF         _b2_flag+0, BitPos(_b2_flag+0) 
;TCC_5.c,162 :: 		b3_flag       =   0x00;
	BCF         _b3_flag+0, BitPos(_b3_flag+0) 
;TCC_5.c,163 :: 		b4_flag       =   0x00;
	BCF         _b4_flag+0, BitPos(_b4_flag+0) 
;TCC_5.c,164 :: 		b5_flag       =   0x00;
	BCF         _b5_flag+0, BitPos(_b5_flag+0) 
;TCC_5.c,165 :: 		display       =   0x00;
	BCF         _display+0, BitPos(_display+0) 
;TCC_5.c,166 :: 		toque         =   0x00;
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,167 :: 		toque2        =   0x00;
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,168 :: 		open_bit      =   0x00;
	BCF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,169 :: 		open_bit2     =   0x00;
	BCF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,170 :: 		close_bit     =   0x00;
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,171 :: 		close_bit2     =  0x00;
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,172 :: 		atv_mot       =   0x00;
	BCF         _atv_mot+0, BitPos(_atv_mot+0) 
;TCC_5.c,173 :: 		atv_mot2      =   0x00;
	BCF         _atv_mot2+0, BitPos(_atv_mot2+0) 
;TCC_5.c,175 :: 		SM            =   0x00;
	BCF         PORTA+0, 1 
;TCC_5.c,177 :: 		num           =   EEPROM_Read(0x01);
	MOVLW       1
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num+0 
	MOVLW       0
	MOVWF       _num+1 
;TCC_5.c,178 :: 		un            =   EEPROM_Read(0x03);
	MOVLW       3
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main194
	BCF         _un+0, BitPos(_un+0) 
	GOTO        L__main195
L__main194:
	BSF         _un+0, BitPos(_un+0) 
L__main195:
;TCC_5.c,179 :: 		num2          =   EEPROM_Read(0x02);
	MOVLW       2
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _num2+0 
	MOVLW       0
	MOVWF       _num2+1 
;TCC_5.c,180 :: 		un2           =   EEPROM_Read(0x04);
	MOVLW       4
	MOVWF       FARG_EEPROM_Read_address+0 
	CALL        _EEPROM_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main196
	BCF         _un2+0, BitPos(_un2+0) 
	GOTO        L__main197
L__main196:
	BSF         _un2+0, BitPos(_un2+0) 
L__main197:
;TCC_5.c,182 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;TCC_5.c,183 :: 		TRISC = 0x3F;
	MOVLW       63
	MOVWF       TRISC+0 
;TCC_5.c,184 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;TCC_5.c,186 :: 		LCD_Init();
	CALL        _Lcd_Init+0, 0
;TCC_5.c,187 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,188 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,190 :: 		while(1)
L_main2:
;TCC_5.c,192 :: 		ler_bot();
	CALL        _ler_bot+0, 0
;TCC_5.c,194 :: 		disp();
	CALL        _disp+0, 0
;TCC_5.c,195 :: 		}                                          //end while
	GOTO        L_main2
;TCC_5.c,197 :: 		}                                           //end main
L_end_main:
	GOTO        $+0
; end of _main

_ler_bot:

;TCC_5.c,199 :: 		void ler_bot()
;TCC_5.c,202 :: 		if(!BOTAO1) b1_flag=0x01;
	BTFSC       PORTC+0, 0 
	GOTO        L_ler_bot4
	BSF         _b1_flag+0, BitPos(_b1_flag+0) 
L_ler_bot4:
;TCC_5.c,204 :: 		if(BOTAO1 && b1_flag)
	BTFSS       PORTC+0, 0 
	GOTO        L_ler_bot7
	BTFSS       _b1_flag+0, BitPos(_b1_flag+0) 
	GOTO        L_ler_bot7
L__ler_bot173:
;TCC_5.c,206 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,207 :: 		b1_flag = 0x00;
	BCF         _b1_flag+0, BitPos(_b1_flag+0) 
;TCC_5.c,208 :: 		if(!ligar)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot8
;TCC_5.c,210 :: 		prog++;
	INFSNZ      _prog+0, 1 
	INCF        _prog+1, 1 
;TCC_5.c,211 :: 		if(prog==3)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot199
	MOVLW       3
	XORWF       _prog+0, 0 
L__ler_bot199:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot9
;TCC_5.c,213 :: 		prog=0x00;
	CLRF        _prog+0 
	CLRF        _prog+1 
;TCC_5.c,214 :: 		EEPROM_Write(0x01,num);
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,215 :: 		delay_ms(10);
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
;TCC_5.c,216 :: 		EEPROM_Write(0x03,un);
	MOVLW       3
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un+0, BitPos(_un+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,217 :: 		delay_ms(10);
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
;TCC_5.c,218 :: 		EEPROM_Write(0x02,num2);
	MOVLW       2
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVF        _num2+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,219 :: 		delay_ms(10);
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
;TCC_5.c,220 :: 		EEPROM_Write(0x04,un2);
	MOVLW       4
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	BTFSC       _un2+0, BitPos(_un2+0) 
	MOVLW       1
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;TCC_5.c,221 :: 		delay_ms(10);
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
;TCC_5.c,222 :: 		display=0x01;
	BSF         _display+0, BitPos(_display+0) 
;TCC_5.c,223 :: 		}
L_ler_bot9:
;TCC_5.c,224 :: 		}
L_ler_bot8:
;TCC_5.c,225 :: 		}
L_ler_bot7:
;TCC_5.c,230 :: 		if(!BOTAO2) b2_flag=0x01;
	BTFSC       PORTC+0, 1 
	GOTO        L_ler_bot14
	BSF         _b2_flag+0, BitPos(_b2_flag+0) 
L_ler_bot14:
;TCC_5.c,232 :: 		if(BOTAO2 && b2_flag)
	BTFSS       PORTC+0, 1 
	GOTO        L_ler_bot17
	BTFSS       _b2_flag+0, BitPos(_b2_flag+0) 
	GOTO        L_ler_bot17
L__ler_bot172:
;TCC_5.c,234 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,235 :: 		b2_flag    =  0x00;
	BCF         _b2_flag+0, BitPos(_b2_flag+0) 
;TCC_5.c,236 :: 		if(option==0)                     //depósito de remédio 1
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot200
	MOVLW       0
	XORWF       _option+0, 0 
L__ler_bot200:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot18
;TCC_5.c,238 :: 		if(prog==1)                      //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot201
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot201:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot19
;TCC_5.c,240 :: 		num++;
	INFSNZ      _num+0, 1 
	INCF        _num+1, 1 
;TCC_5.c,241 :: 		}
L_ler_bot19:
;TCC_5.c,242 :: 		if (prog==2)                    //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot202
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot202:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot20
;TCC_5.c,244 :: 		un = ~un;
	BTG         _un+0, BitPos(_un+0) 
;TCC_5.c,245 :: 		}                               //end if prog==2
L_ler_bot20:
;TCC_5.c,246 :: 		}
L_ler_bot18:
;TCC_5.c,248 :: 		if(option==1)                    //depósito de remédio 2
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot203
	MOVLW       1
	XORWF       _option+0, 0 
L__ler_bot203:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot21
;TCC_5.c,250 :: 		if(prog==1)                      //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot204
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot204:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot22
;TCC_5.c,252 :: 		num2++;
	INFSNZ      _num2+0, 1 
	INCF        _num2+1, 1 
;TCC_5.c,253 :: 		}
L_ler_bot22:
;TCC_5.c,254 :: 		if (prog==2)                    //programação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot205
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot205:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot23
;TCC_5.c,256 :: 		un2 = ~un2;
	BTG         _un2+0, BitPos(_un2+0) 
;TCC_5.c,257 :: 		}
L_ler_bot23:
;TCC_5.c,258 :: 		}
L_ler_bot21:
;TCC_5.c,259 :: 		}                                 //end if BOTAO2 e b2_flag
L_ler_bot17:
;TCC_5.c,262 :: 		if(!BOTAO3) b3_flag=0x01;
	BTFSC       PORTC+0, 2 
	GOTO        L_ler_bot24
	BSF         _b3_flag+0, BitPos(_b3_flag+0) 
L_ler_bot24:
;TCC_5.c,264 :: 		if(BOTAO3 && b3_flag)
	BTFSS       PORTC+0, 2 
	GOTO        L_ler_bot27
	BTFSS       _b3_flag+0, BitPos(_b3_flag+0) 
	GOTO        L_ler_bot27
L__ler_bot171:
;TCC_5.c,266 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,267 :: 		b3_flag     =  0x00;
	BCF         _b3_flag+0, BitPos(_b3_flag+0) 
;TCC_5.c,268 :: 		if(option==0)                     //depósito de remédio 1
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot206
	MOVLW       0
	XORWF       _option+0, 0 
L__ler_bot206:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot28
;TCC_5.c,270 :: 		if(prog==1)                      //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot207
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot207:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot29
;TCC_5.c,272 :: 		num--;
	MOVLW       1
	SUBWF       _num+0, 1 
	MOVLW       0
	SUBWFB      _num+1, 1 
;TCC_5.c,274 :: 		}
L_ler_bot29:
;TCC_5.c,275 :: 		if (prog==2)                    //ptogramação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot208
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot208:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot30
;TCC_5.c,277 :: 		un = ~un;
	BTG         _un+0, BitPos(_un+0) 
;TCC_5.c,278 :: 		}
L_ler_bot30:
;TCC_5.c,279 :: 		}
L_ler_bot28:
;TCC_5.c,281 :: 		if(option==1)                     //depósito de remédio 2
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot209
	MOVLW       1
	XORWF       _option+0, 0 
L__ler_bot209:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot31
;TCC_5.c,283 :: 		if(prog==1)                      //programação do numero
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot210
	MOVLW       1
	XORWF       _prog+0, 0 
L__ler_bot210:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot32
;TCC_5.c,285 :: 		num2--;
	MOVLW       1
	SUBWF       _num2+0, 1 
	MOVLW       0
	SUBWFB      _num2+1, 1 
;TCC_5.c,287 :: 		}
L_ler_bot32:
;TCC_5.c,288 :: 		if (prog==2)                    //ptogramação de unidade(hora/dia)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot211
	MOVLW       2
	XORWF       _prog+0, 0 
L__ler_bot211:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot33
;TCC_5.c,290 :: 		un2 = ~un2;
	BTG         _un2+0, BitPos(_un2+0) 
;TCC_5.c,291 :: 		}
L_ler_bot33:
;TCC_5.c,292 :: 		}
L_ler_bot31:
;TCC_5.c,293 :: 		}
L_ler_bot27:
;TCC_5.c,296 :: 		if(!BOTAO4) b4_flag=0x01;
	BTFSC       PORTC+0, 4 
	GOTO        L_ler_bot34
	BSF         _b4_flag+0, BitPos(_b4_flag+0) 
L_ler_bot34:
;TCC_5.c,298 :: 		if(BOTAO4 && b4_flag)
	BTFSS       PORTC+0, 4 
	GOTO        L_ler_bot37
	BTFSS       _b4_flag+0, BitPos(_b4_flag+0) 
	GOTO        L_ler_bot37
L__ler_bot170:
;TCC_5.c,300 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,301 :: 		b4_flag    =  0x00;
	BCF         _b4_flag+0, BitPos(_b4_flag+0) 
;TCC_5.c,302 :: 		if(num!=0 || num2!=0)
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot212
	MOVLW       0
	XORWF       _num+0, 0 
L__ler_bot212:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot169
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot213
	MOVLW       0
	XORWF       _num2+0, 0 
L__ler_bot213:
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot169
	GOTO        L_ler_bot40
L__ler_bot169:
;TCC_5.c,304 :: 		if(prog==0)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot214
	MOVLW       0
	XORWF       _prog+0, 0 
L__ler_bot214:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot41
;TCC_5.c,306 :: 		if(!ligar)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot42
;TCC_5.c,308 :: 		temp=0x00;
	CLRF        _temp+0 
	CLRF        _temp+1 
;TCC_5.c,309 :: 		temp2=0x00;
	CLRF        _temp2+0 
	CLRF        _temp2+1 
;TCC_5.c,310 :: 		}
L_ler_bot42:
;TCC_5.c,311 :: 		ligar = ~ligar;
	BTG         _ligar+0, BitPos(_ligar+0) 
;TCC_5.c,312 :: 		if(!ligar) display2 = 0x01;
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_ler_bot43
	BSF         _display2+0, BitPos(_display2+0) 
L_ler_bot43:
;TCC_5.c,313 :: 		}
L_ler_bot41:
;TCC_5.c,314 :: 		}
L_ler_bot40:
;TCC_5.c,315 :: 		}
L_ler_bot37:
;TCC_5.c,317 :: 		if(!un)
	BTFSC       _un+0, BitPos(_un+0) 
	GOTO        L_ler_bot44
;TCC_5.c,319 :: 		mult = num * 1;
	MOVF        _num+0, 0 
	MOVWF       _mult+0 
	MOVF        _num+1, 0 
	MOVWF       _mult+1 
;TCC_5.c,320 :: 		}
L_ler_bot44:
;TCC_5.c,321 :: 		if(un)
	BTFSS       _un+0, BitPos(_un+0) 
	GOTO        L_ler_bot45
;TCC_5.c,323 :: 		mult = num * 5;
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
;TCC_5.c,324 :: 		}
L_ler_bot45:
;TCC_5.c,326 :: 		if(!un2)
	BTFSC       _un2+0, BitPos(_un2+0) 
	GOTO        L_ler_bot46
;TCC_5.c,328 :: 		mult2 = num2 * 1;
	MOVF        _num2+0, 0 
	MOVWF       _mult2+0 
	MOVF        _num2+1, 0 
	MOVWF       _mult2+1 
;TCC_5.c,329 :: 		}
L_ler_bot46:
;TCC_5.c,330 :: 		if(un2)
	BTFSS       _un2+0, BitPos(_un2+0) 
	GOTO        L_ler_bot47
;TCC_5.c,332 :: 		mult2 = num2 * 5;
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
;TCC_5.c,333 :: 		}
L_ler_bot47:
;TCC_5.c,336 :: 		if(!BOTAO5) b5_flag = 0x01;
	BTFSC       PORTC+0, 5 
	GOTO        L_ler_bot48
	BSF         _b5_flag+0, BitPos(_b5_flag+0) 
L_ler_bot48:
;TCC_5.c,338 :: 		if(BOTAO5 && b5_flag)
	BTFSS       PORTC+0, 5 
	GOTO        L_ler_bot51
	BTFSS       _b5_flag+0, BitPos(_b5_flag+0) 
	GOTO        L_ler_bot51
L__ler_bot168:
;TCC_5.c,340 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;TCC_5.c,341 :: 		b5_flag = 0x00;
	BCF         _b5_flag+0, BitPos(_b5_flag+0) 
;TCC_5.c,342 :: 		if(prog != 0)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot215
	MOVLW       0
	XORWF       _prog+0, 0 
L__ler_bot215:
	BTFSC       STATUS+0, 2 
	GOTO        L_ler_bot52
;TCC_5.c,344 :: 		option++;
	INFSNZ      _option+0, 1 
	INCF        _option+1, 1 
;TCC_5.c,345 :: 		if(option == 2) option=0x00;
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ler_bot216
	MOVLW       2
	XORWF       _option+0, 0 
L__ler_bot216:
	BTFSS       STATUS+0, 2 
	GOTO        L_ler_bot53
	CLRF        _option+0 
	CLRF        _option+1 
L_ler_bot53:
;TCC_5.c,346 :: 		}
L_ler_bot52:
;TCC_5.c,347 :: 		}
L_ler_bot51:
;TCC_5.c,349 :: 		}                                   //end ler_bot()
L_end_ler_bot:
	RETURN      0
; end of _ler_bot

_disp:

;TCC_5.c,351 :: 		void disp()
;TCC_5.c,353 :: 		if(!ligar && prog==0)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_disp56
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp218
	MOVLW       0
	XORWF       _prog+0, 0 
L__disp218:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp56
L__disp177:
;TCC_5.c,355 :: 		if(!display && !display2)
	BTFSC       _display+0, BitPos(_display+0) 
	GOTO        L_disp59
	BTFSC       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp59
L__disp176:
;TCC_5.c,357 :: 		LCD_Out(1,1,"  DISPENSER DE  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,358 :: 		LCD_Out(2,1,"    REMEDIOS    ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,359 :: 		}
	GOTO        L_disp60
L_disp59:
;TCC_5.c,362 :: 		if(display && !display2)
	BTFSS       _display+0, BitPos(_display+0) 
	GOTO        L_disp63
	BTFSC       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp63
L__disp175:
;TCC_5.c,364 :: 		display=0x00;
	BCF         _display+0, BitPos(_display+0) 
;TCC_5.c,365 :: 		LCD_Out(1,1,"ETEC LAURO GOMES");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,366 :: 		LCD_Out(2,1,"  3A MECA 2021  ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,367 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_disp64:
	DECFSZ      R13, 1, 1
	BRA         L_disp64
	DECFSZ      R12, 1, 1
	BRA         L_disp64
	DECFSZ      R11, 1, 1
	BRA         L_disp64
	NOP
	NOP
;TCC_5.c,368 :: 		}
L_disp63:
;TCC_5.c,369 :: 		if(!display && display2)
	BTFSC       _display+0, BitPos(_display+0) 
	GOTO        L_disp67
	BTFSS       _display2+0, BitPos(_display2+0) 
	GOTO        L_disp67
L__disp174:
;TCC_5.c,371 :: 		display2=0x00;
	BCF         _display2+0, BitPos(_display2+0) 
;TCC_5.c,372 :: 		LCD_Out(1,1,"     PARANDO    ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,373 :: 		LCD_Out(2,1,"     CONTAGEM   ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,374 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_disp68:
	DECFSZ      R13, 1, 1
	BRA         L_disp68
	DECFSZ      R12, 1, 1
	BRA         L_disp68
	DECFSZ      R11, 1, 1
	BRA         L_disp68
	NOP
	NOP
;TCC_5.c,375 :: 		}
L_disp67:
;TCC_5.c,376 :: 		}
L_disp60:
;TCC_5.c,377 :: 		}
L_disp56:
;TCC_5.c,379 :: 		if(prog==1)                       //programação de numeros
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp219
	MOVLW       1
	XORWF       _prog+0, 0 
L__disp219:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp69
;TCC_5.c,381 :: 		LCD_Out(1,1,"PROGRAME NUMERO:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,382 :: 		num_un();
	CALL        _num_un+0, 0
;TCC_5.c,383 :: 		if(option==0) LCD_Chr(2,14,'1');
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp220
	MOVLW       0
	XORWF       _option+0, 0 
L__disp220:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp70
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp70:
;TCC_5.c,384 :: 		if(option==1) LCD_Chr(2,14,'2');
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp221
	MOVLW       1
	XORWF       _option+0, 0 
L__disp221:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp71
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp71:
;TCC_5.c,385 :: 		}
L_disp69:
;TCC_5.c,387 :: 		if(prog==2)
	MOVLW       0
	XORWF       _prog+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp222
	MOVLW       2
	XORWF       _prog+0, 0 
L__disp222:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp72
;TCC_5.c,389 :: 		LCD_Out(1,1,"PROGRAME Un.:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,390 :: 		num_un();
	CALL        _num_un+0, 0
;TCC_5.c,391 :: 		if(option==0) LCD_Chr(2,14,'1');
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp223
	MOVLW       0
	XORWF       _option+0, 0 
L__disp223:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp73
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp73:
;TCC_5.c,392 :: 		if(option==1) LCD_Chr(2,14,'2');
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp224
	MOVLW       1
	XORWF       _option+0, 0 
L__disp224:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp74
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp74:
;TCC_5.c,393 :: 		}
L_disp72:
;TCC_5.c,395 :: 		if(ligar)
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_disp75
;TCC_5.c,397 :: 		LCD_Out(1,1,"CONTANDO:   DISP");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_TCC_5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_TCC_5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;TCC_5.c,398 :: 		if(temp_disp>20) temp_disp=0x00;
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_disp+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp225
	MOVF        _temp_disp+0, 0 
	SUBLW       20
L__disp225:
	BTFSC       STATUS+0, 0 
	GOTO        L_disp76
	CLRF        _temp_disp+0 
	CLRF        _temp_disp+1 
L_disp76:
;TCC_5.c,399 :: 		if(temp_disp == 20)
	MOVLW       0
	XORWF       _temp_disp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp226
	MOVLW       20
	XORWF       _temp_disp+0, 0 
L__disp226:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp77
;TCC_5.c,401 :: 		temp_disp=0x00;
	CLRF        _temp_disp+0 
	CLRF        _temp_disp+1 
;TCC_5.c,402 :: 		option++;
	INFSNZ      _option+0, 1 
	INCF        _option+1, 1 
;TCC_5.c,403 :: 		if(option == 2) option=0x00;
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp227
	MOVLW       2
	XORWF       _option+0, 0 
L__disp227:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp78
	CLRF        _option+0 
	CLRF        _option+1 
L_disp78:
;TCC_5.c,405 :: 		if(option==0) LCD_Chr(2,14,'1');
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp228
	MOVLW       0
	XORWF       _option+0, 0 
L__disp228:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp79
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp79:
;TCC_5.c,406 :: 		if(option==1) LCD_Chr(2,14,'2');
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__disp229
	MOVLW       1
	XORWF       _option+0, 0 
L__disp229:
	BTFSS       STATUS+0, 2 
	GOTO        L_disp80
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       50
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_disp80:
;TCC_5.c,407 :: 		}
L_disp77:
;TCC_5.c,408 :: 		num_un();
	CALL        _num_un+0, 0
;TCC_5.c,409 :: 		}
L_disp75:
;TCC_5.c,411 :: 		}                                   //end disp()
L_end_disp:
	RETURN      0
; end of _disp

_num_un:

;TCC_5.c,413 :: 		void num_un()
;TCC_5.c,416 :: 		if(option==0)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un231
	MOVLW       0
	XORWF       _option+0, 0 
L__num_un231:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un81
;TCC_5.c,418 :: 		dig2 = num/10;
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
;TCC_5.c,419 :: 		dig1 = num%10;
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,421 :: 		LCD_Chr(2,2,dig2+0x30);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,422 :: 		LCD_Chr_Cp (dig1+0x30);
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,424 :: 		if(!un) LCD_Out(2,5,hora);
	BTFSC       _un+0, BitPos(_un+0) 
	GOTO        L_num_un82
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un82:
;TCC_5.c,426 :: 		if(un) LCD_Out(2,5,dia);
	BTFSS       _un+0, BitPos(_un+0) 
	GOTO        L_num_un83
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un83:
;TCC_5.c,427 :: 		}
L_num_un81:
;TCC_5.c,428 :: 		if(option==1)
	MOVLW       0
	XORWF       _option+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__num_un232
	MOVLW       1
	XORWF       _option+0, 0 
L__num_un232:
	BTFSS       STATUS+0, 2 
	GOTO        L_num_un84
;TCC_5.c,430 :: 		dig2 = num2/10;
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
;TCC_5.c,431 :: 		dig1 = num2%10;
	MOVF        R0, 0 
	MOVWF       num_un_dig1_L0+0 
;TCC_5.c,433 :: 		LCD_Chr(2,2,dig2+0x30);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       FLOC__num_un+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;TCC_5.c,434 :: 		LCD_Chr_Cp (dig1+0x30);
	MOVLW       48
	ADDWF       num_un_dig1_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;TCC_5.c,436 :: 		if(!un2) LCD_Out(2,5,hora);
	BTFSC       _un2+0, BitPos(_un2+0) 
	GOTO        L_num_un85
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un85:
;TCC_5.c,438 :: 		if(un2) LCD_Out(2,5,dia);
	BTFSS       _un2+0, BitPos(_un2+0) 
	GOTO        L_num_un86
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _dia+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_dia+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_num_un86:
;TCC_5.c,439 :: 		}
L_num_un84:
;TCC_5.c,440 :: 		}                                   //end num_un()
L_end_num_un:
	RETURN      0
; end of _num_un

_piscaLED:

;TCC_5.c,442 :: 		void piscaLED()
;TCC_5.c,445 :: 		if(ligar && !toque && num!=0)
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED89
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L_piscaLED89
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED234
	MOVLW       0
	XORWF       _num+0, 0 
L__piscaLED234:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED89
L__piscaLED181:
;TCC_5.c,447 :: 		if(temp_led>=10)                //1s      / LED Indicação disp1
	MOVLW       0
	SUBWF       _temp_led+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED235
	MOVLW       10
	SUBWF       _temp_led+0, 0 
L__piscaLED235:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED90
;TCC_5.c,449 :: 		temp_led = 0x00;
	CLRF        _temp_led+0 
	CLRF        _temp_led+1 
;TCC_5.c,450 :: 		LED  = ~LED;
	BTG         PORTA+0, 0 
;TCC_5.c,451 :: 		}
L_piscaLED90:
;TCC_5.c,452 :: 		}
	GOTO        L_piscaLED91
L_piscaLED89:
;TCC_5.c,455 :: 		if(ligar && toque)
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED94
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_piscaLED94
L__piscaLED180:
;TCC_5.c,457 :: 		if(temp_led>=2)                //200ms
	MOVLW       0
	SUBWF       _temp_led+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED236
	MOVLW       2
	SUBWF       _temp_led+0, 0 
L__piscaLED236:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED95
;TCC_5.c,459 :: 		temp_led=0x00;
	CLRF        _temp_led+0 
	CLRF        _temp_led+1 
;TCC_5.c,460 :: 		LED = ~LED;
	BTG         PORTA+0, 0 
;TCC_5.c,461 :: 		}
L_piscaLED95:
;TCC_5.c,462 :: 		}
	GOTO        L_piscaLED96
L_piscaLED94:
;TCC_5.c,463 :: 		else LED = 0x00;
	BCF         PORTA+0, 0 
L_piscaLED96:
;TCC_5.c,464 :: 		}
L_piscaLED91:
;TCC_5.c,468 :: 		if(temp_led2 ==5)                //0,5s  / LED Indicação on
	MOVLW       0
	XORWF       _temp_led2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED237
	MOVLW       5
	XORWF       _temp_led2+0, 0 
L__piscaLED237:
	BTFSS       STATUS+0, 2 
	GOTO        L_piscaLED97
;TCC_5.c,470 :: 		temp_led2=0x00;
	CLRF        _temp_led2+0 
	CLRF        _temp_led2+1 
;TCC_5.c,471 :: 		LED2 = ~LED2;
	BTG         PORTA+0, 3 
;TCC_5.c,472 :: 		}
L_piscaLED97:
;TCC_5.c,474 :: 		if(ligar && !toque2 && num2!=0)
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED100
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_piscaLED100
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED238
	MOVLW       0
	XORWF       _num2+0, 0 
L__piscaLED238:
	BTFSC       STATUS+0, 2 
	GOTO        L_piscaLED100
L__piscaLED179:
;TCC_5.c,476 :: 		if(temp_led3>=10)               //1s / LED Indicação disp2
	MOVLW       0
	SUBWF       _temp_led3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED239
	MOVLW       10
	SUBWF       _temp_led3+0, 0 
L__piscaLED239:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED101
;TCC_5.c,478 :: 		temp_led3 = 0x00;
	CLRF        _temp_led3+0 
	CLRF        _temp_led3+1 
;TCC_5.c,479 :: 		LED3 = ~LED3;
	BTG         PORTB+0, 0 
;TCC_5.c,480 :: 		}
L_piscaLED101:
;TCC_5.c,481 :: 		}
	GOTO        L_piscaLED102
L_piscaLED100:
;TCC_5.c,484 :: 		if(ligar && toque2)
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_piscaLED105
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_piscaLED105
L__piscaLED178:
;TCC_5.c,486 :: 		if(temp_led3>=2)                //200ms
	MOVLW       0
	SUBWF       _temp_led3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED240
	MOVLW       2
	SUBWF       _temp_led3+0, 0 
L__piscaLED240:
	BTFSS       STATUS+0, 0 
	GOTO        L_piscaLED106
;TCC_5.c,488 :: 		temp_led3=0x00;
	CLRF        _temp_led3+0 
	CLRF        _temp_led3+1 
;TCC_5.c,489 :: 		LED3 = ~LED3;
	BTG         PORTB+0, 0 
;TCC_5.c,490 :: 		}
L_piscaLED106:
;TCC_5.c,491 :: 		}
	GOTO        L_piscaLED107
L_piscaLED105:
;TCC_5.c,492 :: 		else LED3 = 0x00;
	BCF         PORTB+0, 0 
L_piscaLED107:
;TCC_5.c,493 :: 		}
L_piscaLED102:
;TCC_5.c,495 :: 		}                                   //end piscaLED()
L_end_piscaLED:
	RETURN      0
; end of _piscaLED

_timebase:

;TCC_5.c,497 :: 		void timebase()
;TCC_5.c,499 :: 		if(!ligar)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase108
;TCC_5.c,501 :: 		temp_ligado = 0x00;
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
;TCC_5.c,502 :: 		}
L_timebase108:
;TCC_5.c,503 :: 		if(ligar && num!=0)
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase111
	MOVLW       0
	XORWF       _num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase242
	MOVLW       0
	XORWF       _num+0, 0 
L__timebase242:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase111
L__timebase182:
;TCC_5.c,505 :: 		if(temp==10)
	MOVLW       0
	XORWF       _temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase243
	MOVLW       10
	XORWF       _temp+0, 0 
L__timebase243:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase112
;TCC_5.c,507 :: 		temp = 0x00;
	CLRF        _temp+0 
	CLRF        _temp+1 
;TCC_5.c,508 :: 		temp_ligado++;
	INFSNZ      _temp_ligado+0, 1 
	INCF        _temp_ligado+1, 1 
;TCC_5.c,509 :: 		}
L_timebase112:
;TCC_5.c,510 :: 		if(temp_ligado==mult)
	MOVF        _temp_ligado+1, 0 
	XORWF       _mult+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase244
	MOVF        _mult+0, 0 
	XORWF       _temp_ligado+0, 0 
L__timebase244:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase113
;TCC_5.c,512 :: 		toque = 0x01;
	BSF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,513 :: 		atv_mot = 0x01;
	BSF         _atv_mot+0, BitPos(_atv_mot+0) 
;TCC_5.c,514 :: 		abre_mot();
	CALL        _abre_mot+0, 0
;TCC_5.c,515 :: 		}
L_timebase113:
;TCC_5.c,516 :: 		if(atv_mot)
	BTFSS       _atv_mot+0, BitPos(_atv_mot+0) 
	GOTO        L_timebase114
;TCC_5.c,518 :: 		read_motbits();
	CALL        _read_motbits+0, 0
;TCC_5.c,520 :: 		}
	GOTO        L_timebase115
L_timebase114:
;TCC_5.c,523 :: 		alarme();
	CALL        _alarme+0, 0
;TCC_5.c,524 :: 		}
L_timebase115:
;TCC_5.c,525 :: 		}                                 //end if ligar
L_timebase111:
;TCC_5.c,527 :: 		}                                   //end timebase()
L_end_timebase:
	RETURN      0
; end of _timebase

_timebase2:

;TCC_5.c,529 :: 		void timebase2()
;TCC_5.c,531 :: 		if(!ligar)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase2116
;TCC_5.c,533 :: 		temp_ligado2 = 0x00;
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
;TCC_5.c,534 :: 		}
L_timebase2116:
;TCC_5.c,535 :: 		if(ligar && num2!=0)
	BTFSS       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_timebase2119
	MOVLW       0
	XORWF       _num2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2246
	MOVLW       0
	XORWF       _num2+0, 0 
L__timebase2246:
	BTFSC       STATUS+0, 2 
	GOTO        L_timebase2119
L__timebase2183:
;TCC_5.c,537 :: 		if(temp2==10)
	MOVLW       0
	XORWF       _temp2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2247
	MOVLW       10
	XORWF       _temp2+0, 0 
L__timebase2247:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase2120
;TCC_5.c,539 :: 		temp2 = 0x00;
	CLRF        _temp2+0 
	CLRF        _temp2+1 
;TCC_5.c,540 :: 		temp_ligado2++;
	INFSNZ      _temp_ligado2+0, 1 
	INCF        _temp_ligado2+1, 1 
;TCC_5.c,541 :: 		}
L_timebase2120:
;TCC_5.c,542 :: 		if(temp_ligado2==mult2)
	MOVF        _temp_ligado2+1, 0 
	XORWF       _mult2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__timebase2248
	MOVF        _mult2+0, 0 
	XORWF       _temp_ligado2+0, 0 
L__timebase2248:
	BTFSS       STATUS+0, 2 
	GOTO        L_timebase2121
;TCC_5.c,544 :: 		toque2 = 0x01;
	BSF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,545 :: 		atv_mot2 = 0x01;
	BSF         _atv_mot2+0, BitPos(_atv_mot2+0) 
;TCC_5.c,546 :: 		abre_mot2();
	CALL        _abre_mot2+0, 0
;TCC_5.c,547 :: 		}
L_timebase2121:
;TCC_5.c,548 :: 		if(atv_mot2)
	BTFSS       _atv_mot2+0, BitPos(_atv_mot2+0) 
	GOTO        L_timebase2122
;TCC_5.c,550 :: 		read_motbits();
	CALL        _read_motbits+0, 0
;TCC_5.c,551 :: 		}
	GOTO        L_timebase2123
L_timebase2122:
;TCC_5.c,554 :: 		alarme();
	CALL        _alarme+0, 0
;TCC_5.c,555 :: 		}
L_timebase2123:
;TCC_5.c,556 :: 		}                                 //end if ligar
L_timebase2119:
;TCC_5.c,558 :: 		}                                   //end timebase2()
L_end_timebase2:
	RETURN      0
; end of _timebase2

_alarme:

;TCC_5.c,562 :: 		void alarme()
;TCC_5.c,564 :: 		if(toque || toque2)
	BTFSC       _toque+0, BitPos(_toque+0) 
	GOTO        L__alarme184
	BTFSC       _toque2+0, BitPos(_toque2+0) 
	GOTO        L__alarme184
	GOTO        L_alarme126
L__alarme184:
;TCC_5.c,566 :: 		if(vezes <10)
	MOVLW       0
	SUBWF       _vezes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__alarme250
	MOVLW       10
	SUBWF       _vezes+0, 0 
L__alarme250:
	BTFSC       STATUS+0, 0 
	GOTO        L_alarme127
;TCC_5.c,568 :: 		toca_som();
	CALL        _toca_som+0, 0
;TCC_5.c,569 :: 		}
	GOTO        L_alarme128
L_alarme127:
;TCC_5.c,572 :: 		if(toque)
	BTFSS       _toque+0, BitPos(_toque+0) 
	GOTO        L_alarme129
;TCC_5.c,574 :: 		toque=0x00;
	BCF         _toque+0, BitPos(_toque+0) 
;TCC_5.c,575 :: 		temp_ligado=0x00;
	CLRF        _temp_ligado+0 
	CLRF        _temp_ligado+1 
;TCC_5.c,576 :: 		}
L_alarme129:
;TCC_5.c,577 :: 		if(toque2)
	BTFSS       _toque2+0, BitPos(_toque2+0) 
	GOTO        L_alarme130
;TCC_5.c,579 :: 		toque2=0x00;
	BCF         _toque2+0, BitPos(_toque2+0) 
;TCC_5.c,580 :: 		temp_ligado2=0x00;
	CLRF        _temp_ligado2+0 
	CLRF        _temp_ligado2+1 
;TCC_5.c,581 :: 		}
L_alarme130:
;TCC_5.c,582 :: 		vezes=0x00;
	CLRF        _vezes+0 
	CLRF        _vezes+1 
;TCC_5.c,583 :: 		SOM = 0x00;
	BCF         PORTA+0, 2 
;TCC_5.c,584 :: 		}
L_alarme128:
;TCC_5.c,585 :: 		}
L_alarme126:
;TCC_5.c,586 :: 		}                                   //end alarme()
L_end_alarme:
	RETURN      0
; end of _alarme

_toca_som:

;TCC_5.c,590 :: 		void toca_som()
;TCC_5.c,592 :: 		if(temp_som>3) temp_som=0x00;
	MOVLW       0
	MOVWF       R0 
	MOVF        _temp_som+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__toca_som252
	MOVF        _temp_som+0, 0 
	SUBLW       3
L__toca_som252:
	BTFSC       STATUS+0, 0 
	GOTO        L_toca_som131
	CLRF        _temp_som+0 
	CLRF        _temp_som+1 
L_toca_som131:
;TCC_5.c,593 :: 		if(temp_som==3)
	MOVLW       0
	XORWF       _temp_som+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__toca_som253
	MOVLW       3
	XORWF       _temp_som+0, 0 
L__toca_som253:
	BTFSS       STATUS+0, 2 
	GOTO        L_toca_som132
;TCC_5.c,595 :: 		temp_som = 0x00;
	CLRF        _temp_som+0 
	CLRF        _temp_som+1 
;TCC_5.c,596 :: 		SOM = ~SOM;
	BTG         PORTA+0, 2 
;TCC_5.c,597 :: 		vezes++;
	INFSNZ      _vezes+0, 1 
	INCF        _vezes+1, 1 
;TCC_5.c,598 :: 		if(!ligar)
	BTFSC       _ligar+0, BitPos(_ligar+0) 
	GOTO        L_toca_som133
;TCC_5.c,600 :: 		vezes = 0x00;
	CLRF        _vezes+0 
	CLRF        _vezes+1 
;TCC_5.c,601 :: 		SOM   = 0x00;
	BCF         PORTA+0, 2 
;TCC_5.c,602 :: 		}
L_toca_som133:
;TCC_5.c,603 :: 		}
L_toca_som132:
;TCC_5.c,604 :: 		}
L_end_toca_som:
	RETURN      0
; end of _toca_som

_abre_mot:

;TCC_5.c,606 :: 		void abre_mot()
;TCC_5.c,608 :: 		open_bit  = 0x01;
	BSF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,609 :: 		close_bit = 0x00;
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,610 :: 		x_mot     = 0x00;
	CLRF        _x_mot+0 
	CLRF        _x_mot+1 
;TCC_5.c,611 :: 		}                                         //end abre_mot()
L_end_abre_mot:
	RETURN      0
; end of _abre_mot

_abre_mot2:

;TCC_5.c,613 :: 		void abre_mot2()
;TCC_5.c,615 :: 		open_bit2  = 0x01;
	BSF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,616 :: 		close_bit2 = 0x00;
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,617 :: 		x_mot2     = 0x00;
	CLRF        _x_mot2+0 
	CLRF        _x_mot2+1 
;TCC_5.c,618 :: 		}                                         //end abre_mot2()
L_end_abre_mot2:
	RETURN      0
; end of _abre_mot2

_mot_aberto:

;TCC_5.c,620 :: 		void mot_aberto()
;TCC_5.c,622 :: 		if(x_mot<10)
	MOVLW       0
	SUBWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto257
	MOVLW       10
	SUBWF       _x_mot+0, 0 
L__mot_aberto257:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto134
;TCC_5.c,624 :: 		SM=0;
	BCF         PORTA+0, 1 
;TCC_5.c,625 :: 		delay_us(18000);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto135:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto135
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto135
	NOP
	NOP
;TCC_5.c,626 :: 		SM=1;
	BSF         PORTA+0, 1 
;TCC_5.c,627 :: 		delay_us(2000);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto136:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto136
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto136
	NOP
;TCC_5.c,628 :: 		SM=0;
	BCF         PORTA+0, 1 
;TCC_5.c,629 :: 		x_mot ++;
	INFSNZ      _x_mot+0, 1 
	INCF        _x_mot+1, 1 
;TCC_5.c,630 :: 		}
L_mot_aberto134:
;TCC_5.c,631 :: 		if(x_mot == 10)
	MOVLW       0
	XORWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto258
	MOVLW       10
	XORWF       _x_mot+0, 0 
L__mot_aberto258:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto137
;TCC_5.c,633 :: 		fecha_mot();
	CALL        _fecha_mot+0, 0
;TCC_5.c,634 :: 		}
L_mot_aberto137:
;TCC_5.c,637 :: 		}                                         //end mot_aberto()
L_end_mot_aberto:
	RETURN      0
; end of _mot_aberto

_mot_aberto2:

;TCC_5.c,639 :: 		void mot_aberto2()
;TCC_5.c,641 :: 		if(x_mot2<10)
	MOVLW       0
	SUBWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2260
	MOVLW       10
	SUBWF       _x_mot2+0, 0 
L__mot_aberto2260:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_aberto2138
;TCC_5.c,643 :: 		SM2=0;
	BCF         PORTA+0, 4 
;TCC_5.c,644 :: 		delay_us(18000);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_mot_aberto2139:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto2139
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto2139
	NOP
	NOP
;TCC_5.c,645 :: 		SM2=1;
	BSF         PORTA+0, 4 
;TCC_5.c,646 :: 		delay_us(2000);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_mot_aberto2140:
	DECFSZ      R13, 1, 1
	BRA         L_mot_aberto2140
	DECFSZ      R12, 1, 1
	BRA         L_mot_aberto2140
	NOP
;TCC_5.c,647 :: 		SM2=0;
	BCF         PORTA+0, 4 
;TCC_5.c,648 :: 		x_mot2 ++;
	INFSNZ      _x_mot2+0, 1 
	INCF        _x_mot2+1, 1 
;TCC_5.c,649 :: 		}
L_mot_aberto2138:
;TCC_5.c,650 :: 		if(x_mot2 == 10)
	MOVLW       0
	XORWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_aberto2261
	MOVLW       10
	XORWF       _x_mot2+0, 0 
L__mot_aberto2261:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_aberto2141
;TCC_5.c,652 :: 		fecha_mot2();
	CALL        _fecha_mot2+0, 0
;TCC_5.c,653 :: 		}
L_mot_aberto2141:
;TCC_5.c,654 :: 		}                                         //end mot_aberto2()
L_end_mot_aberto2:
	RETURN      0
; end of _mot_aberto2

_fecha_mot:

;TCC_5.c,657 :: 		void fecha_mot()
;TCC_5.c,659 :: 		open_bit  = 0x00;
	BCF         _open_bit+0, BitPos(_open_bit+0) 
;TCC_5.c,660 :: 		close_bit = 0x01;
	BSF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,661 :: 		x_mot     = 0x00;
	CLRF        _x_mot+0 
	CLRF        _x_mot+1 
;TCC_5.c,662 :: 		}                                         //end fecha_mot()
L_end_fecha_mot:
	RETURN      0
; end of _fecha_mot

_fecha_mot2:

;TCC_5.c,664 :: 		void fecha_mot2()
;TCC_5.c,666 :: 		open_bit2  = 0x00;
	BCF         _open_bit2+0, BitPos(_open_bit2+0) 
;TCC_5.c,667 :: 		close_bit2 = 0x01;
	BSF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,668 :: 		x_mot2     = 0x00;
	CLRF        _x_mot2+0 
	CLRF        _x_mot2+1 
;TCC_5.c,669 :: 		}                                         //end fecha_mot2()
L_end_fecha_mot2:
	RETURN      0
; end of _fecha_mot2

_mot_fechado:

;TCC_5.c,671 :: 		void mot_fechado()
;TCC_5.c,673 :: 		if(x_mot<10)
	MOVLW       0
	SUBWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado265
	MOVLW       10
	SUBWF       _x_mot+0, 0 
L__mot_fechado265:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado142
;TCC_5.c,675 :: 		SM=0;
	BCF         PORTA+0, 1 
;TCC_5.c,676 :: 		delay_us(18500);
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado143:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado143
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado143
	NOP
	NOP
;TCC_5.c,677 :: 		SM=1;
	BSF         PORTA+0, 1 
;TCC_5.c,678 :: 		delay_us(1500);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado144:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado144
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado144
	NOP
;TCC_5.c,679 :: 		SM=0;
	BCF         PORTA+0, 1 
;TCC_5.c,680 :: 		x_mot++;
	INFSNZ      _x_mot+0, 1 
	INCF        _x_mot+1, 1 
;TCC_5.c,681 :: 		}
L_mot_fechado142:
;TCC_5.c,682 :: 		if(x_mot==10)
	MOVLW       0
	XORWF       _x_mot+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado266
	MOVLW       10
	XORWF       _x_mot+0, 0 
L__mot_fechado266:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado145
;TCC_5.c,684 :: 		close_bit = 0x00;
	BCF         _close_bit+0, BitPos(_close_bit+0) 
;TCC_5.c,685 :: 		}
L_mot_fechado145:
;TCC_5.c,687 :: 		}                                            //end mot_fechado
L_end_mot_fechado:
	RETURN      0
; end of _mot_fechado

_mot_fechado2:

;TCC_5.c,689 :: 		void mot_fechado2()
;TCC_5.c,691 :: 		if(x_mot2<10)
	MOVLW       0
	SUBWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2268
	MOVLW       10
	SUBWF       _x_mot2+0, 0 
L__mot_fechado2268:
	BTFSC       STATUS+0, 0 
	GOTO        L_mot_fechado2146
;TCC_5.c,693 :: 		SM2=0;
	BCF         PORTA+0, 4 
;TCC_5.c,694 :: 		delay_us(18500);
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       11
	MOVWF       R13, 0
L_mot_fechado2147:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado2147
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado2147
	NOP
	NOP
;TCC_5.c,695 :: 		SM2=1;
	BSF         PORTA+0, 4 
;TCC_5.c,696 :: 		delay_us(1500);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_mot_fechado2148:
	DECFSZ      R13, 1, 1
	BRA         L_mot_fechado2148
	DECFSZ      R12, 1, 1
	BRA         L_mot_fechado2148
	NOP
;TCC_5.c,697 :: 		SM2=0;
	BCF         PORTA+0, 4 
;TCC_5.c,698 :: 		x_mot2++;
	INFSNZ      _x_mot2+0, 1 
	INCF        _x_mot2+1, 1 
;TCC_5.c,699 :: 		}
L_mot_fechado2146:
;TCC_5.c,700 :: 		if(x_mot2==10)
	MOVLW       0
	XORWF       _x_mot2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mot_fechado2269
	MOVLW       10
	XORWF       _x_mot2+0, 0 
L__mot_fechado2269:
	BTFSS       STATUS+0, 2 
	GOTO        L_mot_fechado2149
;TCC_5.c,702 :: 		close_bit2 = 0x00;
	BCF         _close_bit2+0, BitPos(_close_bit2+0) 
;TCC_5.c,703 :: 		}
L_mot_fechado2149:
;TCC_5.c,704 :: 		}                                            //end mot_fechado2()
L_end_mot_fechado2:
	RETURN      0
; end of _mot_fechado2

_read_motbits:

;TCC_5.c,706 :: 		void read_motbits()
;TCC_5.c,708 :: 		if(!open_bit && !close_bit) atv_mot = 0x00;
	BTFSC       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits152
	BTFSC       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits152
L__read_motbits190:
	BCF         _atv_mot+0, BitPos(_atv_mot+0) 
L_read_motbits152:
;TCC_5.c,710 :: 		if(open_bit && !close_bit)
	BTFSS       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits155
	BTFSC       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits155
L__read_motbits189:
;TCC_5.c,712 :: 		mot_aberto();
	CALL        _mot_aberto+0, 0
;TCC_5.c,713 :: 		}
L_read_motbits155:
;TCC_5.c,715 :: 		if(!open_bit && close_bit)
	BTFSC       _open_bit+0, BitPos(_open_bit+0) 
	GOTO        L_read_motbits158
	BTFSS       _close_bit+0, BitPos(_close_bit+0) 
	GOTO        L_read_motbits158
L__read_motbits188:
;TCC_5.c,717 :: 		mot_fechado();
	CALL        _mot_fechado+0, 0
;TCC_5.c,718 :: 		}
L_read_motbits158:
;TCC_5.c,720 :: 		if(!open_bit2 && !close_bit2) atv_mot2 = 0x00;
	BTFSC       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits161
	BTFSC       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits161
L__read_motbits187:
	BCF         _atv_mot2+0, BitPos(_atv_mot2+0) 
L_read_motbits161:
;TCC_5.c,722 :: 		if(open_bit2 && !close_bit2)
	BTFSS       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits164
	BTFSC       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits164
L__read_motbits186:
;TCC_5.c,724 :: 		mot_aberto2();
	CALL        _mot_aberto2+0, 0
;TCC_5.c,725 :: 		}
L_read_motbits164:
;TCC_5.c,727 :: 		if(!open_bit2 && close_bit2)
	BTFSC       _open_bit2+0, BitPos(_open_bit2+0) 
	GOTO        L_read_motbits167
	BTFSS       _close_bit2+0, BitPos(_close_bit2+0) 
	GOTO        L_read_motbits167
L__read_motbits185:
;TCC_5.c,729 :: 		mot_fechado2();
	CALL        _mot_fechado2+0, 0
;TCC_5.c,730 :: 		}
L_read_motbits167:
;TCC_5.c,731 :: 		}                                              //end read_motbits()
L_end_read_motbits:
	RETURN      0
; end of _read_motbits
