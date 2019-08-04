void throwBalls(int n) { //<>// //<>//
  for (int i = 0; i < n; i++) {
    Ball ball = new Ball(random(10, 20), random(10, 20), 10);     // Reference: "8.4: Constructor Arguments - Processing Tutorial" by The Coding Train <https://www.youtube.com/watch?v=NrwaKOsplZk>
    balls.add(ball);                                              // Reference: "Processing Reference: ArrayList" <https://processing.org/reference/ArrayList.html>
  }                                                               // Reference: "4.2: ArrayLists in Processing - The Nature of Code" by The Coding Train <https://www.youtube.com/watch?v=HnSJZ4qTcwY>
}

void drawBalls() {
  for (Ball ball : balls) {                                      // Reference: "Processing Reference: for" <https://processing.org/reference/for.html>
    ball.draw();
  }
}

void moveBalls() {
  int noOfBallsToAdd = 0;
  for (int i = balls.size() - 1; i >= 0; i--) {                 // Reference: "4.3: Deleting objects from ArrayList - The Nature of Code" by The Coding Train <https://www.youtube.com/watch?v=IsdZKG9wyBc>
    Ball ball = balls.get(i);                                   // Reference: "Processing Reference: ArrayList" <https://processing.org/reference/ArrayList.html>
    ball.move();
    if (ball.insideBasket()) {
      balls.remove(i);                                          // Reference: "4.3: Deleting objects from ArrayList - The Nature of Code" by The Coding Train <https://www.youtube.com/watch?v=IsdZKG9wyBc>
      noOfBallsToAdd++;
    }
    if (ball.ballHitsGround()) {
      if (life > 1) {
        switchState('l');
      } else {
        switchState('o');
      }
      break;                                                    // Reference: "Processing Reference: Break" <https://processing.org/reference/break.html>
    }
  }
  throwBalls(noOfBallsToAdd);
  point = point + 6 * noOfBallsToAdd;

  if (point >= 60 && jellyfish == null) {
    jellyfish = new Jellyfish(random(100, width-50), 65);
    textBoss = 0;

  }
}

class Ball {                                                   // Reference: "8.2: Defining a Class Part I - Processing Tutorial" by The Coding Train <https://www.youtube.com/watch?v=lmgcMPRa1qw>

  float x, xDirection,                                          // Reference: "Processing Reference: Class" <https://processing.org/reference/class.html>
    y, yDirection, previousY, 
    rad;

  float xSpeed, ySpeed, gravity;

  Ball(float xpos, float ypos, float radius) {                // Reference: How to add the constructor - "8.3: Defining a Class Part II - Processing Tutorial" by The Coding Train <https://www.youtube.com/watch?v=XwfOVFelLoo>
    x = xpos;
    y = ypos;
    xSpeed = random(1.15, 1.2);
    ySpeed = random(0.2, 1.2);
    gravity = 0.3;
    rad = radius;
    xDirection = 1;
    yDirection = 1;
  }

  void draw() {
    stroke(0);
    fill(255);
    circle(x, y, rad);
  }

  void move() {
    previousY = y;
    x = x + (xSpeed * xDirection);
    ySpeed = ySpeed + (yDirection * gravity);
    y = y + (ySpeed * yDirection);

    // Condition: Ball hits screen boundaries
    if (ballHitsRightorLeftBoundaries()) {                                      
      reverseX();
    }

    // Ball hits the top of the hat) 
    if (ballHitsTopHat()) { 
      reverseY();
    }
  }

  void reverseX() {
    xDirection = xDirection * -1;
  }

  void reverseY() {
    yDirection = yDirection * -1;
  }

  boolean ballHitsGround() {
    return (y > height - rad);
  }

  boolean ballHitsRightorLeftBoundaries() {
    return 
      (x < rad) 
      || (x > width - rad);
  }

  boolean ballHitsTopHat() {
    return 
      (previousY < y)
      && (y >= height - billheight - hatheight_1 - hatheight_2 - rad) 
      && (x >= mouseX) 
      && (x <= mouseX + hatwidth_1);
  }

  boolean insideBasket() {
    return
      (x >= width - basketWidth - rad)
      && (y >= height - basketHeight);
  }
}
