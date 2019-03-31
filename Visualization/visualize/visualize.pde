import netP5.*;
import oscP5.*;

OscP5 oscP5;
int r = 50;
String currentInstrument;
drum drum1, drum2, drum3, drum4;
guitar[] guitars = new guitar[15]; 

int w = 20; 
for(int i = 1; i < 16; i++){
  guitars[i-1] = new guitar(100+w*(i-1), 400, w,20);
}

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
  //drum1.spawn();
  //drum2.spawn();
  //drum3.spawn();
  //drum4.spawn(); 
  drawGuitar();
}

void drawGuitar(){
  noStroke();
  fill(103,67,20);
  ellipse(250,370,190,170);
  ellipse(250,270,150,150);
  fill(183,137,76);
  ellipse(250,370,170,150);
  ellipse(250,270,130,130);
  fill(113,78,32);
  ellipse(250,300,65,65);
  fill(142,102,50);
  rect(235,130,30,150,3);
  
  fill(124,82,20);
  rect(225,90,50,70,7,7,20,20);
  stroke(255,254,252);
  strokeWeight(2);
  line(250,90,250,400);
  line(245,90,245,400);
  line(255,90,255,400);
  line(260,90,260,400);
  line(240,90,240,400);
  noStroke();
  fill(183,137,76);
  ellipse(215,105,15,15);
  ellipse(215,125,15,15);
  ellipse(215,145,15,15);
  ellipse(285,105,15,15);
  ellipse(285,125,15,15);
  ellipse(285,145,15,15);
  fill(142,102,50);
  arc(250,390,60,60,0,PI);
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
