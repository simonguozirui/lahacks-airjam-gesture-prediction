class guitar{
  int x,y,w,h;
    
  guitar(int xcoord, int ycoord, int rwidth, int rheight){
    x = xcoord;
    y = ycoord;
    w = rwidth;
    h = rheight;
  }
  
  void spawn(){ 
    fill(39,116,174);
    stroke(0);
    rect(x,y,w,h);
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
