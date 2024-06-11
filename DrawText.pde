class DrawText{
  PImage ki, d, ai, rk;
  
  DrawText(){
    ki = loadImage("ki.png");
    d = loadImage("do.png");
    ai = loadImage("ai.png");
    rk = loadImage("rk.png");
  }
  
  void drawInputEmoji(){
    textAlign(CENTER);
    textSize(15);
    fill(100);
    text("current emotion", width/2, height/2-55);
    textSize(40);
    text("None", width/2, height/2+10);
    stroke(0);
    strokeWeight(1);
    noFill();
    
    rect(width/2-60, height/2-80, 120, 140);
  }
  
  void drawSelectedEmoji(Emoji e, boolean isThin){
    textAlign(CENTER);
    textSize(15);
    fill(100);
    text("current emotion", width/2, height/2-55);
    
    stroke(0);
    strokeWeight(1);
    noFill();
    rect(width/2-60, height/2-80, 120, 140);
    e.drawCenter(isThin);
  }
  
  void drawLoading(){
    fill(255);
    stroke(100);
    strokeWeight(3);
    rect(width/2-150, height/2-45, 300, 70);
    textAlign(CENTER);
    textSize(30);
    fill(100);
    text("Sending Your Emoji...", width/2, height/2);
    stroke(0);
    strokeWeight(1);
    noFill();
  }
  
  void kidoairaku(){
    tint(255, 40);
    image(ki,width - 200, height - 150,200,200);
    image(d, width - 200, 0, 200, 200);
    image(ai, 0, 0, 200, 200);
    image(rk, 0, height - 150, 200, 200);
    tint(255,255);
  }
}
