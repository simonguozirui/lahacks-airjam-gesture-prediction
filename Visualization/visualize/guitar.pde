class guitar{
  int x,y,w,h;
    
  int w_start = 0;
  int h_start = 0;
  guitar(int xcoord, int ycoord, int rwidth, int rheight){
    x = xcoord;
    y = ycoord;
    w = rwidth;
    h = rheight;
  }
  
  void spawn(){ 
    fill(39,116,174);
    stroke(255);
    rect(x,y,w_start,h_start);
  }
  
  void hit(){
    w_start = w;
    h_start = h;
    delay(1000);
    w_start = 0;
    h_start = 0;
    
    //delay(200);
  }
}
