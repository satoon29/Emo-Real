class DrawEmoji{
  Emoji e[];
  
  DrawEmoji(Emoji[] e0){
    e= e0;
  }
  
  void draw(){
    for(int i=0;i<e.length;i++){
      e[i].draw();
    }
  }
  
  void delete(int j){
    for(int i=0;i<e.length;i++){
      if(j != i){
        e[i].visible = false;
      }
    }
  }
  
  void display(){
    for(int i=0;i<e.length; i++){
      e[i].visible = true;
    }
  }
  
  
}
