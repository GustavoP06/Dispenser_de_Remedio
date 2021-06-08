

//SAÍDAS COMUNS
sbit LED  at PORTA.b0;
sbit SOM  at PORTA.b2;
sbit LED2 at PORTA.b3;
sbit LED3 at PORTB.b0;
sbit LED4 at PORTB.b1;

//BITS SERVO MOTOR
sbit SM  at PORTA.b1;
sbit SM2 at PORTA.b4;
sbit SM3 at PORTA.b5;

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
//----------Funções----------
//---------------------------
void ler_bot();                           //ler os bits dos botões
void disp();                              //controla o que é exibido no display
void num_un();                            //define as váriaveis de exibição dos numeros para o display
void alarme();                            //alarme de aviso para quando acaba a contagem
void piscaLED();                          //controla os LEDs do circuito
void timebase();                          //contagem do dispenser n°1
void timebase2();                         //contagem do dispenser n°2
void timebase3();                         //contagem do dispenser n°3
void toca_som();                          //controla o buzzer
void abre_mot();                          //define os bits de controle do motor n°1 para abertura
void abre_mot2();                         //define os bits de controle do motor n°2 para abertura
void abre_mot3();                         //define os bits de controle do motor n°3 para abertura
void fecha_mot();                         //define os bits de controle do motor n°1 para fechamento
void fecha_mot2();                        //define os bits de controle do motor n°2 para fechamento
void fecha_mot3();                        //define os bits de controle do motor n°3 para fechamento
void mot_aberto();                        //abre o motor n°1
void mot_aberto2();                       //abre o motor n°2
void mot_aberto3();                       //abre o motor n°3
void mot_fechado();                       //fecha o motor n°1
void mot_fechado2();                      //fecha o motor n°2
void mot_fechado3();                      //fecha o motor n°3
void read_motbits();                      //ler os bits dos motores
void fast_incr();                         //incrementar num rápidamente

//--------------------------
//-------Variáveis----------
//--------------------------
unsigned temp2        = 0x00,             //variável de interrupção do dispenser n°2
         temp         = 0x00,             //variável de interrupção do dispenser n°1
         temp3        = 0x00,             //variável de interrupção do dispenser n°3
         temp_ligado  = 0x00,             //variável de contagem ligada do dispenser n°1
         temp_ligado2 = 0x00,             //variável de contagem ligada do dispenser n°2
         temp_ligado3 = 0x00,             //variável de contagem ligada do dispenser n°3
         temp_led     = 0x00,             //variável de temporização do LED 1 (indicação do dispenser n°1)
         temp_led2    = 0x00,             //variável de temporização do LED 2 (indicação on/off do dispositivo)
         temp_led3    = 0x00,             //variável de temporização do LED 3 (indicação do dispenser n°2)
         temp_led4    = 0x00,             //variável de temporização do LED 4 (indicação do dispenser n°3)
         temp_som     = 0x00,             //variável de temporização do SOM
         temp_disp    = 0x00,             //variável de temporização do display
         x_mot        = 0x00,             //variável de controle de vezes de repetição da função do motor n°1
         x_mot2       = 0x00,             //variável de controle de vezes de repetição da função do motor n°2
         x_mot3       = 0x00,             //variável de controle de vezes de repetição da função do motor n°3
         prog         = 0x00,             //variável de controle do modo de programação
         num,      // = EEPROM_Read(0x01)   número programado do dispenser n°1
         num2,     // = EEPROM_Read(0x02)   número programado do dispenser n°2
         num3,     // = EEPROM_Read(0x05)   número programado do dispenser n°3
         mult         = 0x00,             //variável de comparação com o temp_ligado (dispenser n°1)
         mult2        = 0x00,             //variável de comparação com o temp_ligado2 (dispenser n°2)
         mult3        = 0x00,             //variável de comparação com o temp_ligado3 (dispenser n°3)
         vezes        = 0x00,             //variável de vezes que o SOM toca
         option       = 0x00,             //variável que define qual dispenser está selecionado
         temp_inc     = 0x00,             //variável de temporização do botão para incremento rápido
         temp_num     = 0x00;             //variável de temporização do numero para incremento rápido

bit      ligar,                           //bit de ligar/desligar a contagem
         un,       // = EEPROM_Read(0x03)   bit que define a unidade (dia/hora) do dispenser n°1
         un2,      // = EEPROM_Read(0x04)   bit que define a unidade (dia/hora) do dispenser n°2
         un3,      // = EEPROM_Read(0x06)   bit que define a unidade (dia/hora) do dispenser n°3
         display,                         //bit high que configura o display
         display2,                        //bit low que configura o display
         toque,                           //bit que liga o alarme do dispenser n°1
         toque2,                          //bit que liga o alarme do dispenser n°2
         toque3,                          //bit que liga o alarme do dispenser n°3
         open_bit,                        //bit de controle de abertura do motor n°1
         open_bit2,                       //bit de controle de abertura do motor n°2
         open_bit3,                       //bit de controle de abertura do motor n°3
         close_bit,                       //bit de controle de fechamento do motor n°1
         close_bit2,                      //bit de controle de fechamento do motor n°2
         close_bit3,                      //bit de controle de fechamento do motor n°3
         atv_mot,                         //bit de ativação do motor n°1
         atv_mot2,                        //bit de ativação do motor n°2
         atv_mot3,                        //bit de ativação do motor n°3
         b1_flag,                         //flag do botão 1
         b2_flag,                         //flag do botão 2
         b3_flag,                         //flag do botão 3
         b4_flag,                         //flag do botão 4
         b5_flag,                         //flag do botão 5
         fast_inc;                        //bit de ativação do incremento rápido


char     dia[]        = "dia",            //variável de exibição "dia"
         hora[]       = "h  ";            //variável de exibição "h"
         
         
//================================================================================
//                            FUNÇÃO DE INTERRUPÇÃO
//================================================================================
void interrupt()                          //interrupção
{
     if(TMR1IF_bit)                       //overflow em 100ms
     {
      TMR1IF_bit  =  0x00;                //zera flag do timer1
      TMR1H       =  0x3C;
      TMR1L       =  0xB0;                //seta timer1 em 15536
      temp_led++;                         //incrementa temp_led
      temp_led2++;                        //incrementa temp_led2
      temp_led3++;                        //incrementa temp_led3
      temp_led4++;                        //incrementa temp_led4
      temp_disp++;                        //incrementa temp_disp
      temp_som++;                         //incrementa temp_som
      temp_inc++;                         //incrementa temp_inc
      temp_num++;                         //icrementa temp_num
     }

     if(TMR0IF_bit)                        //overflow em 100ms overflow
     {
      TMR0IF_bit =  0x00;                  //zera flag do timer0
      TMR0H      =  0x3C;
      TMR0L      =  0xB0;                  //seta timer0 em 15536
      temp++;                              //incrementa temp
      temp2++;                             //incrementa temp2
      temp3++;                             //incrementa temp3

     }                                     //end if TMR0IF



     piscaLED();                           //executa piscaLED
     timebase();                           //executa timebase
     timebase2();                          //executa timebase2
     timebase3();


}                                          //end interrupt()

//======================================================================================
//                             FUNÇÃO PRINCIPAL
//======================================================================================

void main (void)
{

// Registradores de Configuração:

        ADCON1        =   0x0F;                   //Define os pinos como digital
        CMCON         =   0x07;                   //Desativa os comparadores

        TMR0H         =   0x3C;
        TMR0L         =   0xB0;                   //Inicia timer0 em 15536
        TMR1H         =   0x3C;
        TMR1L         =   0xB0;                   //Inicia TMR1 em 15536


        INTCON.GIE    =   0x01;                   //Ativa interrupção global
        INTCON.PEIE   =   0x01;                   //Ativa interrupção por periféricos
        INTCON.TMR0IE =   0x01;                   //Ativa interrupção por overflow

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
        fast_inc      =   0x00;                    //     |
        toque         =   0x00;                   //     |
        toque2        =   0x00;                   //     |
        toque3        =   0x00;                   //     |
        open_bit      =   0x00;                   //     |
        open_bit2     =   0x00;                   //     |
        open_bit3     =   0x00;                   //     |
        close_bit     =   0x00;                   //     |
        close_bit2    =   0x00;                   //     |
        close_bit3    =   0x00;                   //     |
        atv_mot       =   0x00;                   //     |
        atv_mot2      =   0x00;                   //     |
        atv_mot3      =   0x00;                   //    \ /
                                                  //     V
        SM            =   0x00;                   //zerando todos os bits
        SM2           =   0x00;
        SM3           =   0x00;

        num           =   EEPROM_Read(0x01);      //lê os dados da EEPROM para variável num
        un            =   EEPROM_Read(0x03);      //lê os dados da EEPROM para variável un
        num2          =   EEPROM_Read(0x02);      //lê os dados da EEPROM para variável num2
        un2           =   EEPROM_Read(0x04);      //lê os dados da EEPROM para variável un2
        num3          =   EEPROM_Read(0x05);      //lê os dados da EEPROM para variável num3
        un3           =   EEPROM_Read(0x06);      //lê os dados da EEPROM para variável un3

        TRISA = 0x00;                             //seta todos os bits do TRISA como saída
        TRISC = 0x3F;                             //seta os bits 0,1,2,3,5 como entrada
        TRISB = 0x00;                             //seta todos os bits do TRISB como saída

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
//                              FUNÇÃO LER BOTÕES
//===============================================================================
void ler_bot()
{
  //____b1___
  if(!BOTAO1) b1_flag=0x01;                       //se botão1 for pressionado, flag do botão1 = 1

  if(BOTAO1 && b1_flag)                           //se botão1 estiver solto e flag do botão1 = 1
  {
   LCD_Cmd(_LCD_CLEAR);                           //limpa o LCD
   b1_flag = 0x00;                                //lmpa a flag do botão1
   if(!ligar)                                     //se bit ligar = 0
   {
    prog++;                                       //incrementa prog, muda a programação
    if(prog==3)                                   //se prog = 3
    {
     prog=0x00;                                   //zera a variável prog
     EEPROM_Write(0x01,num);                      //grava num na EEPROM
     delay_ms(10);                                //espera 10 micro segundos
     EEPROM_Write(0x03,un);                       //grava un na EEPROM
     delay_ms(10);                                //espera 10 micro segundos
     EEPROM_Write(0x02,num2);                     //grava num2 na EEPROM
     delay_ms(10);                                //espera 10 micro segundos
     EEPROM_Write(0x04,un2);                      //grava un2 na EEPROM
     delay_ms(10);                                //espera 10 micro segundos
     EEPROM_Write(0x05,num3);                     //grava num3 na EEPROM
     delay_ms(10);                                //espera 10 micro segundos
     EEPROM_Write(0x06,un3);                      //grava un3 na EEPROM
     delay_ms(10);                                //espera 10 micro segundos
     display=0x01;                                //bit display em 1
    
    }                                             //end if prog = 3
   
   }                                              //end if !ligar
  
  }                                               //end if BOTAO1 && b1_flag



  //___b2___
  if(!BOTAO2) 
  {
   b2_flag=0x01;                                  //se botão2 for pressionado, flag do botão2 = 1
   fast_incr();                                   //executa fast_incr
  }

  if(BOTAO2 && b2_flag)                           //se botão2 for solto e flag do botão2 for 1
  {
    LCD_Cmd(_LCD_CLEAR);                          //limpa LCD
    b2_flag    =  0x00;                           //limpa flag do botão
    fast_inc   =  0x00;                           //limpa bit de incremento rápido
   if(option==0)                                  //dispenser n°1
   {
    if(prog==1)                                   //programação de numero
    {
     num++;                                       //incrementa num
    }
    if (prog==2)                                  //programação de unidade(hora/dia)
    {
      un = ~un;                                   //inverte un
    }                                             //end if prog==2
    
    if(num>24) num=0x00;                          //se o numero passar de 24, retorna para 0
    
   }                                              //end if option==0
   
   if(option==1)                                  //dispenser n°2
   {
    if(prog==1)                                   //programação do numero
    {
     num2++;                                      //incrementa num2
    }
    if (prog==2)                                  //programação de unidade(hora/dia)
    {
      un2 = ~un2;                                 //inverte un2
    }
    
    if(num2>24) num2=0x00;                          //se o numero passar de 24, retorna para 0

   }                                              //end if option==1
   
   if(option==2)                                  //dispenser n°3
   {
    if(prog==1)                                   //programação do numero
    {
     num3++;                                      //incrementa num3
    }
    if (prog==2)                                  //programação de unidade(hora/dia)
    {
      un3 = ~un3;                                 //inverte un3
    }
    
    if(num3>24) num3=0x00;                          //se o numero passar de 24, retorna para 0
    
   }                                              //end if option==2
   
  }                                               //end if BOTAO2 e b2_flag

  //___b3___
  if(!BOTAO3) b3_flag=0x01;                       //se botão3 for pressionado, flag do botão3 = 1

  if(BOTAO3 && b3_flag)                           //se botão3 for solto e flag do botão3 for 1
  {
   LCD_Cmd(_LCD_CLEAR);                           //limpa LCD
   b3_flag     =  0x00;                           //limpa flag do botão3
   if(option==0)                                  //dispenser n°1
   {
    if(prog==1)                                   //programação do numero
    {
     num--;                                       //decrementa num

    }
    if (prog==2)                                  //programação de unidade(hora/dia)
    {
     un = ~un;                                    //inverte un
    }
    
    if(num>24) num=24;                            //se o numero for maior que 24, vai para 24
   }                                              //end if option==0
   
   if(option==1)                                  //dispenser n°2
   {
    if(prog==1)                                   //programação do número
    {
     num2--;                                      //decrementa num2

    }
    if (prog==2)                                  //programação de unidade(hora/dia)
    {
     un2 = ~un2;                                  //inverte un2
    }
    
    if(num2>24) num2=24;                          //se o numero for maior que 24, vai para 24
    
   }                                              //end if option==1
   
   if(option==2)                                  //dispenser n°3
   {
    if(prog==1)                                   //programação do número
    {
     num3--;                                      //decrementa num3

    }
    if (prog==2)                                  //programação de unidade(hora/dia)
    {
     un3 = ~un3;                                  //inverte un3
    }
    
    if(num3>24) num3=24;                          //se o numero for maior que 24, vai para 24
    
   }                                              //end if option==2
   
  }                                               //end if botão3 e b3_flag

  //___b4___
  if(!BOTAO4) b4_flag=0x01;                       //se botão4 for pressionado, flag do botão4 = 1

  if(BOTAO4 && b4_flag)                           //se botão4 for solto e flag do botão4 for 1
  {
    LCD_Cmd(_LCD_CLEAR);                          //limpa LCD
    b4_flag    =  0x00;                           //limpa flag do botão4
   if(num!=0 || num2!=0 || num3)                  //se num, num2 ou num3 for diferente 0
   {
    if(prog==0)                                   //se prog = 0
    {
     if(!ligar)                                   //se bit de ligar = 0 (desligado)
     {
      temp =0x00;                                 //zera temp
      temp2=0x00;                                 //zera temp2
      temp3=0x00;                                 //zera temp3
      
     }                                            //end if !ligar
     ligar = ~ligar;                              //inverte ligar
     if(!ligar) display2 = 0x01;                  //se ligar for 0, bit display2 = 1
     
    }                                             //end if prog==0
    
   }                                              //end if num!=0 || num2!=0
   
  }                                               //end if BOTAO4 && b4_flag

  if(!un)                                         //se un = 0
  {
   mult = num * 1;                                //mult é num * 3600 (hora)
  }
  if(un)                                          //se un = 1
  {
   mult = num * 5;                                //mult é num * 86400 (dia)
  }
  
  if(!un2)                                        //se un2 = 0
  {
   mult2 = num2 * 1;                              //mult2 é num2 * 3600 (hora)
  }
  if(un2)                                         //se un2 = 1
  {
   mult2 = num2 * 5;                              //mult2 é num2 * 86400 (dia)
  }
  
  if(!un3)                                        //se un3 = 0
  {
   mult3 = num3 * 1;                              //mult3 é num3 * 3600 (hora)
  }
  if(un3)                                         //se un3 = 1
  {
   mult3 = num3 * 5;                              //mult3 é num3 * 86400 (dia)
  }

  //___b5___                                        botao para trocar de contador
  if(!BOTAO5) b5_flag = 0x01;                     //se botão5 for pressionado, flag do botão5 = 1
  
  if(BOTAO5 && b5_flag)                           //se botão5 for solto e flag do botão5 for 1
  {
   LCD_Cmd(_LCD_CLEAR);                           //limpa LCD
   b5_flag = 0x00;                                //limpa flag do botão5
   if(prog != 0)                                  //se prog for diferente de 0
   {
    option++;                                     //incrementa option
    if(option == 3) option=0x00;                  //se option for 3, option = 0
   }
  }                                               //end if BOTAO5 && b5_flag

}                                                 //end ler_bot()


//================================================================================
//               FUNÇÃO PARA INCREMENTAR NÚMEROS RAPIDAMENTE
//================================================================================
void fast_incr()
{
  if(temp_inc>7)temp_inc=0x00;                     //se temp_inc maior que 7, zera temp_inc
  if(temp_inc==7)                                  //conta 700ms...
  {
   temp_inc=0x00;                                  //zera temp_inc
   fast_inc=0x01;                                  //ativa fast_inc
  }                                                //end if temp_inc==7
 
 if(fast_inc)                                     //se fast_inc for ativado...
 {
  if(option==0 && prog==1)                        //se dispenser n°1 selecionado e programção de número
  {
   if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
   if(temp_num==5)                                //conta 500ms...
   {
    temp_num=0x00;                                //zera temp_num
    num += 2;                                     //acrescenta 2 em num
    
   }                                              //end if temp_num==5
   
  }                                               //end if option==0 && prog=1
  
  
  if(option==1 && prog==1)                        //se dispenser n°2 selecionado e programção de número
  {
   if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
   if(temp_num==5)                                //conta 500ms...
   {
    temp_num=0x00;                                //zera temp_num
    num2 += 2;                                    //acrescenta 2 em num2

   }                                              //end if temp_num==5

  }                                               //end if option==1 && prog=1
  
  if(num >24) num =0x00;                          //se o numero passar de 24, retorna para 0
  if(num2>24) num2=0x00;                          //se o numero passar de 24, retorna para 0
  if(num3>24) num3=0x00;                          //se o numero passar de 24, retorna para 0
  
 }                                                //end if fast_inc
 
 
 if(option==2 && prog==1)                         //se dispenser n°3 selecionado e programção de número
  {
   if(temp_num>5)temp_num=0x00;                   //se temp_num maior que 5, zera temp_num
   if(temp_num==5)                                //conta 500ms...
   {
    temp_num=0x00;                                //zera temp_num
    num3 += 2;                                    //acrescenta 2 em num3

   }                                              //end if temp_num==5

  }                                               //end if option==2 && prog=1
 
}                                                 //end void fast_incr()


//================================================================================
//                      FUNÇÃO DE EXIBIÇÃO DO DISPLAY
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
   else                                           //senão
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

  if(prog==1)                                     //programação de numeros
  {
   LCD_Out(1,1,"PROGRAME NUMERO:");               //exibe "PROGRAME NUMERO:
   num_un();                                      //executa num_un
   if(option==0) LCD_Chr(2,14,'1');               //se option for 0, exibe "1"
   if(option==1) LCD_Chr(2,14,'2');               //se option for 1, exibe "2"
   if(option==2) LCD_Chr(2,14,'3');              //se option for 2, exibe "3"
  }

  if(prog==2)                                     //se prog for 2
  {
   LCD_Out(1,1,"PROGRAME Un.:");                  //exibe "PROGRAME Un.:"
   num_un();                                      //executa num_un
   if(option==0) LCD_Chr(2,14,'1');               //se option for 0, exibe "1"
   if(option==1) LCD_Chr(2,14,'2');               //se option for 1, exibe "2"
   if(option==2) LCD_Chr(2,14,'3');              //se option for 2, exibe "3"
  }

  if(ligar)                                       //se ligar for 1 (ligado)
  {
   LCD_Out(1,1,"CONTANDO:   DISP");               //exibe "CONTANDO:   DISP";
   if(temp_disp>20) temp_disp=0x00;               //se temp_disp for maior que 20, zera temp_disp
   if(temp_disp == 20)                            //se temp_disp for 20 (2 segundos)
   {
    temp_disp=0x00;                               //zera temp_disp
    option++;                                     //incrementa option
    if(option == 3) option=0x00;                  //se option for 3, option = 0
    if(option==0) LCD_Chr(2,14,'1');              //se option for 0, exibe "1"
    if(option==1) LCD_Chr(2,14,'2');              //se option for 1, exibe "2"
    if(option==2) LCD_Chr(2,14,'3');              //se option for 2, exibe "3"
   }
   num_un();                                      //executa num_un
  }

}                                                 //end disp()

//==================================================================================
//                           FUNÇÃO NÚMERO E UNIDADE
//                                 FORMATAÇÃO
//==================================================================================
void num_un()
{
 char dig2,dig1;                                  //cria variáveis dígito 2 e dígito 1
 if(option==0)                                    //se option for 0 (dispenser n° 1 selecionado)
 {
  dig2 = num/10;                                  //dígito 2 é igual a num dividido por 10
  dig1 = num%10;                                  //digito 1 é igual a sobra da divisão de num por 10

  LCD_Chr(2,2,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
  LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display

  if(!un) LCD_Out(2,5,hora);                      //se un for zero, exibe "hora"

  if(un) LCD_Out(2,5,dia);                        //se un for um, exibe "dia"
  
 }                                                //end if option==0
 

 if(option==1)                                    //se option for 1 (dispenser n°2 selecionado)
 {
  dig2 = num2/10;                                 //digito 2 é igual a num2 dividido por 10
  dig1 = num2%10;                                 //digito 1 é igual a sobra da divisão de num2 por 10

  LCD_Chr(2,2,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
  LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display

  if(!un2) LCD_Out(2,5,hora);                     //se un2 for zero, exibe "hora"

  if(un2) LCD_Out(2,5,dia);                       //se un2 for um, exibe "dia"
  
 }                                                //end if option==1
 
 if(option==2)                                    //se option for 1 (dispenser n°2 selecionado)
 {
  dig2 = num3/10;                                 //digito 2 é igual a num3 dividido por 10
  dig1 = num3%10;                                 //digito 1 é igual a sobra da divisão de num3 por 10

  LCD_Chr(2,2,dig2+0x30);                         //soma digito 2 com 30 hexa para exibição no display
  LCD_Chr_Cp (dig1+0x30);                         //soma digito 1 com 30 hexa para exibição no display

  if(!un3) LCD_Out(2,5,hora);                     //se un3 for zero, exibe "hora"

  if(un3) LCD_Out(2,5,dia);                       //se un3 for um, exibe "dia"

 }                                                //end if option==2
 
}                                                 //end num_un()


//=================================================================================
//                        FUNÇÃO DE CONTROLE DOS LEDS
//=================================================================================
void piscaLED()
{

  if(ligar && !toque && num!=0)                   //se ligar for um(ligado), toque for zero e num diferente de zero...
  {                                               //ou seja, se o dispenser n°1 estiver ligado...
   if(temp_led>=10)                               //conta 1 segundo
   {
            temp_led = 0x00;                      //zera temp_led
            LED  = ~LED;                          //inverte LED de indicação do dispenser n°1
   }                                              //end if temp_led>=10

  }                                               //end if ligar && !toque && num!=0

  else                                            //senão...
  {
   if(ligar && toque)                             //se ligar for 1 e toque for 1
   {                                              //ou seja, se o tempo do contador n° 1 acabou...
    if(temp_led>=2)                               //conta 200ms
    {
     temp_led=0x00;                               //zera temp_led
     LED = ~LED;                                  //inverte LED de indicação do dispenser n°1
                                                  //(pisca o LED a cada 200 milisegundos
    }                                             //end if temp_led>=2

   }                                              //end if ligar && toque
   else                                           //senão...
   {
    if(prog>0 && option==0)                       //se estiver em programação e dispenser n°1 selecionado
    {
     LED = 0x01;                                  //LED do dispenser n°1 aceso
    }                                             //end if prog>0 && option==0

    else LED = 0x00;                              //senão, LED do dispenser n°1 desligado
    
   }                                              //end else
   
  }                                               //end else



 if(temp_led2 ==5)                                //conta 500ms
 {                                                //para o LED de indicação geral
  temp_led2=0x00;                                 //zera temp_led2
  LED2 = ~LED2;                                   //inverte estado do LED de indicação geral
  
 }                                                //end if temp_led==5
 
 if(ligar && !toque2 && num2!=0)                  //se ligar for 1, toque 2 for 0 e num2 diferente de 0...
 {                                                //ou seja, se o dispenser n°2 for ligado...
  if(temp_led3>=10)                               //conta 1 segundo
  {
   temp_led3 = 0x00;                              //zera temp_led3
   LED3 = ~LED3;                                  //inverte estado do LED de indicação do dispenser n°2
   
  }                                               //end if temp_led3>=10
  
 }                                                //end if ligar && !toque2 && num2!=0
 
 else                                             //senão...
 {
  if(ligar && toque2)                             //se ligar e toque2 for 1
  {                                               //ou seja, o contador do dispenser n°2 acabou
   if(temp_led3>=2)                               //conta 200 milisegundos
   {
    temp_led3=0x00;                               //zera temp_led3
    LED3 = ~LED3;                                 //inverte estado do LED de indicação do dispenser n°2
    
   }                                              //end if temp_led3>=2
   
  }                                               //end if ligar && toque2
  
  else
  {
   if(prog>0 && option==1)                        //se estiver em programação e dispenser n°2 selecionado
   {
    LED3 = 0x01;                                  //LED do dispenser n°2 aceso
   }                                              //end if prog>0 && option==1

  else LED3 = 0x00;                               //senão, LED do dispenser n°2 desligado
  
  }                                               //end else
  
 }                                                //end else
 
 if(ligar && !toque3 && num3!=0)                  //se ligar for 1, toque3 for 0 e num3 diferente de 0...
 {                                                //ou seja, se o dispenser n°3 for ligado...
  if(temp_led4>=10)                               //conta 1 segundo
  {
   temp_led4 = 0x00;                              //zera temp_led4
   LED4 = ~LED4;                                  //inverte estado do LED de indicação do dispenser n°3

  }                                               //end if temp_led4>=10

 }                                                //end if ligar && !toque3 && num3!=0

 else                                             //senão...
 {
  if(ligar && toque3)                             //se ligar e toque3 for 1
  {                                               //ou seja, o contador do dispenser n°3 acabou
   if(temp_led4>=2)                               //conta 200 milisegundos
   {
    temp_led4=0x00;                               //zera temp_led4
    LED4 = ~LED4;                                 //inverte estado do LED de indicação do dispenser n°3

   }                                              //end if temp_led4>=2

  }                                               //end if ligar && toque3

 else
  {
   if(prog>0 && option==2)                        //se estiver em programação e dispenser n°3 selecionado
   {
    LED4 = 0x01;                                  //LED do dispenser n°3 aceso
   }                                              //end if prog>0 && option==2

  else LED4 = 0x00;                               //senão, LED do dispenser n°3 desligado

  }                                               //end else

 }                                                //end else
 
}                                                 //end piscaLED()


//================================================================================
//                      FUNÇÃO DE EXECUÇÃO DO CONTADOR
//                             -DISPENSER N°1-
//================================================================================
void timebase()
{
  if(!ligar)                                      //se ligar for 0
  {                                               //ou seja, se contador desligado...
   temp_ligado = 0x00;                            //zera temp_ligado
  }
  if(ligar && num!=0)                             //se ligar for 1 e num diferente de 0...
  {                                               //ativa o contador
   if(temp==10)                                   //conta 1 segundo
   {
    temp = 0x00;                                  //zera temp
    temp_ligado++;                                //incrementa temp_ligado a cada 1 segundo
    
   }                                              //end if temp==10
   
   if(temp_ligado==mult)                          //compara a igualdade de temp_ligado com mult
   {                                              //o contador atingiu o tempo programado...
    toque = 0x01;                                 //liga o bit toque
    atv_mot = 0x01;                               //liga o bit de ativação do motor
    abre_mot();                                   //define os bits de controle do motor para abri-lo
    
   }                                              //end if temp_ligado==mult
   
   if(atv_mot)                                    //se ativação do motor for ligada...
   {
    read_motbits();                               //executa a leitura dos bits de controle dos motores

   }                                              //end if atv_mot
   
   else                                           //senão...
   {
    alarme();                                     //executa o alarme
   }
  }                                               //end if ligar
  
}                                                 //end timebase()


//================================================================================
//                     FUNÇÃO DE EXECUÇÃO DO CONTADOR
//                             -DISPENSER N°2-
//================================================================================
void timebase2()
{
  if(!ligar)                                      //se ligar for 0
  {                                               //contadores desligados...
   temp_ligado2 = 0x00;                           //zera temp_ligado2
  }
  
  if(ligar && num2!=0)                            //se ligar for 1 e num2 diferente de 0
  {                                               //contador do dispenser n°2 ligado
   if(temp2==10)                                  //conta 1 segundo
   {
    temp2 = 0x00;                                 //zera temp2
    temp_ligado2++;                               //incrementa temp_ligado2 a cada 1 segundo
    
   }                                              //end if temp2==10
   
   if(temp_ligado2==mult2)                        //compara igualdade entre temp_ligado2 e mult2
   {                                              //acabou o tempo do contador do dispenser n°2...
    toque2 = 0x01;                                //liga o bit toque2
    atv_mot2 = 0x01;                              //liga o bit de aativação do motor 2
    abre_mot2();                                  //define os bits de controle do motor 2 para abrir
    
   }                                              //end if temp_ligado2==mult2
   
   if(atv_mot2)                                   //se ativação do motor 2 ligada...
   {
    read_motbits();                               //executa a leitura dos bits de controle dos motores
    
   }                                              //end if atv_mot2

   else                                           //senão...
   {
    alarme();                                     //aciona o alarme
    
   }                                              //end else
   
  }                                               //end if ligar && num2!=0
  
}                                                 //end timebase2()


//================================================================================
//                     FUNÇÃO DE EXECUÇÃO DO CONTADOR
//                             -DISPENSER N°3-
//================================================================================
void timebase3()
{
  if(!ligar)                                      //se ligar for 0
  {                                               //contadores desligados...
   temp_ligado3 = 0x00;                           //zera temp_ligado3
  }

  if(ligar && num3!=0)                            //se ligar for 1 e num3 diferente de 0
  {                                               //contador do dispenser n°3 ligado
   if(temp3==10)                                  //conta 1 segundo
   {
    temp3 = 0x00;                                 //zera temp3
    temp_ligado3++;                               //incrementa temp_ligado3 a cada 1 segundo

   }                                              //end if temp3==10

   if(temp_ligado3==mult3)                        //compara igualdade entre temp_ligado3 e mult3
   {                                              //acabou o tempo do contador do dispenser n°3...
    toque3 = 0x01;                                //liga o bit toque3
    atv_mot3 = 0x01;                              //liga o bit de aativação do motor 3
    abre_mot3();                                  //define os bits de controle do motor 3 para abrir

   }                                              //end if temp_ligado3==mult3

   if(atv_mot3)                                   //se ativação do motor 3 ligada...
   {
    read_motbits();                               //executa a leitura dos bits de controle dos motores

   }                                              //end if atv_mot3

   else                                           //senão...
   {
    alarme();                                     //aciona o alarme

   }                                              //end else

  }                                               //end if ligar && num3!=0

}                                                 //end timebase3()


//================================================================================
//                      FUNÇÃO DE EXECUÇÃO DO ALARME
//================================================================================
void alarme()
{
 if(toque || toque2 || toque3)                    //se toque, toque2 ou toque3 for 1
 {                                                //algum dos contadores acabaram...
   if(vezes <10)                                  //se vezes for menor que 10
   {                                              //(vezes que o SOM tocará)
    toca_som();                                   //executa a toca do SOM
    
   }                                              //end if vezes<10
   
   else                                           //senão...
   {
    if(toque)                                     //se toque for 1
    {
     toque=0x00;                                  //limpa o bit toque
     temp_ligado=0x00;                            //zera temp_ligado para recomeçar a contagem
     
    }                                             //end if toque
    
    if(toque2)                                    //se toque2 for 1
    {
     toque2=0x00;                                 //limpa o bit toque 2
     temp_ligado2=0x00;                           //zera temp_ligado2 para recomeçar a contagem
     
    }                                             //end if toque2
    
    if(toque3)                                    //se toque2 for 1
    {
     toque3=0x00;                                 //limpa o bit toque3
     temp_ligado3=0x00;                           //zera temp_ligado3 para recomeçar a contagem

    }                                             //end if toque3
    
     vezes=0x00;                                  //zera vezes
     SOM = 0x00;                                  //desliga o som
     
   }                                              //end else
   
 }                                                //end if toque || toque2 || toque3
 
}                                                 //end alarme()


//=================================================================================
//                      FUNÇÃO DE ACIONAMENTO DO BUZZER
//=================================================================================
void toca_som()
{
 if(temp_som>3) temp_som=0x00;                    //se temp_som for maior que 3, zera temp_som
    if(temp_som==3)                               //conta 300 milisegundos...
    {
     temp_som = 0x00;                             //zera temp_som
     SOM = ~SOM;                                  //inverte o estado do buzzer
     vezes++;                                     //incrementa vezes
     
     if(!ligar)                                   //se ligar for 0 (desligado)
     {
      vezes = 0x00;                               //zera vezes
      SOM   = 0x00;                               //desliga o buzzer
      
     }                                            //end if !ligar
     
    }                                             //end if temp_som==3
    
}                                                 //end toca_som()


//================================================================================
//                          FUNÇÃO DE CONFIGURAÇÃO DOS
//                    BITS DE CONTROLE DO MOTOR 1 PARA ABRIR
//================================================================================
void abre_mot()
{
 open_bit  = 0x01;                                //seta bit de abertura
 close_bit = 0x00;                                //limpa bit de fechamento
 x_mot     = 0x00;                                //zera x_mot
 
}                                                 //end abre_mot()


//================================================================================
//                          FUNÇÃO DE CONFIGURAÇÃO DOS
//                    BITS DE CONTROLE DO MOTOR 2 PARA ABRIR
//================================================================================
void abre_mot2()
{
 open_bit2  = 0x01;                               //seta bit de abertura
 close_bit2 = 0x00;                               //limpa bit de fechamento
 x_mot2     = 0x00;                               //zera x_mot
 
}                                                 //end abre_mot2()


//================================================================================
//                          FUNÇÃO DE CONFIGURAÇÃO DOS
//                    BITS DE CONTROLE DO MOTOR 3 PARA ABRIR
//================================================================================
void abre_mot3()
{
 open_bit3  = 0x01;                               //seta bit de abertura
 close_bit3 = 0x00;                               //limpa bit de fechamento
 x_mot3     = 0x00;                               //zera x_mot

}                                                 //end abre_mot3()


//================================================================================
//                       FUNÇÃO DE ABERTURA DO MOTOR 1
//================================================================================
void mot_aberto()
{
 if(x_mot<10)                                     //se x_mot for menor que 10...
  {
    SM=0;                                         //  ||
    delay_us(18000);                              //  ||
    SM=1;                                         //  ||
    delay_us(2000);                               //  \/
    SM=0;                                         // liga motor 1 no sentido horário
    x_mot ++;                                     //incrementa x_mot
    
  }                                               //end if x_mot<10
  
  if(x_mot == 10)                                 //se x_mot for 10...
   {
    fecha_mot();                                  //executa a configuração dos bits de controle do motor 1 para fechar
    
   }                                              //end if x_mot==10

}                                                 //end mot_aberto()


//================================================================================
//                       FUNÇÃO DE ABERTURA DO MOTOR 2
//================================================================================
void mot_aberto2()
{
 if(x_mot2<10)                                    //se x_mot2 for menor que 10...
  {
    SM2=0;                                        //  ||
    delay_us(18000);                              //  ||
    SM2=1;                                        //  ||
    delay_us(2000);                               //  \/
    SM2=0;                                        //liga motor 2 no sentido horário
    x_mot2 ++;                                    //incrementa x_mot2
    
  }                                               //end if x_mot2<10
  
  if(x_mot2 == 10)                                //se x_mot2 for 10...
   {
    fecha_mot2();                                 //executa a configuração dos bits de controle do motor 2 para fechar
    
   }                                              //end if x_mot2==10
   
}                                                 //end mot_aberto2()


//================================================================================
//                       FUNÇÃO DE ABERTURA DO MOTOR 3
//================================================================================
void mot_aberto3()
{
 if(x_mot3<10)                                    //se x_mot3 for menor que 10...
  {
    SM3=0;                                        //  ||
    delay_us(18000);                              //  ||
    SM3=1;                                        //  ||
    delay_us(2000);                               //  \/
    SM3=0;                                        // liga motor 1 no sentido horário
    x_mot3 ++;                                    //incrementa x_mot3

  }                                               //end if x_mot3<10

  if(x_mot3 == 10)                                //se x_mot3 for 10...
   {
    fecha_mot3();                                 //executa a configuração dos bits de controle do motor 3 para fechar

   }                                              //end if x_mot3==10

}                                                 //end mot_aberto3()


//================================================================================
//                          FUNÇÃO DE CONFIGURAÇÃO DOS
//                    BITS DE CONTROLE DO MOTOR 1 PARA FECHAR
//================================================================================
void fecha_mot()
{
 open_bit  = 0x00;                                //limpa o bit de abertura
 close_bit = 0x01;                                //seta o bit de fechamento
 x_mot     = 0x00;                                //zera x_mot
 
}                                                 //end fecha_mot()


//================================================================================
//                          FUNÇÃO DE CONFIGURAÇÃO DOS
//                    BITS DE CONTROLE DO MOTOR 2 PARA FECHAR
//================================================================================
void fecha_mot2()
{
 open_bit2  = 0x00;                               //limpa o bit de abertura
 close_bit2 = 0x01;                               //seta o bit de fechamento
 x_mot2     = 0x00;                               //zera x_mot2
 
}                                                 //end fecha_mot2()


//================================================================================
//                          FUNÇÃO DE CONFIGURAÇÃO DOS
//                    BITS DE CONTROLE DO MOTOR 3 PARA FECHAR
//================================================================================
void fecha_mot3()
{
 open_bit3  = 0x00;                               //limpa o bit de abertura
 close_bit3 = 0x01;                               //seta o bit de fechamento
 x_mot3     = 0x00;                               //zera x_mot3

}                                                 //end fecha_mot3()


//================================================================================
//                       FUNÇÃO DE FECHAMENTO DO MOTOR 1
//================================================================================
void mot_fechado()
{
 if(x_mot<10)                                     //se x_mot for menor que 10
  {
    SM=0;                                         //  ||
    delay_us(18500);                              //  ||
    SM=1;                                         //  ||
    delay_us(1500);                               //  \/
    SM=0;                                         //leva o motor para a posição inicial
    x_mot++;                                      //incrementa x_mot
    
  }                                               //end if x_mot<10
  
  if(x_mot==10)                                   //se x_mot for 10
    {
     close_bit = 0x00;                            //limpa o bit de fechamento
     
    }                                             //end if x_mot==10

}                                                 //end mot_fechado


//================================================================================
//                       FUNÇÃO DE FECHAMENTO DO MOTOR 2
//================================================================================
void mot_fechado2()
{
  if(x_mot2<10)                                   //se x_mot2 for menor que 10
  {
    SM2=0;                                        //  ||
    delay_us(18500);                              //  ||
    SM2=1;                                        //  ||
    delay_us(1500);                               //  \/
    SM2=0;                                        //leva o motor 2 para a posição inicial
    x_mot2++;                                     //incrementa x_mot2
    
  }                                               //end if x_mot2<10
  
  if(x_mot2==10)                                  //se x_mot2 for 10
    {
     close_bit2 = 0x00;                           //limpa o bit de fechamento
     
    }                                             //end if x_mot2==10
    
}                                                 //end mot_fechado2()


//================================================================================
//                       FUNÇÃO DE FECHAMENTO DO MOTOR 3
//================================================================================
void mot_fechado3()
{
  if(x_mot3<10)                                   //se x_mot3 for menor que 10
  {
    SM3=0;                                        //  ||
    delay_us(18500);                              //  ||
    SM3=1;                                        //  ||
    delay_us(1500);                               //  \/
    SM3=0;                                        //leva o motor 3 para a posição inicial
    x_mot3++;                                     //incrementa x_mot3

  }                                               //end if x_mot2<10

  if(x_mot3==10)                                  //se x_mot3 for 10
    {
     close_bit3 = 0x00;                           //limpa o bit de fechamento

    }                                             //end if x_mot3==10

}                                                 //end mot_fechado3()


//================================================================================
//                         FUNÇÃO DE LEITURA DOS BITS
//                          DE CONTROLE DOS MOTORES
//================================================================================
void read_motbits()
{
   if(!open_bit && !close_bit) atv_mot = 0x00;    //se os bits de abertura e fechamento do motor 1 forem 0,
                                                  //desliga a ativação do motor 1

   if(open_bit && !close_bit)                     //se o bit de abertura for 1 e o de fechamento for 0...
   {
    mot_aberto();                                 //executa a abertura do motor 1
    
   }                                              //end if open_bit && !close_bit

   if(!open_bit && close_bit)                     //se o bit de abertura for 0 e o de fechamento for 1...
   {
    mot_fechado();                                //executa o fechamento do motor 1
    
   }                                              //end if !open_bit && close_bit
   
   
   if(!open_bit2 && !close_bit2) atv_mot2 = 0x00; //se os bits de abertura e fechamento do motor 2 forem 0,
                                                  //desliga a ativação do motor 2

   if(open_bit2 && !close_bit2)                   //se o bit de abertura for 1 e o de fechamento for 0...
   {
    mot_aberto2();                                //executa a abertura do motor 2
    
   }                                              //end if open_bit2 && !close_bit2

   if(!open_bit2 && close_bit2)                   //se o bit de abertura for 0 e o de fechamento for 1...
   {
    mot_fechado2();                               //executa o fechamento do motor 2
    
   }                                              //end if !open_bit2 && close_bit2
   
   
   if(!open_bit3 && !close_bit3) atv_mot3 = 0x00; //se os bits de abertura e fechamento do motor 3 forem 0,
                                                  //desliga a ativação do motor 3

   if(open_bit3 && !close_bit3)                   //se o bit de abertura for 1 e o de fechamento for 0...
   {
    mot_aberto3();                                //executa a abertura do motor 3

   }                                              //end if open_bit3 && !close_bit3

   if(!open_bit3 && close_bit3)                   //se o bit de abertura for 0 e o de fechamento for 1...
   {
    mot_fechado3();                               //executa o fechamento do motor 3

   }                                              //end if !open_bit3 && close_bit3
   
}                                                 //end read_motbits()