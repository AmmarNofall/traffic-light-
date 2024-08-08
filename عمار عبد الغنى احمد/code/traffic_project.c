char seg1=0;
char seg3=0;
char count=0;
char leds_cond;
char flag=0;

void interrupt(){

 if(INTF_BIT==1&&portb.b1==0){
    if(flag==0){leds_cond=portb;flag=1;}
    portd.b6=portd.b7=1;
    portb.b5=portb.b6=portb.b7=0;
    
    for(count=3;count>0;count--){
     portb.b6=1;
     portc=count;
     portc.b7=1;
     delay_ms(1000);
    }
    portb.b6=portb.b2=portb.b3=0;
    portc.b6=portc.b7=portb.b4=portb.b5=1;
    
    while(portb.b0==1&&portb.b1==0){}
    if(portb.b1==1&&portb.b0==1){INTF_BIT=1;
    }else{
    portb=leds_cond;
    leds_cond=0;flag=0;
    portc.b6=portd.b6=portd.b7=0;
    INTF_BIT=0;
    }
    
    
 }else if(INTF_BIT==1&&portb.b1==1){
 
    if(flag==0){leds_cond=portb;flag=1;}
    portc.b6=portc.b7=1;
    portb.b2=portb.b3=portb.b4=0;
    
    for(count=3;count>0;count--){
     portb.b3=1;
     portd=count;
     portd.b7=1 ;
     delay_ms(1000);
    }
    portb.b3=portb.b5=portb.b6=0;
    portd.b6=portb.b2=portb.b7=1;
    
    while(portb.b0==1&&portb.b1==1){}
    if(portb.b1==0&&portb.b0==1){INTF_BIT=1;
    }else{
    portb=leds_cond;
    leds_cond=0;flag=0;
    portc.b6=portc.b7=portd.b6=portd.b7=0;
    INTF_BIT=0; 
    }
 }
}
void main() {
 adcon1=0x07;
 trisb=0b00000011;
 trisc=trisd=trisa=trise=0;
 portc=portd=porta=0;
 GIE_BIT=1;
 INTE_BIT=1;
 INTEDG_BIT=1;
 
 for(;;){
   portb=0;
   portb.b7=1;
   portb.B2=1;
   porte=1;
   porta=1;
   
   for(seg1=5,seg3=8;seg1<12;seg1++,seg3++){
    if(seg1==11){seg1=1;porta--;}
    if(seg3==11){seg3=1;porte--;}
    if(seg1==7&&porta==0){
     seg3=7;
     portb.b7=0;
     portb.b6=1;
    }
    if(seg1==10&&porta==0){
      break;
     }
    portd=10-seg1;
    portc=10-seg3;
    delay_ms(1000);
   }
   
   seg1=seg3=0;
   
   portb.B5=1;
   portb.b6=0 ;
   portb.b2=0;
   portb.b4=1;
   porta=2;
   porte=2;

   for(seg1=10,seg3=7;seg1<12;seg1++,seg3++){
    if(seg1==11){seg1=1;porta--;}
    if(seg3==11){seg3=1;porte--;}
    portd=10-seg1;
    portc=10-seg3;
    if(seg1==10&&porta==0){
    break;
    }
    delay_ms(1000);
   }

   portb.b4=0;
   portb.b3=1;
   porta=0;
   for(seg1=7;seg1<10;seg1++,seg3++){
    portd=10-seg1;
    portc=10-seg3;
    delay_ms(1000);
   }
 }
}