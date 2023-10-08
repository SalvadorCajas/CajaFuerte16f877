int contador = 0;
int codigo[3]={0,0,0};
char *texto;
short kp=0;
  
char keypadPort at PORTB;
sbit LCD_RS at RC1_bit;
sbit LCD_EN at RC2_bit;
sbit LCD_D4 at RC3_bit;
sbit LCD_D5 at RC4_bit;
sbit LCD_D6 at RC5_bit;
sbit LCD_D7 at RC6_bit;

sbit LCD_RS_Direction at TRISC1_bit;
sbit LCD_EN_Direction at TRISC2_bit;
sbit LCD_D4_Direction at TRISC3_bit;
sbit LCD_D5_Direction at TRISC4_bit;
sbit LCD_D6_Direction at TRISC5_bit;
sbit LCD_D7_Direction at TRISC6_bit;


void main() {
trisa = 0x0;
porta.b1=0;

ANSEL  = 0;                        // CONFIGURAR LOS PINES COMO SALIDAS DIGITALES
ANSELH = 0;
C1ON_bit = 0;                      // DESACTIVAR LOS COMPARADORES
C2ON_bit = 0;


Lcd_Init();                        // FUNCIÓN QUE INICIALIZA EL LCD
Keypad_Init();                     //Inicialización Keypad
do{
Lcd_Cmd(_LCD_CLEAR);
delay_ms(100);
texto="Control  Acceso";
Lcd_Out(1,1,texto);
texto="PIC 16F887";
Lcd_Out(2,1,texto);
delay_ms(300);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,3, "Contrasena");
Lcd_Out(2,5," ");

do {
    kp = 0;                                // se reinicio el valor de la variable a 0
    do
      kp = Keypad_Key_Click();             // almacena la tecla presionada del keypad
    while (!kp);
    codigo[contador]= kp;
    //Lcd_Chr_CP(kp+48);
    Lcd_Chr_CP("*");
    contador++;
    delay_ms(100);
}
while(contador<3);

if (codigo[0]==1 && codigo[1]==5 && codigo[2]==9){
        porta.b1=1;
        contador=0;
        Lcd_Cmd(_LCD_CLEAR);
        Lcd_Out(1,2,"Acceso Correcto");
        delay_ms(1000);
        porta.B1=0;
}
else{
     codigo[1]=0;
     codigo[2]=0;
     codigo[3]=0;
     contador=0;
     Lcd_Out(1,1,"contraseña incorrecta");
     delay_ms(500);
}//fin else

}while(1);
}
