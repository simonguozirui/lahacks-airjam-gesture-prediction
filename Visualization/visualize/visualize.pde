import netP5.*;
import oscP5.*;

OscP5 oscP5;
int r = 50;
String currentInstrument;
drum drum1, drum2, drum3, drum4;
void setup(){
  size(1080,720);
  frameRate(25);
  oscP5 = new OscP5(this, 5005);
  drum1 = new drum(280, 480, 280);
  drum2 = new drum(400, 240, 180);
  drum3 = new drum(680, 240, 180);
  drum4 = new drum(800, 480, 280);
}

void draw(){
  background(0);
  drum1.spawn();
  drum2.spawn();
  drum3.spawn();
  drum4.spawn(); 
}

///* incoming osc message are forwarded to the oscEvent method. */
//void oscEvent(OscMessage theOscMessage) {
  
//  /* print the address pattern and the typetag of the received OscMessage */
//  print("### received an osc message.");
//  print(" addrpattern: "+theOscMessage.addrPattern());
//  println(" typetag: "+theOscMessage.typetag());
//  theOscMessage.print();
//}

void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern("/hit")==true) {
     int drumToHit = theOscMessage.get(0).intValue();
     println(drumToHit);
     if (drumToHit == 1){
       drum1.hit();
     }
     if (drumToHit == 2){
       drum2.hit();
     }
     if (drumToHit == 3){
       drum3.hit();
     }
     if (drumToHit == 4){
       drum4.hit();
     }
  }
}
