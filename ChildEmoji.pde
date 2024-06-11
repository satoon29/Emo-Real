class ChildEmoji extends Emoji{
  int m;
  
   ChildEmoji(float x0, float y0, int n0, int m0){
    super();
    id = n0+m0+1;
    m  = m0;
    img = loadImage(str(id)+".png");
    
    
    if(0 <= n0/4 & n0/4 <= 2){
      x = x0 + 100*cos(PI*(n0/4+m)/4+PI);
      y = y0 + 100*sin(PI*(n0/4+m)/4+PI);
    }else if(3 <= n0/4 & n0/4 <= 5){
      x = x0 + 100*cos(PI*(n0/4+m+1)/4+PI);
      y = y0 + 100*sin(PI*(n0/4+m+1)/4+PI);
    }
  }
}
