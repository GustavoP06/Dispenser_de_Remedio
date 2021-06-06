

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

//---------------------------
//----------Fun��es----------
//---------------------------
void ler_bot();                           //ler os bits dos bot�es
void disp();                              //controla o que � exibido no display
void num_un();                            //define as v�riaveis de exibi��o dos numeros para o display
void alarme();                            //alarme de aviso para quando acaba a contagem
void piscaLED();                          //controla os LEDs do circuito
void timebase();                          //contagem do dispenser n�1
void timebase2();                         //contagem do dispenser n�2
void toca_som();                          //controla o buzzer
void abre_mot();                          //define os bits de controle do motor n�1 para abertura
void abre_mot2();                         //define os bits de controle do motor n�2 para abertura
void fecha_mot();                         //define os bits de controle do motor n�1 para fechamento
void fecha_mot2();                        //define os bits de controle do motor n�2 para fechamento
void mot_aberto();                        //abre o motor n�1
void mot_aberto2();                       //abre o motor n�2
void mot_fechado();                       //fecha o motor n�1
void mot_fechado2();                      //fecha o motor n�2
void read_motbits();                      //ler os bits dos motores

//--------------------------
//-------Vari�veis----------
//--------------------------
unsigned temp2        = 0x00,             //vari�vel de interrup��o do dispenser n�2
         temp         = 0x00,             //vari�vel de interrup��o do dispenser n�1
         temp_ligado  = 0x00,             //vari�vel de contagem ligada do dispenser n�1
         temp_ligado2 = 0x00,             //vari�vel de contagem ligada do dispenser n�2
         temp_led     = 0x00,             //vari�vel de temporiza��o do LED 1 (indica��o do dispenser n�1)
         temp_led2    = 0x00,             //vari�vel de temporiza��o do LED 2 (indica��o on/off do dispositivo)
         temp_led3    = 0x00,             //vari�vel de temporiza��o do LED 3 (indica��o do dispenser n�2)
         temp_som     = 0x00,             //vari�vel de temporiza��o do SOM
         temp_disp    = 0x00,             //vari�vel de temporiza��o do display
         x_mot        = 0x00,             //vari�vel de controle de vezes de repeti��o da fun��o do motor n�1
         x_mot2       = 0x00,             //vari�vel de controle de vezes de repeti��o da fun��o do motor n�2
         prog         = 0x00,             //vari�vel de controle do modo de programa��o
         num,      // = EEPROM_Read(0x01)   n�mero programado do dispenser n�1
         num2,     // = EEPROM_Read(0x03)   n�mero programado do dispenser n�2
         mult         = 0x00,             //vari�vel de compara��o com o temp_ligado (dispenser n�1)
         mult2        = 0x00,             //vari�vel de compara��o com o temp_ligado2 (dispenser n�2)
         vezes        = 0x00,             //vari�vel de vezes que o SOM toca
         option       = 0x00;             //vari�vel que define qual dispenser est� selecionado

bit      ligar,                           //bit de ligar/desligar a contagem
         un,       // = EEPROM_Read(0x02)   bit que define a unidade (dia/hora) do dispenser n�1
         un2,      // = EEPROM_Read(0x04)   bit que define a unidade (dia/hora) do dispenser n�2
         display,                         //bit high que configura o display
         display2,                        //bit low que configura o display
         toque,                           //bit que liga o alarme do dispenser n�1
         toque2,                          //bit que liga o alarme do dispenser n�2
         open_bit,                        //bit de controle de abertura do motor n�1
         open_bit2,                       //bit de controle de abertura do motor n�2
         close_bit,                       //bit de controle de fechamento do motor n�1
         close_bit2,                      //bit de controle de fechamento do motor n�2
         atv_mot,                         //bit de ativa��o do motor n�1
         atv_mot2,                        //bit de ativa��o do motor n�2
         b1_flag,                         //flag do bot�o 1
         b2_flag,                         //flag do bot�o 2
         b3_flag,                         //flag do bot�o 3
         b4_flag,                         //flag do bot�o 4
         b5_flag;                         //flag do bot�o 5

char     dia[]        = "dia",            //vari�vel de exibi��o "dia"
         hora[]       = "h  ";            //vari�vel de exibi��o "h"

void interrupt()                          //interrup��o
{
     if(TMR1IF_bit)                       //overflow em 100ms
     {
      TMR1IF_bit  =  0x00;                //zera flag do timer1
      TMR1H       =  0x3C;
      TMR1L       =  0xB0;                //seta timer1 em 15536
      temp_led++;                         //incrementa temp_led
      temp_som++;                         //incrementa temp_som
      temp_led2++;                        //incrementa temp_led2
      temp_led3++;                        //incrementa temp_led3
      temp_disp++;                        //incrementa temp_disp
     }

     if(TMR0IF_bit)                        //overflow em 100ms overflow
     {
      TMR0IF_bit =  0x00;                  //zera flag do timer0
      TMR0H      =  0x3C;
      TMR0L      =  0xB0;                  //seta timer0 em 15536
      temp++;                              //incrementa temp
      temp2++;                             //incrementa temp2

     }                     //end if TMR0IF



     piscaLED();                           //executa piscaLED
     timebase();                           //executa timebase
     timebase2();                          //executa timebase2


}                          //end interrupt()

//======================================================================================
//                             FUN��O PRINCIPAL
//======================================================================================

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
        TMR1IF_bit    =   0x00;                   //zera a flag do timer1


        INTCON2.RBPU  =   0x01;                   //Desliga os resistores de pull-ups do portB
        T0CON         =   0x81;                   //TMR0 16 bits, prescaler 1:4
        T1CON         =   0xA1;                   //TMR1 16 bits, prescaler 1:4


        ligar         =   0x00;                   //     |
        b1_flag       =   0x00;                   //     |
        b2_flag       =   0x00;                   //     |
        b3_flag       =   0x00;                   //     |
        b4_flag       =   0x00;                   //     |
        b5_flag       =   0x00;                   //     |
        display       =   0x00;                   //     |
        toque         =   0x00;                   //     |
        toque2        =   0x00;                   //     |
        open_bit      =   0x00;                   //     |
        open_bit2     =   0x00;                   //     |
        close_bit     =   0x00;                   //     |
        close_bit2     =  0x00;                   //     |
        atv_mot       =   0x00;                   //     |
        atv_mot2      =   0x00;                   //    \ /
                                                  //     V
        SM            =   0x00;                   //zerando todos os bits

        num           =   EEPROM_Read(0x01);      //l� os dados da EEPROM para vari�vel num
        un            =   EEPROM_Read(0x03);      //l� os dados da EEPROM para vari�vel un
        num2          =   EEPROM_Read(0x02);      //l� os dados da EEPROM para vari�vel num2
        un2           =   EEPROM_Read(0x04);      //l� os dados da EEPROM para vari�vel un2

        TRISA = 0x00;                             //seta todos os bits do TRISA como sa�da
        TRISC = 0x3F;                             //seta os bits 0,1,2,3,5 como entrada
        TRISB = 0x00;                             //seta todos os bits do TRISB como sa�da

        LCD_Init();                               //inicia o LCD
        LCD_Cmd(_LCD_CLEAR);                      //limpa o LCD
        LCD_Cmd(_LCD_CURSOR_OFF);                 //desliga cursor do LCD

 while(1)                                         //loop infinito
 {
   ler_bot();                                     //executa ler_bot

   disp();                                        //executa disp
 }                                                //end while

}                                                 //end main

//===============================================================================
//                              FUN��O LER BOT�ES
//===============================================================================
void ler_bot()
{
  //____b1___
  if(!BOTAO1) b1_flag=0x01;                       //se bot�o1 for pressionado, flag do bot�o1 = 1

  if(BOTAO1 && b1_flag)                           //se bot�o1 estiver solto e flag do bot�o1 = 1
  {
   LCD_Cmd(_LCD_CLEAR);                           //limpa o LCD
   b1_flag = 0x00;                                //lmpa a flag do bot�o1
   if(!ligar)                                     //se bit ligar = 0
   {
    prog++;                                       //incrementa prog, muda a programa��o
    if(prog==3)                                   //se prog = 3
    {
     prog=0x00;                                   //zera a vari�vel prog
     EEPROM_Write(0x01,num);                      //grava num na EEPROM
     delay_ms(10);                                //espera 10 micro segundos
     EEPROM_Write(0x03,un);                       //grava un na EEPROM
     delay_ms(10);                                //espera 10 micro segundos
     EEPROM_Write(0x02,num2);                     //grava num2 na EEPROM
     delay_ms(10);                                //espera 10 micro segundos
     EEPROM_Write(0x04,un2);                      //grava un2 na EEPROM
     delay_ms(10);                                //espera 10 micro segundos
     display=0x01;                                //bit display em 1
    
    }                                             //end if prog = 3
   
   }                                              //end if !ligar
  
  }                                               //end if BOTAO1 && b1_flag



  //___b2___
  if(!BOTAO2) b2_flag=0x01;                       //se bot�o2 for pressionado, flag do bot�o2 = 1

  if(BOTAO2 && b2_flag)                           //se bot�o2 for solto e flag do bot�o2 for 1
  {
    LCD_Cmd(_LCD_CLEAR);                          //limpa LCD
    b2_flag    =  0x00;                           //limpa flag do bot�o
   if(option==0)                                  //dispenser n�1
   {
    if(prog==1)                                   //programa��o de numero
    {
     num++;                                       //incrementa num
    }
    if (prog==2)                                  //programa��o de unidade(hora/dia)
    {
      un = ~un;                                   //inverte un
    }                                             //end if prog==2
   }                                              //end if option==0
   
   if(option==1)                                  //dispenser n�2
   {
    if(prog==1)                                   //programa��o do numero
    {
     num2++;                                      //incrementa num2
    }
    if (prog==2)                                  //programa��o de unidade(hora/dia)
    {
      un2 = ~un2;                                 //inverte un2
    }
   }                                              //end if option==1
  }                                               //end if BOTAO2 e b2_flag

  //___b3___
  if(!BOTAO3) b3_flag=0x01;                       //se bot�o3 for pressionado, flag do bot�o3 = 1

  if(BOTAO3 && b3_flag)                           //se bot�o3 for solto e flag do bot�o3 for 1
  {
   LCD_Cmd(_LCD_CLEAR);                           //limpa LCD
   b3_flag     =  0x00;                           //limpa flag do bot�o3
   if(option==0)                                  //dep�sito de rem�dio 1
   {
    if(prog==1)                                   //programa��o do numero
    {
     num--;                                       //decrementa num

    }
    if (prog==2)                                  //programa��o de unidade(hora/dia)
    {
     un = ~un;                                    //inverte un
    }
   }                                              //end if option==0
   
   if(option==1)                                  //dep�sito de rem�dio 2
   {
    if(prog==1)                                   //programa��o do n�mero
    {
     num2--;                                      //decrementa num2

    }
    if (prog==2)                                  //programa��o de unidade(hora/dia)
    {
     un2 = ~un2;                                  //inverte un2
    }
   }                                              //end if option==1
  }                                               //end if bot�o3 e b3_flag

  //___b4___
  if(!BOTAO4) b4_flag=0x01;                       //se bot�o4 for pressionado, flag do bot�o4 = 1

  if(BOTAO4 && b4_flag)                           //se bot�o4 for solto e flag do bot�o4 for 1
  {
    LCD_Cmd(_LCD_CLEAR);                          //limpa LCD
    b4_flag    =  0x00;                           //limpa flag do bot�o4
   if(num!=0 || num2!=0)                          //se num ou num2 for diferente 0
   {
    if(prog==0)                                   //se prog = 0
    {
     if(!ligar)                                   //se bit de ligar = 0 (desligado)
     {
      temp=0x00;                                  //zera temp
      temp2=0x00;                                 //zera temp2
     }                                            //end if !ligar
     ligar = ~ligar;                              //inverte ligar
     if(!ligar) display2 = 0x01;                  //se ligar for 0, bit display2 = 1
    }                                             //end if prog==0
   }                                              //end if num!=0 || num2!=0
  }                                               //end if BOTAO4 && b4_flag

  if(!un)                                         //se un = 0
  {
   mult = num * 1;                                //mult � num * 3600 (hora)
  }
  if(un)                                          //se un = 1
  {
   mult = num * 5;                                //mult � num * 86400 (dia)
  }
  
  if(!un2)                                        //se un2 = 0
  {
   mult2 = num2 * 1;                              //mult2 � num2 * 3600 (hora)
  }
  if(un2)                                         //se un2 = 1
  {
   mult2 = num2 * 5;                              //mult2 � num2 * 86400 (dia)
  }

  //___b5___                                        botao para trocar de contador
  if(!BOTAO5) b5_flag = 0x01;                     //se bot�o5 for pressionado, flag do bot�o5 = 1
  
  if(BOTAO5 && b5_flag)                           //se bot�o5 for solto e flag do bot�o5 for 1
  {
   LCD_Cmd(_LCD_CLEAR);                           //limpa LCD
   b5_flag = 0x00;                                //limpa flag do bot�o5
   if(prog != 0)                                  //se prog for diferente de 0
   {
    option++;                                     //incrementa option
    if(option == 2) option=0x00;                  //se option for 2, option = 0
   }
  }                                               //end if BOTAO5 && b5_flag

}                                                 //end ler_bot()

//================================================================================
//                      FUN��O DE EXIBI��O DO DISPLAY
//================================================================================
void disp()
{
  if(!ligar && prog==0)                           //se ligar for 0 e prog for 0
  {
   if(!display && !display2)                      //se os bits diplay e display2 forem 0
   {
     LCD_Out(1,1,"  DISPENSER DE  ");             //exibe "DISPENSER DE"
     LCD_Out(2,1,"    REMEDIOS    ");             //      "  REMEDIOS  "
    }
   else                                           //sen�o
   {
    if(display && !display2)                      //se bits display for 1 e display2 for 0
    {
     display=0x00;                                //limpa bit display
     LCD_Out(1,1,"ETEC LAURO GOMES");             //exibe "ETEC LAURO GOMES"
     LCD_Out(2,1,"  3A MECA 2021  ");             //      "  3A MECA 2021  "
     delay_ms(1000);                              //espera 1 segundo
    }
    if(!display && display2)                      //se os bits display for 0 e display2 for 1
    {
     display2=0x00;                               //limpa bit display2
     LCD_Out(1,1,"     PARANDO    ");             //exibe "     PARANDO    "
     LCD_Out(2,1,"     CONTAGEM   ");             //      "     CONTAGEM   "
     delay_ms(1000);                              //espera 1 segundo
    }
   }                                              //end else
  }                                               //end if !ligar && prog==0

  if(prog==1)                                     //programa��o de numeros
  {
   LCD_Out(1,1,"PROGRAME NUMERO:");               //exibe "PROGRAME NUMERO:
   num_un();                                      //executa num_un
   if(option==0) LCD_Chr(2,14,'1');               //se option for 0, exibe "1"
   if(option==1) LCD_Chr(2,14,'2');               //se option for 1, exibe "2"
  }

  if(prog==2)                                     //se prog for 2
  {
   LCD_Out(1,1,"PROGRAME Un.:");                  //exibe "PROGRAME Un.:"
   num_un();                                      //executa num_un
   if(option==0) LCD_Chr(2,14,'1');               //se option for 0, exibe "1"
   if(option==1) LCD_Chr(2,14,'2');               //se option for 1, exibe "2"
  }

  if(ligar)                                       //se ligar for 1 (ligado)
  {
   LCD_Out(1,1,"CONTANDO:   DISP");               //exibe "CONTANDO:   DISP";
   if(temp_disp>20) temp_disp=0x00;               //se temp_disp for maior que 20, zera temp_disp
   if(temp_disp == 20)                            //se temp_disp for 20 (2 segundos)
   {
    temp_disp=0x00;                               //zera temp_disp
    option++;                                     //incrementa option
    if(option == 2) option=0x00;                  //se option for 2, option = 0
    if(option==0) LCD_Chr(2,14,'1');              //se option for 0, exibe "1"
    if(option==1) LCD_Chr(2,14,'2');              //se option for 1, exibe "2"
   }
   num_un();                                      //executa num_un
  }

}                                                 //end disp()

//==================================================================================
//                           FUN��O N�MERO E UNIDADE
//                                 FORMATA��O
//==================================================================================
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