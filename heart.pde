void drawHearts(int n) { 
  for (int i = 5; i > 0; i--) {
    drawEmptyHeart(470 + 30 * i, 30);
    if (i <= n) {
      drawHeart(470 + 30 * i, 30);
    }
  }
}

void drawHeart(int x, int y) {
  fill(245, 89, 49); 
  noStroke();
  arc(x - 5, y - 10, 5, 5, PI, TWO_PI);
  arc(x + 5, y - 10, 5, 5, PI, TWO_PI);
  triangle(x, y, x - 10, y - 10, x + 10, y - 10);
}

void drawEmptyHeart(int x, int y) {
  stroke(245, 89, 49); 
  strokeWeight(1);
  noFill();
  line(x, y, x - 10, y - 10);
  line(x, y, x + 10, y - 10);
  arc(x - 5, y - 10, 5, 5, PI, TWO_PI);
  arc(x + 5, y - 10, 5, 5, PI, TWO_PI);
}
