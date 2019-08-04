
class Jellyfish {

  float x, y, previousX, previousY, speedX, speedY, xDirection, lastDrop;
  ArrayList<Egg> eggs = new ArrayList<Egg>();

  Jellyfish(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    speedX = random(1, 2);
    xDirection = 1;
  }

  void draw() {
    stroke(#F090FF);
    strokeWeight(1);
    line(x - 50, y, x + 50, y);

    stroke(0);
    strokeWeight(2);
    fill(#F090FF);
    arc(x, y, 50, 60, PI, TWO_PI, OPEN);                    // Jellyfish's Body
    arc(x - 40, y, 10, 40, 0, PI, OPEN);
    arc(x - 20, y, 10, 60, 0, PI, OPEN);
    arc(x, y, 10, 30, 0, PI, OPEN);
    arc(x + 40, y, 10, 50, 0, PI, OPEN);
    arc(x + 20, y, 10, 40, 0, PI, OPEN);

    arc(x, y - 10, 10, 5, PI, TWO_PI);                       // Jellyfish's Mouth
    line(x - 25, y - 25, x - 10, y - 20);                    // Jellyfish's Eyes    
    line(x - 25, y - 15, x - 10, y - 20);

    line(x + 25, y - 25, x + 10, y - 20);                    // Jellyfish's Eyes    
    line(x + 25, y - 15, x + 10, y - 20);

    int sec = second();
    if (int((sec * random(1, 100))) % 100 == 13 && abs(sec - lastDrop) >= 10) {                    // Reference: "Processing Reference: second" <https://processing.org/reference/second_.html>
      dropEgg();
    }
    
    for (Egg egg: eggs) {
      egg.draw();
    }
  }

  void move() {
    x = x + (speedX * xDirection);

    if (jellyfishHitsLeftorRight()) {
      reverseX();
    }

    for (int i = eggs.size() - 1; i >= 0; i--) {
      Egg egg = eggs.get(i);                                     // Reference: "Processing Reference: ArrayList" <https://processing.org/reference/ArrayList.html>
      egg.move();
      if (egg.eggHitsGround()) {
        eggs.remove(i);                                          // Reference: "4.3: Deleting objects from ArrayList - The Nature of Code" by The Coding Train <https://www.youtube.com/watch?v=IsdZKG9wyBc>
      }
      if (egg.eggHitsBill()) {
        if (life > 1) {
          switchState('l');
        } else {
          switchState('o');
        }
        break;                                                  // Reference: "Processing Reference: Break" <https://processing.org/reference/break.html>
      }
    }
  }


  void dropEgg() {
    lastDrop = second();
    Egg egg = new Egg(x, y);
    eggs.add(egg);
  }

  boolean jellyfishHitsLeftorRight() {
    return 
      (x + 20 >= width)
      || (x - 20 <= 0);
  }

  void reverseX() {
    xDirection =  xDirection * -1;
  }
}
