class guitar{
  int x,y,w,h;
    
  guitar(int xcoord, int ycoord, int rwidth, int rheight){
    x = xcoord;
    y = ycoord;
    w = rwidth;
    h = rheight;
  }
  
  void spawn(){
    
    fill(255,0,0);
    stroke(0);
    rect(x,y,w,h);
    fill(255,255,255);
    stroke(0);
    rect(x,y,w-10,h-10);
    
  }
  
  void hit(){
    for (int i = 0; i < 13; i++){
      r+=i;
      delay(12);
    }
    for (int i = 0; i < 13; i++){
      r-=i;
      delay(12);
    }
  }
}
