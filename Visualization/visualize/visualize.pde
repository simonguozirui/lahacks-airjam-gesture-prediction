import netP5.*;
import oscP5.*;

OscP5 oscP5;
int r = 50;
String currentInstrument;
drum drum1, drum2, drum3, drum4;
guitar guitar1, guitar2, guitar3, guitar4, guitar5, guitar6, guitar7, guitar8, guitar9, guitar10, guitar11, guitar12, guitar13, guitar14, guitar15, guitar16;
PImage guitarShape, gcp, openpose, lahacks, processing;
int w =  20; 

void setup(){
  size(1080,720);
  frameRate(25);
  
  guitarShape = loadImage("guitar-w.png");
  gcp = loadImage("gcp.png");
  openpose = loadImage("openpose.png");
  lahacks = loadImage("lahacks.png");
  processing = loadImage("processing.png");
  oscP5 = new OscP5(this, 3333);
  //drums
  drum1 = new drum(280, 480, 280);
  drum2 = new drum(400, 240, 180);
  drum3 = new drum(680, 240, 180);
  drum4 = new drum(800, 480, 280);
}

void draw(){
  background(0);
  //drawDrum();
  drawGuitar();
}

void drawDrum(){
  drum1.spawn();
  image(openpose, 205, 415, 150, 150);
  drum2.spawn();
  image(gcp, 360, 200, 80, 80);
  drum3.spawn();
  image(processing, 630, 190, 100, 100);
  drum4.spawn(); 
  image(lahacks, 725, 410, 150, 150);
}

void drawGuitar(){
  image(guitarShape, 50, 200);
  rect(0,0,0,0);
}

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
