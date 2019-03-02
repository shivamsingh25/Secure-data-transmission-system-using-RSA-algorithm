#include <VirtualWire.h>

  char cad[100];
  int pos = 0;
void setup()
{
  vw_setup(2000); 
  vw_rx_start(); 
  Serial.begin(9600);
}
void loop()
{
  byte buf[VW_MAX_MESSAGE_LEN]; 
  byte buflen = VW_MAX_MESSAGE_LEN; 
  int i;
  if( vw_get_message(buf, &buflen) )
  {
      //Serial.print((char)buf);
      //Serial.println(buf);
    for (i = 0; i < buflen-1; i++)
    {
      Serial.print((char)buf[i]);
    }
  }
}
