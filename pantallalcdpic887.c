// CONEXIONES CON LA PANTALLA LCD
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB6_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;


void main(){

  ANSEL  = 0;                        // CONFIGURAR LOS PINES COMO SALIDAS DIGITALES
  ANSELH = 0;
  C1ON_bit = 0;                      // DESACTIVAR LOS COMPARADORES
  C2ON_bit = 0;

  Lcd_Init();                        // FUNCIÓN QUE INICIALIZA EL LCD

Lcd_Chr_Cp('H');                     //FUNCIÓN QUE IMPRIME UN CARACTER
Lcd_Chr_Cp('o');
Lcd_Chr_Cp('l');
Lcd_Chr_Cp('a');

  while(1) {                         // CICLO INFINITO
      }
}