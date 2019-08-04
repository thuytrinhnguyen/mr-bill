class Egg {
  float x, y;
  int len = 10;

  Egg(float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }

  void draw() {
    stroke(0);
    strokeWeight(2);
    fill(#FFEF71);
    rect(x, y, len, len, 3);
  }

  void move() {
    y = y + 0.5;
  }
  
  boolean eggHitsBill(){
   return
      (y >= height - billheight - hatheight_1 - hatheight_2 - len) 
      && (x >= mouseX) 
      && (x <= mouseX + hatwidth_1);
  }
  
  boolean eggHitsGround(){
    return
    (y >= height);
  }
}
