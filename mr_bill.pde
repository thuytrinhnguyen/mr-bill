/*
Author: Thuy Trinh Nguyen
 ID: 44526709
 Unit: COMP115
 Purpose: Assignment 2 
 Date: 26 May 2019
 
 Note: 
- When one life is lost (Bill misses a ball OR Bill hits the boss's eggs), resume to the game by pressing ENTER)
- When Bills get 60 points, the Boss appears and drops toxic eggs. Bills needs to avoid the eggs while hitting the balls into the basket
 */
 
 

int rad = 10;             // Ball radius

int hatwidth_1 = 80;      // Bill's hat width - upper
int hatheight_1 = 10;     // Bill's hat height - upper
int hatwidth_2 = 120;     // Bill's hat width - upper
int hatheight_2 = 10;     // Bill's hat height - upper
int billheight = 80;  

int basketWidth = 100;
int basketHeight = 120;

int textBoss = 255;

int point = 0;

int life = 5;

char state = 'p'; // p = playing, l = lost 

ArrayList<Ball> balls = new ArrayList<Ball>();                            // Reference: "4.2: ArrayLists in Processing - The Nature of Code" by The Coding Train <https://www.youtube.com/watch?v=HnSJZ4qTcwY>
                                                                          // Reference: "Processing Reference: ArrayList" <https://processing.org/reference/ArrayList.html>
Jellyfish jellyfish;                                                      // Reference: "Processing Reference: null" <https://processing.org/reference/null.html>


void setup() {
  size(640, 480);
  ellipseMode(RADIUS);

  throwBalls(5);
}

void draw() {
  switch (state) {                                                         // Reference: "Processing Reference: Switch" <https://processing.org/reference/switch.html>
  case 'p': 
    drawGamePlaying();
    break;
  case 'l':
    drawGameLost();
    break;
  case 'o':
    drawGameOver();
  }
}

void keyPressed() {                                                        // Reference: "Processing Reference: keyPressed()" <https://processing.org/reference/keyPressed_.html>
  if (state == 'l' && key == ENTER) {                                      // Reference: "Processing Reference: keyCode()" <https://processing.org/reference/keyCode.html>
    switchState('p');
  }
}

void drawGamePlaying() {

  drawBackground();
  drawBill();
  drawBasket();

  drawBalls();
  moveBalls();

  if (jellyfish != null) {
    jellyfish.draw();
    jellyfish.move();
  }

  drawHearts(life);
  countPoints();

  textSize(20);
  fill(255, textBoss);
  text("Get 30 points to meet the BOSS!", width/4, 40);
}

void drawGameLost() {
  background(0);
  fill(255);
  textSize(20);
  text("You have " + life + " lives left!", 220, 350);
  text("Press ENTER to resume the Game", 160, 400);
  drawHearts(life);
}

void drawGameOver() {
  background(0);
  fill(255);
  textSize(60);
  text("Game Over!", width/4, height/2);
}

void switchState(char s) {
  state = s;
  switch (s) {
  case 'l':
    balls = new ArrayList<Ball>();
    life--;
    break;
  case 'p':
    throwBalls(5);
  }
}
