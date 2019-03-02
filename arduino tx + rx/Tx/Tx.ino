#include <VirtualWire.h>
  char cad[100];
  int i=0;
void setup()
{
  Serial.begin(9600); 
  vw_setup(2000); 
  Serial.print("End with \".\" each data");
}
void loop()
{
  if( Serial.available() > 0)
  {
    cad[i] = Serial.read(); 
    i++;
  }
  if( cad[i-1] == '.')
  {
    cad[i] = '\0'; 
    i=0;
    vw_send((byte *)cad, strlen(cad)); 
    delay(400);
  }
}
