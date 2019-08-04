void drawBasket() {

  stroke(0);
  strokeWeight(3);
  fill(200);
  triangle(585, 380, 535, 480, 635, 480);
  arc(585, 380, 50, 70, 0, PI);
  for (int i = 0; i < 5; i++) {
    fill(#BFD329);
    triangle(545 + 20 * i, 360, 535 + 20 * i, 380, 555 + 20 * i, 380);
  }
  fill(255);
  arc(560, 410, 15, 10, PI, TWO_PI, CHORD);
  arc(610, 410, 15, 10, PI, TWO_PI, CHORD);
  
  fill(#F03561);
  circle(560,400,5);
  circle(610,400,5);
}
