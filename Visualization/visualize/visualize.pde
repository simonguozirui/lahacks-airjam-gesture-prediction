import netP5.*;
import oscP5.*;

OscP5 oscP5;
int r = 50;
String currentInstrument = "guitar";
//String currentInstrument = "drum";
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
  //guitars
  guitar1 = new guitar(230, 360, 40, 50);
  guitar2 = new guitar(270, 360, 40, 50);
  guitar3 = new guitar(310, 360, 35, 50);
  guitar4 = new guitar(345, 360, 35, 50);
  guitar5 = new guitar(380, 360, 30, 50);
  guitar6 = new guitar(410, 360, 30, 50);
  guitar7 = new guitar(440, 360, 25, 50);
  guitar8 = new guitar(465, 360, 25, 50);
  guitar9 = new guitar(490, 360, 20, 50);
  guitar10 = new guitar(510, 360, 20, 50);
  guitar11 = new guitar(530, 360, 20, 50);
  guitar12 = new guitar(550, 360, 20, 50);
  guitar13 = new guitar(570, 360, 20, 50);
  guitar14 = new guitar(590, 360, 20, 50);
  guitar15 = new guitar(610, 360, 20, 50);
  guitar16 = new guitar(630, 360, 20, 50);
}


void draw(){
  background(0);
  if (currentInstrument.equals("drum")){
    drawDrum();
  }else if (currentInstrument.equals("guitar")){
    drawGuitar();
  }
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
  guitar1.spawn();
  guitar2.spawn();
  guitar3.spawn();
  guitar4.spawn();
  guitar5.spawn();
  guitar6.spawn();
  guitar7.spawn();
  guitar8.spawn();
  guitar9.spawn();
  guitar10.spawn();
  guitar11.spawn();
  guitar12.spawn();
  guitar13.spawn();
  guitar14.spawn();
  guitar15.spawn();
  guitar16.spawn();
}


void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern("/hit")==true) {
     int toHit = theOscMessage.get(0).intValue();
     println(toHit);
     if (currentInstrument.equals("drum")){
       hitDrum(toHit);
     }else if (currentInstrument.equals("guitar")){
       hitGuitar(toHit);
     }
  }
}

void hitDrum(int num){
  if (num == 1){
     drum1.hit();
   }
   if (num == 2){
     drum2.hit();
   }
   if (num == 3){
     drum3.hit();
   }
   if (num == 4){
     drum4.hit();
   }
}


void hitGuitar(int num){
  num = 17 - num;
  if (num == 1){
     guitar1.hit();
   }
   if (num == 2){
     guitar2.hit();
   }
   if (num == 3){
     guitar3.hit();
   }
   if (num == 4){
     guitar4.hit();
   }
   if (num == 5){
     guitar5.hit();
   }
   if (num == 6){
     guitar6.hit();
   }
   if (num == 7){
     guitar7.hit();
   }
   if (num == 8){
     guitar8.hit();
   }
   if (num == 9){
     guitar9.hit();
   }
   if (num == 10){
     guitar10.hit();
   }
   if (num == 11){
     guitar11.hit();
   }
   if (num == 12){
     guitar12.hit();
   }
   if (num == 13){
     guitar13.hit();
   }
   if (num == 14){
     guitar14.hit();
   }
   if (num == 15){
     guitar15.hit();
   }
   if (num == 16){
     guitar16.hit();
   }
}
