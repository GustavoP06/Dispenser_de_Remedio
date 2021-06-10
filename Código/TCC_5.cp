#line 1 "C:/Users/guga_/Documents/GitHub/Dispenser_de_Remedio/Código/TCC_5.c"
#line 19 "C:/Users/guga_/Documents/GitHub/Dispenser_de_Remedio/Código/TCC_5.c"
sbit LED at PORTA.b0;
sbit SOM at PORTA.b2;
sbit LED2 at PORTA.b3;
sbit LED3 at PORTB.b0;
sbit LED4 at PORTB.b1;
sbit LED5 at PORTB.b3;


sbit SM at PORTA.b1;
sbit SM2 at PORTA.b4;
sbit SM3 at PORTA.b5;
sbit SM4 at PORTB.b2;


sbit LCD_RS at PORTD.b2;
sbit LCD_EN at PORTD.b3;
sbit LCD_D7 at PORTD.b7;
sbit LCD_D6 at PORTD.b6;
sbit LCD_D5 at PORTD.b5;
sbit LCD_D4 at PORTD.b4;


sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;


sbit BOTAO1 at PORTC.b0;
sbit BOTAO2 at PORTC.b1;
sbit BOTAO3 at PORTC.b2;
sbit BOTAO4 at PORTC.b4;
sbit BOTAO5 at PORTC.b5;




void ler_bot();
void disp();
void num_un();
void alarme();
void piscaLED();
void timebase();
void timebase2();
void timebase3();
void timebase4();
void toca_som();
void abre_mot();
void abre_mot2();
void abre_mot3();
void abre_mot4();
void fecha_mot();
void fecha_mot2();
void fecha_mot3();
void fecha_mot4();
void mot_aberto();
void mot_aberto2();
void mot_aberto3();
void mot_aberto4();
void mot_fechado();
void mot_fechado2();
void mot_fechado3();
void mot_fechado4();
void read_motbits();
void fast_incr();




unsigned temp2 = 0x00,
 temp = 0x00,
 temp3 = 0x00,
 temp4 = 0x00,
 temp_ligado = 0x00,
 temp_ligado2 = 0x00,
 temp_ligado3 = 0x00,
 temp_ligado4 = 0x00,
 temp_led = 0x00,
 temp_led2 = 0x00,
 temp_led3 = 0x00,
 temp_led4 = 0x00,
 temp_led5 = 0x00,
 temp_som = 0x00,
 temp_disp = 0x00,
 x_mot = 0x00,
 x_mot2 = 0x00,
 x_mot3 = 0x00,
 x_mot4 = 0x00,
 prog = 0x00,
 num,
 num2,
 num3,
 num4,
 mult = 0x00,
 mult2 = 0x00,
 mult3 = 0x00,
 mult4 = 0x00,
 vezes = 0x00,
 option = 0x00,
 temp_inc = 0x00,
 temp_num = 0x00,
 qtd_comp,
 qtd_comp2,
 qtd_comp3,
 qtd_comp4,
 comp = 0x00,
 comp2 = 0x00,
 comp3 = 0x00,
 comp4 = 0x00;

bit ligar,
 un,
 un2,
 un3,
 un4,
 display,
 display2,
 toque,
 toque2,
 toque3,
 toque4,
 open_bit,
 open_bit2,
 open_bit3,
 open_bit4,
 close_bit,
 close_bit2,
 close_bit3,
 close_bit4,
 atv_mot,
 atv_mot2,
 atv_mot3,
 atv_mot4,
 b1_flag,
 b2_flag,
 b3_flag,
 b4_flag,
 b5_flag,
 fast_inc;


char dia[] = "dia",
 hora[] = "h  ";





void interrupt()
{
 if(TMR1IF_bit)
 {
 TMR1IF_bit = 0x00;
 TMR1H = 0x3C;
 TMR1L = 0xB0;
 temp_led++;
 temp_led2++;
 temp_led3++;
 temp_led4++;
 temp_led5++;
 temp_disp++;
 temp_som++;
 temp_inc++;
 temp_num++;
 }

 if(TMR0IF_bit)
 {
 TMR0IF_bit = 0x00;
 TMR0H = 0x3C;
 TMR0L = 0xB0;
 temp++;
 temp2++;
 temp3++;
 temp4++;

 }



 piscaLED();
 timebase();
 timebase2();
 timebase3();
 timebase4();


}





void main (void)
{



 ADCON1 = 0x0F;
 CMCON = 0x07;

 TMR0H = 0x3C;
 TMR0L = 0xB0;
 TMR1H = 0x3C;
 TMR1L = 0xB0;


 INTCON.GIE = 0x01;
 INTCON.PEIE = 0x01;
 INTCON.TMR0IE = 0x01;

 TMR0IF_bit = 0x00;
 TMR1IF_bit = 0x00;


 INTCON2.RBPU = 0x01;
 T0CON = 0x81;
 T1CON = 0xA1;


 ligar = 0x00;
 b1_flag = 0x00;
 b2_flag = 0x00;
 b3_flag = 0x00;
 b4_flag = 0x00;
 b5_flag = 0x00;
 display = 0x00;
 fast_inc = 0x00;
 toque = 0x00;
 toque2 = 0x00;
 toque3 = 0x00;
 toque4 = 0x00;
 open_bit = 0x00;
 open_bit2 = 0x00;
 open_bit3 = 0x00;
 open_bit4 = 0x00;
 close_bit = 0x00;
 close_bit2 = 0x00;
 close_bit3 = 0x00;
 close_bit4 = 0x00;
 atv_mot = 0x00;
 atv_mot2 = 0x00;
 atv_mot3 = 0x00;
 atv_mot4 = 0x00;

 SM = 0x00;
 SM2 = 0x00;
 SM3 = 0x00;
 SM4 = 0x00;

 num = EEPROM_Read(0x01);
 un = EEPROM_Read(0x03);
 num2 = EEPROM_Read(0x02);
 un2 = EEPROM_Read(0x04);
 num3 = EEPROM_Read(0x05);
 un3 = EEPROM_Read(0x06);
 num4 = EEPROM_Read(0x07);
 un4 = EEPROM_Read(0x08);
 qtd_comp = EEPROM_Read(0x09);
 qtd_comp2 = EEPROM_Read(0x0A);
 qtd_comp3 = EEPROM_Read(0x0B);
 qtd_comp4 = EEPROM_Read(0x0C);

 if(qtd_comp==0xFF)qtd_comp=0x01;
 if(qtd_comp2==0xFF)qtd_comp2=0x01;
 if(qtd_comp3==0xFF)qtd_comp3=0x01;
 if(qtd_comp4==0xFF)qtd_comp4=0x01;

 TRISA = 0x00;
 TRISC = 0x3F;
 TRISB = 0x00;

 LCD_Init();
 LCD_Cmd(_LCD_CLEAR);
 LCD_Cmd(_LCD_CURSOR_OFF);

 while(1)
 {
 ler_bot();

 disp();
 }

}




void ler_bot()
{

 if(!BOTAO1) b1_flag=0x01;

 if(BOTAO1 && b1_flag)
 {
 LCD_Cmd(_LCD_CLEAR);
 b1_flag = 0x00;
 if(!ligar)
 {
 prog++;
 if(prog==4)
 {
 prog=0x00;
 EEPROM_Write(0x01,num);
 delay_ms(10);
 EEPROM_Write(0x03,un);
 delay_ms(10);
 EEPROM_Write(0x02,num2);
 delay_ms(10);
 EEPROM_Write(0x04,un2);
 delay_ms(10);
 EEPROM_Write(0x05,num3);
 delay_ms(10);
 EEPROM_Write(0x06,un3);
 delay_ms(10);
 EEPROM_Write(0x07,num4);
 delay_ms(10);
 EEPROM_Write(0x08,un4);
 delay_ms(10);
 EEPROM_Write(0x09,qtd_comp);
 delay_ms(10);
 EEPROM_Write(0x0A,qtd_comp2);
 delay_ms(10);
 EEPROM_Write(0x0B,qtd_comp3);
 delay_ms(10);
 EEPROM_Write(0x0C,qtd_comp4);
 delay_ms(10);
 display=0x01;

 }

 }

 }




 if(!BOTAO2)
 {
 b2_flag=0x01;
 fast_incr();
 }

 if(BOTAO2 && b2_flag)
 {
 LCD_Cmd(_LCD_CLEAR);
 b2_flag = 0x00;
 fast_inc = 0x00;
 if(option==0)
 {
 if(prog==1)
 {
 num++;
 }
 if (prog==2)
 {
 un = ~un;
 }

 if (prog==3)
 {
 qtd_comp++;
 }

 if(qtd_comp>4) qtd_comp = 0x01;
 if(num>24) num=0x00;

 }

 if(option==1)
 {
 if(prog==1)
 {
 num2++;
 }
 if (prog==2)
 {
 un2 = ~un2;
 }
 if (prog==3)
 {
 qtd_comp2++;
 }

 if(qtd_comp2>4) qtd_comp2 = 0x01;
 if(num2>24) num2=0x00;

 }

 if(option==2)
 {
 if(prog==1)
 {
 num3++;
 }
 if (prog==2)
 {
 un3 = ~un3;
 }
 if (prog==3)
 {
 qtd_comp3++;
 }

 if(qtd_comp3>4) qtd_comp3 = 0x01;
 if(num3>24) num3=0x00;

 }

 if(option==3)
 {
 if(prog==1)
 {
 num4++;
 }
 if (prog==2)
 {
 un4 = ~un4;
 }
 if (prog==3)
 {
 qtd_comp4++;
 }

 if(qtd_comp4>4) qtd_comp4 = 0x01;
 if(num4>24) num4=0x00;

 }

 comp = qtd_comp;
 comp2 = qtd_comp2;
 comp3 = qtd_comp3;
 comp4 = qtd_comp4;

 }


 if(!BOTAO3) b3_flag=0x01;

 if(BOTAO3 && b3_flag)
 {
 LCD_Cmd(_LCD_CLEAR);
 b3_flag = 0x00;
 if(option==0)
 {
 if(prog==1)
 {
 num--;

 }
 if (prog==2)
 {
 un = ~un;
 }
 if (prog==3)
 {
 qtd_comp--;
 }

 if(qtd_comp<1) qtd_comp = 0x04;
 if(num>24) num=24;
 }

 if(option==1)
 {
 if(prog==1)
 {
 num2--;

 }
 if (prog==2)
 {
 un2 = ~un2;
 }
 if (prog==3)
 {
 qtd_comp2--;
 }

 if(qtd_comp2<1) qtd_comp2 = 0x04;
 if(num2>24) num2=24;

 }

 if(option==2)
 {
 if(prog==1)
 {
 num3--;

 }
 if (prog==2)
 {
 un3 = ~un3;
 }
 if (prog==3)
 {
 qtd_comp3--;
 }

 if(qtd_comp3<1) qtd_comp3 = 0x04;
 if(num3>24) num3=24;

 }

 if(option==3)
 {
 if(prog==1)
 {
 num4--;

 }
 if (prog==2)
 {
 un4 = ~un4;
 }
 if (prog==3)
 {
 qtd_comp4--;
 }

 if(qtd_comp4<1) qtd_comp4 = 0x04;

 if(num4>24) num4=24;

 }

 comp = qtd_comp;
 comp2 = qtd_comp2;
 comp3 = qtd_comp3;
 comp4 = qtd_comp4;

 }


 if(!BOTAO4) b4_flag=0x01;

 if(BOTAO4 && b4_flag)
 {
 LCD_Cmd(_LCD_CLEAR);
 b4_flag = 0x00;
 if(num!=0 || num2!=0 || num3!=0 || num4!=0)
 {
 if(prog==0)
 {
 if(!toque && !toque2 && !toque3 && !toque4)
 {
 if(!ligar)
 {
 temp =0x00;
 temp2=0x00;
 temp3=0x00;
 temp4=0x00;

 }
 ligar = ~ligar;
 if(!ligar) display2 = 0x01;

 }

 }

 }

 }

 if(!un)
 {
 mult = num * 1;
 }
 if(un)
 {
 mult = num * 5;
 }

 if(!un2)
 {
 mult2 = num2 * 1;
 }
 if(un2)
 {
 mult2 = num2 * 5;
 }

 if(!un3)
 {
 mult3 = num3 * 1;
 }
 if(un3)
 {
 mult3 = num3 * 5;
 }

 if(!un4)
 {
 mult4 = num4 * 1;
 }
 if(un4)
 {
 mult4 = num4 * 5;
 }


 if(!BOTAO5) b5_flag = 0x01;

 if(BOTAO5 && b5_flag)
 {
 LCD_Cmd(_LCD_CLEAR);
 b5_flag = 0x00;
 if(prog != 0)
 {
 option++;
 if(option == 4) option=0x00;
 }

 if(toque || toque2 || toque3 || toque4)
 {
 if(toque)temp_ligado=0x00;
 if(toque2)temp_ligado2=0x00;
 if(toque3)temp_ligado3=0x00;
 if(toque4)temp_ligado4=0x00;
 toque =0x00;
 toque2=0x00;
 toque3=0x00;
 toque4=0x00;
 SOM=0x00;

 }

 }

}





void fast_incr()
{
 if(temp_inc>7)temp_inc=0x00;
 if(temp_inc==7)
 {
 temp_inc=0x00;
 fast_inc=0x01;
 }

 if(fast_inc)
 {
 if(option==0 && prog==1)
 {
 if(temp_num>5)temp_num=0x00;
 if(temp_num==5)
 {
 temp_num=0x00;
 num += 2;

 }

 }


 if(option==1 && prog==1)
 {
 if(temp_num>5)temp_num=0x00;
 if(temp_num==5)
 {
 temp_num=0x00;
 num2 += 2;

 }

 }

 if(option==2 && prog==1)
 {
 if(temp_num>5)temp_num=0x00;
 if(temp_num==5)
 {
 temp_num=0x00;
 num3 += 2;

 }

 }

 if(option==3 && prog==1)
 {
 if(temp_num>5)temp_num=0x00;
 if(temp_num==5)
 {
 temp_num=0x00;
 num4 += 2;

 }

 }

 if(num >24) num =0x00;
 if(num2>24) num2=0x00;
 if(num3>24) num3=0x00;
 if(num4>24) num4=0x00;

 }




}





void disp()
{
 if(!ligar && prog==0)
 {
 if(!display && !display2)
 {
 LCD_Out(1,1,"  DISPENSER DE  ");
 LCD_Out(2,1,"    REMEDIOS    ");
 }
 else
 {
 if(display && !display2)
 {
 display=0x00;
 LCD_Out(1,1,"ETEC LAURO GOMES");
 LCD_Out(2,1,"  3A MECA 2021  ");
 delay_ms(1000);
 }
 if(!display && display2)
 {
 display2=0x00;
 LCD_Out(1,1,"     PARANDO    ");
 LCD_Out(2,1,"     CONTAGEM   ");
 delay_ms(1000);
 }
 }
 }

 if(prog==1)
 {
 LCD_Out(1,1,"PROGRAME NUMERO:");
 num_un();
 if(option==0) LCD_Chr(2,1,'1');
 if(option==1) LCD_Chr(2,1,'2');
 if(option==2) LCD_Chr(2,1,'3');
 if(option==3) LCD_Chr(2,1,'4');
 }

 if(prog==2)
 {
 LCD_Out(1,1,"PROGRAME Un.:");
 num_un();
 if(option==0) LCD_Chr(2,1,'1');
 if(option==1) LCD_Chr(2,1,'2');
 if(option==2) LCD_Chr(2,1,'3');
 if(option==3) LCD_Chr(2,1,'4');
 }

 if(prog==3)
 {
 LCD_Out(1,1,"Qtd. COMPRIMIDOS");
 num_un();
 if(option==0) LCD_Chr(2,1,'1');
 if(option==1) LCD_Chr(2,1,'2');
 if(option==2) LCD_Chr(2,1,'3');
 if(option==3) LCD_Chr(2,1,'4');
 }

 if(ligar)
 {
 LCD_Out(1,1,"DISP  TEMPO  Qtd");
 if(temp_disp>20) temp_disp=0x00;
 if(temp_disp == 20)
 {
 temp_disp=0x00;
 option++;
 if(option == 4) option=0x00;
 if(option==0) LCD_Chr(2,1,'1');
 if(option==1) LCD_Chr(2,1,'2');
 if(option==2) LCD_Chr(2,1,'3');
 if(option==3) LCD_Chr(2,1,'4');
 }
 num_un();
 }

}





void num_un()
{
 char dig2,dig1,digcomp;

 if(option==0)
 {
 dig2 = num/10;
 dig1 = num%10;

 LCD_Chr(2,7,dig2+0x30);
 LCD_Chr_Cp (dig1+0x30);

 if(!un) LCD_Out(2,10,hora);

 if(un) LCD_Out(2,10,dia);

 }


 if(option==1)
 {
 dig2 = num2/10;
 dig1 = num2%10;

 LCD_Chr(2,7,dig2+0x30);
 LCD_Chr_Cp (dig1+0x30);

 if(!un2) LCD_Out(2,10,hora);

 if(un2) LCD_Out(2,10,dia);

 }

 if(option==2)
 {
 dig2 = num3/10;
 dig1 = num3%10;

 LCD_Chr(2,7,dig2+0x30);
 LCD_Chr_Cp (dig1+0x30);

 if(!un3) LCD_Out(2,10,hora);

 if(un3) LCD_Out(2,10,dia);

 }

 if(option==3)
 {
 dig2 = num4/10;
 dig1 = num4%10;

 LCD_Chr(2,7,dig2+0x30);
 LCD_Chr_Cp (dig1+0x30);

 if(!un4) LCD_Out(2,10,hora);

 if(un4) LCD_Out(2,10,dia);

 }


 if(option==0)
 {
 digcomp = qtd_comp;
 LCD_Chr(2,15,digcomp+0x30);
 }

 if(option==1)
 {
 digcomp = qtd_comp2;
 LCD_Chr(2,15,digcomp+0x30);
 }

 if(option==2)
 {
 digcomp = qtd_comp3;
 LCD_Chr(2,15,digcomp+0x30);
 }

 if(option==3)
 {
 digcomp = qtd_comp4;
 LCD_Chr(2,15,digcomp+0x30);
 }


}





void piscaLED()
{

 if(ligar && !toque && num!=0)
 {
 if(temp_led>=10)
 {
 temp_led = 0x00;
 LED = ~LED;
 }

 }

 else
 {
 if(ligar && toque)
 {
 if(temp_led>=2)
 {
 temp_led=0x00;
 LED = ~LED;

 }

 }
 else
 {
 if(prog>0 && option==0)
 {
 LED = 0x01;
 }

 else LED = 0x00;

 }

 }



 if(temp_led2 ==5)
 {
 temp_led2=0x00;
 LED2 = ~LED2;

 }

 if(ligar && !toque2 && num2!=0)
 {
 if(temp_led3>=10)
 {
 temp_led3 = 0x00;
 LED3 = ~LED3;

 }

 }

 else
 {
 if(ligar && toque2)
 {
 if(temp_led3>=2)
 {
 temp_led3=0x00;
 LED3 = ~LED3;

 }

 }

 else
 {
 if(prog>0 && option==1)
 {
 LED3 = 0x01;
 }

 else LED3 = 0x00;

 }

 }

 if(ligar && !toque3 && num3!=0)
 {
 if(temp_led4>=10)
 {
 temp_led4 = 0x00;
 LED4 = ~LED4;

 }

 }

 else
 {
 if(ligar && toque3)
 {
 if(temp_led4>=2)
 {
 temp_led4=0x00;
 LED4 = ~LED4;

 }

 }

 else
 {
 if(prog>0 && option==2)
 {
 LED4 = 0x01;
 }

 else LED4 = 0x00;

 }

 }


 if(ligar && !toque4 && num4!=0)
 {
 if(temp_led5>=10)
 {
 temp_led5 = 0x00;
 LED5 = ~LED5;

 }

 }

 else
 {
 if(ligar && toque4)
 {
 if(temp_led5>=2)
 {
 temp_led5=0x00;
 LED5 = ~LED5;

 }

 }

 else
 {
 if(prog>0 && option==3)
 {
 LED5 = 0x01;
 }

 else LED5 = 0x00;

 }

 }

}






void timebase()
{
 if(!ligar)
 {
 temp_ligado = 0x00;
 }
 if(ligar && num!=0)
 {
 if(temp==10)
 {
 temp = 0x00;
 temp_ligado++;

 }

 if(temp_ligado==mult)
 {
 toque = 0x01;
 atv_mot = 0x01;
 comp = qtd_comp;
 abre_mot();

 }

 if(atv_mot)
 {
 read_motbits();

 }

 else
 {
 alarme();
 }
 }

}






void timebase2()
{
 if(!ligar)
 {
 temp_ligado2 = 0x00;
 }

 if(ligar && num2!=0)
 {
 if(temp2==10)
 {
 temp2 = 0x00;
 temp_ligado2++;

 }

 if(temp_ligado2==mult2)
 {
 toque2 = 0x01;
 atv_mot2 = 0x01;
 comp2 = qtd_comp2;
 abre_mot2();

 }

 if(atv_mot2)
 {
 read_motbits();

 }

 else
 {
 alarme();

 }

 }

}






void timebase3()
{
 if(!ligar)
 {
 temp_ligado3 = 0x00;
 }

 if(ligar && num3!=0)
 {
 if(temp3==10)
 {
 temp3 = 0x00;
 temp_ligado3++;

 }

 if(temp_ligado3==mult3)
 {
 toque3 = 0x01;
 atv_mot3 = 0x01;
 comp3 = qtd_comp3;
 abre_mot3();

 }

 if(atv_mot3)
 {
 read_motbits();

 }

 else
 {
 alarme();

 }

 }

}






void timebase4()
{
 if(!ligar)
 {
 temp_ligado4 = 0x00;
 }

 if(ligar && num4!=0)
 {
 if(temp4==10)
 {
 temp4 = 0x00;
 temp_ligado4++;

 }

 if(temp_ligado4==mult4)
 {
 toque4 = 0x01;
 atv_mot4 = 0x01;
 comp4 = qtd_comp4;
 abre_mot4();

 }

 if(atv_mot4)
 {
 read_motbits();

 }

 else
 {
 alarme();

 }

 }

}





void alarme()
{
 if(toque || toque2 || toque3 || toque4)
 {
 if(vezes <200)
 {
 toca_som();
 }

 else
 {
 if(toque)
 {
 toque=0x00;
 temp_ligado=0x00;

 }

 if(toque2)
 {
 toque2=0x00;
 temp_ligado2=0x00;

 }

 if(toque3)
 {
 toque3=0x00;
 temp_ligado3=0x00;

 }

 if(toque4)
 {
 toque4=0x00;
 temp_ligado4=0x00;

 }

 vezes=0x00;
 SOM = 0x00;

 }

 }

}





void toca_som()
{
 if(temp_som>3) temp_som=0x00;
 if(temp_som==3)
 {
 temp_som = 0x00;
 SOM = ~SOM;
 vezes++;

 if(!ligar)
 {
 vezes = 0x00;
 SOM = 0x00;

 }

 }

}






void abre_mot()
{
 open_bit = 0x01;
 close_bit = 0x00;
 x_mot = 0x00;

}






void abre_mot2()
{
 open_bit2 = 0x01;
 close_bit2 = 0x00;
 x_mot2 = 0x00;

}






void abre_mot3()
{
 open_bit3 = 0x01;
 close_bit3 = 0x00;
 x_mot3 = 0x00;

}






void abre_mot4()
{
 open_bit4 = 0x01;
 close_bit4 = 0x00;
 x_mot4 = 0x00;

}





void mot_aberto()
{
 if(comp!=0)
 {

 if(x_mot<20)
 {
 SM=0;
 delay_us(18000);
 SM=1;
 delay_us(2000);
 SM=0;
 x_mot ++;

 }

 if(x_mot == 20)
 {
 fecha_mot();

 }

 }
 else
 {
 open_bit = 0x00;
 close_bit= 0x00;
 }

}





void mot_aberto2()
{
 if(comp2!=0)
 {
 if(x_mot2<20)
 {
 SM2=0;
 delay_us(18000);
 SM2=1;
 delay_us(2000);
 SM2=0;
 x_mot2 ++;

 }

 if(x_mot2 == 20)
 {
 fecha_mot2();

 }
 }
 else
 {
 open_bit2 = 0x00;
 close_bit2= 0x00;
 }

}





void mot_aberto3()
{
 if(comp3!=0)
 {
 if(x_mot3<20)
 {
 SM3=0;
 delay_us(18000);
 SM3=1;
 delay_us(2000);
 SM3=0;
 x_mot3 ++;

 }

 if(x_mot3 == 20)
 {
 fecha_mot3();

 }
 }
 else
 {
 open_bit3 = 0x00;
 close_bit3= 0x00;
 }

}





void mot_aberto4()
{
 if(comp4!=0)
 {
 if(x_mot4<20)
 {
 SM4=0;
 delay_us(18000);
 SM4=1;
 delay_us(2000);
 SM4=0;
 x_mot4 ++;

 }

 if(x_mot4 == 20)
 {
 fecha_mot4();

 }
 }
 else
 {
 open_bit4 = 0x00;
 close_bit4= 0x00;
 }

}






void fecha_mot()
{
 open_bit = 0x00;
 close_bit = 0x01;
 x_mot = 0x00;

}






void fecha_mot2()
{
 open_bit2 = 0x00;
 close_bit2 = 0x01;
 x_mot2 = 0x00;

}






void fecha_mot3()
{
 open_bit3 = 0x00;
 close_bit3 = 0x01;
 x_mot3 = 0x00;

}






void fecha_mot4()
{
 open_bit4 = 0x00;
 close_bit4 = 0x01;
 x_mot4 = 0x00;

}





void mot_fechado()
{
 if(comp!=0)
 {
 if(x_mot<20)
 {
 SM=0;
 delay_us(18500);
 SM=1;
 delay_us(1500);
 SM=0;
 x_mot++;

 }

 if(x_mot==20)
 {
 abre_mot();
 comp--;

 }

 }

}





void mot_fechado2()
{
 if(comp2!=0)
 {
 if(x_mot2<20)
 {
 SM2=0;
 delay_us(18500);
 SM2=1;
 delay_us(1500);
 SM2=0;
 x_mot2++;

 }

 if(x_mot2==20)
 {
 abre_mot2();
 comp2--;

 }

 }

}





void mot_fechado3()
{
 if(comp3!=0)
 {
 if(x_mot3<20)
 {
 SM3=0;
 delay_us(18500);
 SM3=1;
 delay_us(1500);
 SM3=0;
 x_mot3++;

 }

 if(x_mot3==20)
 {
 abre_mot3();
 comp3--;

 }

 }

}





void mot_fechado4()
{
 if(comp4!=0)
 {
 if(x_mot4<20)
 {
 SM4=0;
 delay_us(18500);
 SM4=1;
 delay_us(1500);
 SM4=0;
 x_mot4++;

 }

 if(x_mot4==20)
 {
 abre_mot4();
 comp4--;

 }

 }

}






void read_motbits()
{
 if(!open_bit && !close_bit) atv_mot = 0x00;


 if(open_bit && !close_bit)
 {
 mot_aberto();

 }

 if(!open_bit && close_bit)
 {
 mot_fechado();

 }


 if(!open_bit2 && !close_bit2) atv_mot2 = 0x00;


 if(open_bit2 && !close_bit2)
 {
 mot_aberto2();

 }

 if(!open_bit2 && close_bit2)
 {
 mot_fechado2();

 }


 if(!open_bit3 && !close_bit3) atv_mot3 = 0x00;


 if(open_bit3 && !close_bit3)
 {
 mot_aberto3();

 }

 if(!open_bit3 && close_bit3)
 {
 mot_fechado3();

 }


 if(!open_bit4 && !close_bit4) atv_mot4 = 0x00;


 if(open_bit4 && !close_bit4)
 {
 mot_aberto4();

 }

 if(!open_bit4 && close_bit4)
 {
 mot_fechado4();

 }

}
