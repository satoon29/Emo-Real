abstract class Emoji {
  float x,y;
  float r;
  int id;
  boolean visible;
  boolean isRed;
  PImage img;
  
  Emoji(){
    visible = true;
    r = 70;
  }
  
  void draw(){
    if(visible){
      if(mousePressed & isPressed(mouseX, mouseY)){
        isRed = true;
      }else{
        isRed = false;
      }
      
      if(isRed){
        stroke(255,0,0);
        strokeWeight(7);
        ellipse(x,y,r-7,r-7);
        r = 90;
      }else{
        r = 70;
      }
      tint(255,255);
    }else{
      tint(255, 50);
    }
    image(img,x-r/2,y-r/2,r,r);
  }
  
  boolean isPressed(int x0, int y0){
    return sq(x-x0)+sq(y-y0)<sq(r/2);
  }
  
  void drawCenter(boolean isThin){
    if(isThin == true){
      tint(255, 50);
    }else{
      tint(255,255);
    }
    
    image(img,width/2-50,height/2-50,100,100);
  }
  
}
