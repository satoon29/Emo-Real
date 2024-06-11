class RepresentativeEmoji extends Emoji {
  boolean isSelected;
  ChildEmoji[] child;

  RepresentativeEmoji(int n0) {
    super();
    isSelected = false;
    id = n0*4;
    x = width/2 + 150*cos(PI*n0/3+PI/6);
    y = height/2 + 150*sin(PI*n0/3+PI/6);
    img = loadImage(str(id)+".png");
    child = new ChildEmoji[3];
    for (int i=0; i<3; i++) {
      child[i] = new ChildEmoji(x, y, id, i);
    }
  }

  void draw() {
    super.draw();
  }

  void drawChild() {
    for (int i=0; i<3; i++) {
      child[i].draw();
    }
  }
}
