

//SA�DAS COMUNS
sbit LED  at PORTA.b0;
sbit SOM  at PORTA.b2;
sbit LED2 at PORTA.b3;
sbit LED3 at PORTB.b0;

//BITS SERVO MOTOR
sbit SM  at PORTA.b1;
sbit SM2 at PORTA.b4;

//BITS DO LCD
sbit LCD_RS at PORTD.b2;
sbit LCD_EN at PORTD.b3;
sbit LCD_D7 at PORTD.b7;
sbit LCD_D6 at PORTD.b6;
sbit LCD_D5 at PORTD.b5;
sbit LCD_D4 at PORTD.b4;

//PINOS DO TRIS LCD
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

//ENTRADAS DOS BOTOES
sbit BOTAO1 at PORTC.b0;
sbit BOTAO2 at PORTC.b1;
sbit BOTAO3 at PORTC.b2;
sbit BOTAO4 at PORTC.b4;
sbit BOTAO5 at PORTC.b5;

//----------Fun��es----------
void ler_bot();
void disp();
void num_un();
void alarme();
void piscaLED();
void timebase();
void timebase2();
void toca_som();
void abre_mot();
void abre_mot2();
void fecha_mot();
void fecha_mot2();
void mot_aberto();
void mot_aberto2();
void mot_fechado();
void mot_fechado2();
void read_motbits();


//-------Vari�veis----------
unsigned temp2        = 0x00,
         temp         = 0x00,
         temp_ligado  = 0x00,
         temp_ligado2 = 0x00,
         temp_led     = 0x00,
         temp_led2    = 0x00,
         temp_led3    = 0x00,
         temp_som     = 0x00,
         temp_disp    = 0x00,
         x_mot        = 0x00,
         x_mot2       = 0x00,
         of1          = 0x00,
         prog         = 0x00,
         num,      // = EEPROM_Read(0x01)
         num2,     // = EEPROM_Read(0x03)
         mult         = 0x00,
         mult2        = 0x00,
         vezes        = 0x00,
         option       = 0x00;

bit      ligar,
         un,       // = EEPROM_Read(0x02)
         un2,      // = EEPROM_Read(0x04)
         display,
         display2,
         toque,
         toque2,
         open_bit,
         open_bit2,
         close_bit,
         close_bit2,
         atv_mot,
         atv_mot2,
         b1_flag,
         b2_flag,
         b3_flag,
         b4_flag,
         b5_flag;

char     dia[]        = "dia",
         hora[]       = "h  ";

void interrupt()
{
     if(TMR1IF_bit)                       //100ms overflow
     {
      TMR1IF_bit  =  0x00;
      TMR1H       =  0x3C;
      TMR1L       =  0xB0;
      temp_led++;
      temp_som++;
      temp_led2++;
      temp_led3++;
      temp_disp++;
     }

     if(TMR0IF_bit)                        //100ms overflow
     {
      TMR0IF_bit =  0x00;
      TMR0H      =  0x3C;
      TMR0L      =  0xB0;
      temp++;
      temp2++;

     }                     //end if TMR0IF



     piscaLED();
     timebase();
     timebase2();


}                          //end interrupt()

void main (void)
{

// Registradores de Configura��o:

        ADCON1        =   0x0F;                   //Define os pinos como digital
        CMCON         =   0x07;                   //Desativa os comparadores

        TMR0H         =   0x3C;
        TMR0L         =   0xB0;                   //Inicia timer0 em 15536
        TMR1H         =   0x3C;
        TMR1L         =   0xB0;                   //Inicia TMR1 em 15536


        INTCON.GIE    =   0x01;                   //Ativa interrup��o global
        INTCON.PEIE   =   0x01;                   //Ativa interrup��o por perif�ricos
        INTCON.TMR0IE =   0x01;                   //Ativa interrup��o por overflow

        TMR0IF_bit    =   0x00;                   //zera a flag do timer0
        TMR1IF_bit    =   0x00;


        INTCON2.RBPU  =   0x01;                   //Desliga os resistores de pull-ups do portB
        T0CON         =   0x81;                   //TMR0 16 bits, prescaler 1:4
        T1CON         =   0xA1;                   //TMR1 16 bits, prescaler 1:4


        ligar         =   0x00;
        b1_flag       =   0x00;
        b2_flag       =   0x00;
        b3_flag       =   0x00;
        b4_flag       =   0x00;
        b5_flag       =   0x00;
        display       =   0x00;
        toque         =   0x00;
        toque2        =   0x00;
        open_bit      =   0x00;
        open_bit2     =   0x00;
        close_bit     =   0x00;
        close_bit2     =  0x00;
        atv_mot       =   0x00;
        atv_mot2      =   0x00;

        SM            =   0x00;

        num           =   EEPROM_Read(0x01);
        un            =   EEPROM_Read(0x03);
        num2          =   EEPROM_Read(0x02);
        un2           =   EEPROM_Read(0x04);

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
 }                                          //end while

}                                           //end main

void ler_bot()
{
  //____b1___
  if(!BOTAO1) b1_flag=0x01;

  if(BOTAO1 && b1_flag)
  {
   LCD_Cmd(_LCD_CLEAR);
   b1_flag = 0x00;
   if(!ligar)
   {
    prog++;
    if(prog==3)
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
     display=0x01;
    }
   }
  }



  //___b2___
  if(!BOTAO2) b2_flag=0x01;

  if(BOTAO2 && b2_flag)
  {
    LCD_Cmd(_LCD_CLEAR);
    b2_flag    =  0x00;
   if(option==0)                     //dep�sito de rem�dio 1
   {
    if(prog==1)                      //programa��o do numero
    {
     num++;
    }
    if (prog==2)                    //programa��o de unidade(hora/dia)
    {
      un = ~un;
    }                               //end if prog==2
   }
   
   if(option==1)                    //dep�sito de rem�dio 2
   {
    if(prog==1)                      //programa��o do numero
    {
     num2++;
    }
    if (prog==2)                    //programa��o de unidade(hora/dia)
    {
      un2 = ~un2;
    }
   }
  }                                 //end if BOTAO2 e b2_flag

  //___b3___
  if(!BOTAO3) b3_flag=0x01;

  if(BOTAO3 && b3_flag)
  {
   LCD_Cmd(_LCD_CLEAR);
   b3_flag     =  0x00;
   if(option==0)                     //dep�sito de rem�dio 1
   {
    if(prog==1)                      //programa��o do numero
    {
     num--;

    }
    if (prog==2)                    //ptograma��o de unidade(hora/dia)
    {
     un = ~un;
    }
   }
   
   if(option==1)                     //dep�sito de rem�dio 2
   {
    if(prog==1)                      //programa��o do numero
    {
     num2--;

    }
    if (prog==2)                    //ptograma��o de unidade(hora/dia)
    {
     un2 = ~un2;
    }
   }
  }

  //___b4___
  if(!BOTAO4) b4_flag=0x01;

  if(BOTAO4 && b4_flag)
  {
    LCD_Cmd(_LCD_CLEAR);
    b4_flag    =  0x00;
   if(num!=0 || num2!=0)
   {
    if(prog==0)
    {
     if(!ligar)
     {
      temp=0x00;
      temp2=0x00;
     }
     ligar = ~ligar;
     if(!ligar) display2 = 0x01;
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

  //___b5___                        botao para trocar de contador
  if(!BOTAO5) b5_flag = 0x01;
  
  if(BOTAO5 && b5_flag)
  {
   LCD_Cmd(_LCD_CLEAR);
   b5_flag = 0x00;
   if(prog != 0)
   {
    option++;
    if(option == 2) option=0x00;
   }
  }

}                                   //end ler_bot()

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

  if(prog==1)                       //programa��o de numeros
  {
   LCD_Out(1,1,"PROGRAME NUMERO:");
   num_un();
   if(option==0) LCD_Chr(2,14,'1');
   if(option==1) LCD_Chr(2,14,'2');
  }

  if(prog==2)
  {
   LCD_Out(1,1,"PROGRAME Un.:");
   num_un();
   if(option==0) LCD_Chr(2,14,'1');
   if(option==1) LCD_Chr(2,14,'2');
  }

  if(ligar)
  {
   LCD_Out(1,1,"CONTANDO:   DISP");
   if(temp_disp>20) temp_disp=0x00;
   if(temp_disp == 20)
   {
    temp_disp=0x00;
    option++;
    if(option == 2) option=0x00;

    if(option==0) LCD_Chr(2,14,'1');
    if(option==1) LCD_Chr(2,14,'2');
   }
   num_un();
  }

}                                   //end disp()

void num_un()
{
 char dig2,dig1;
 if(option==0)
 {
  dig2 = num/10;
  dig1 = num%10;

  LCD_Chr(2,2,dig2+0x30);
  LCD_Chr_Cp (dig1+0x30);

  if(!un) LCD_Out(2,5,hora);

  if(un) LCD_Out(2,5,dia);
 }
 if(option==1)
 {
  dig2 = num2/10;
  dig1 = num2%10;

  LCD_Chr(2,2,dig2+0x30);
  LCD_Chr_Cp (dig1+0x30);

  if(!un2) LCD_Out(2,5,hora);

  if(un2) LCD_Out(2,5,dia);
 }
}                                   //end num_un()

void piscaLED()
{

  if(ligar && !toque && num!=0)
  {
   if(temp_led>=10)                //1s      / LED Indica��o disp1
   {
            temp_led = 0x00;
            LED  = ~LED;
   }
  }
  else
  {
   if(ligar && toque)
   {
    if(temp_led>=2)                //200ms
    {
     temp_led=0x00;
     LED = ~LED;
    }
   }
   else LED = 0x00;
  }



 if(temp_led2 ==5)                //0,5s  / LED Indica��o on
 {
  temp_led2=0x00;
  LED2 = ~LED2;
 }
 
 if(ligar && !toque2 && num2!=0)
 {
  if(temp_led3>=10)               //1s / LED Indica��o disp2
  {
   temp_led3 = 0x00;
   LED3 = ~LED3;
  }
 }
 else
 {
  if(ligar && toque2)
  {
   if(temp_led3>=2)                //200ms
   {
    temp_led3=0x00;
    LED3 = ~LED3;
   }
  }
  else LED3 = 0x00;
 }
 
}                                   //end piscaLED()

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
  }                                 //end if ligar
  
}                                   //end timebase()

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
  }                                 //end if ligar
  
}                                   //end timebase2()



void alarme()
{
 if(toque || toque2)
 {
   if(vezes <10)
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
     vezes=0x00;
     SOM = 0x00;
   }
 }
}                                   //end alarme()



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
      SOM   = 0x00;
     }
    }
}

void abre_mot()
{
 open_bit  = 0x01;
 close_bit = 0x00;
 x_mot     = 0x00;
}                                         //end abre_mot()

void abre_mot2()
{
 open_bit2  = 0x01;
 close_bit2 = 0x00;
 x_mot2     = 0x00;
}                                         //end abre_mot2()

void mot_aberto()
{
 if(x_mot<10)
  {
    SM=0;
    delay_us(18000);
    SM=1;
    delay_us(2000);
    SM=0;
    x_mot ++;
  }
  if(x_mot == 10)
   {
    fecha_mot();
   }


}                                         //end mot_aberto()

void mot_aberto2()
{
 if(x_mot2<10)
  {
    SM2=0;
    delay_us(18000);
    SM2=1;
    delay_us(2000);
    SM2=0;
    x_mot2 ++;
  }
  if(x_mot2 == 10)
   {
    fecha_mot2();
   }
}                                         //end mot_aberto2()


void fecha_mot()
{
 open_bit  = 0x00;
 close_bit = 0x01;
 x_mot     = 0x00;
}                                         //end fecha_mot()

void fecha_mot2()
{
 open_bit2  = 0x00;
 close_bit2 = 0x01;
 x_mot2     = 0x00;
}                                         //end fecha_mot2()

void mot_fechado()
{
 if(x_mot<10)
  {
    SM=0;
    delay_us(18500);
    SM=1;
    delay_us(1500);
    SM=0;
    x_mot++;
  }
  if(x_mot==10)
    {
     close_bit = 0x00;
    }

}                                            //end mot_fechado

void mot_fechado2()
{
  if(x_mot2<10)
  {
    SM2=0;
    delay_us(18500);
    SM2=1;
    delay_us(1500);
    SM2=0;
    x_mot2++;
  }
  if(x_mot2==10)
    {
     close_bit2 = 0x00;
    }
}                                            //end mot_fechado2()

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
}                                              //end read_motbits()