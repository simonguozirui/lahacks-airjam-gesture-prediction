class drum{
  int x,y,r;
    
  drum(int xcoord, int ycoord, int radius){
    x = xcoord;
    y = ycoord;
    r = radius;
  }
  
  void spawn(){
    fill(255,0,0);
    stroke(0);
    ellipse(x, y, r, r);
    //fill(255,255,255);
    stroke(0);
    ellipse(x, y, r-10, r-10);
  }
  
  void hit(){
    for (int i = 0; i < 15; i++){
      r+=i;
      delay(15);
    }
    for (int i = 0; i < 15; i++){
      r-=i;
      delay(15);
    }
  }
}
