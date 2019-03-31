import netP5.*;
import oscP5.*;

OscP5 oscP5;

int r = 50;
String currentInstrument;
void setup(){
  size(1080,720);
  frameRate(25);
  oscP5 = new OscP5(this, 5005);
}

void draw(){
  background(0);
  ellipse(200, 200, r, r);
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());

}
