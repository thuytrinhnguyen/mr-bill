void drawBackground() {
  // Gradient Sky Color 
  for (int i = 0; i < height; i += 50) {                         
    noStroke();
    fill(100, 150, 150 + i/8);
    rect(0, i, width, 50);
  } 

  // Ground
  noStroke();
  fill(#1F3E10);
  rect(0, 450, 640, 30);  

  // Warning Sign
  stroke(0);
  strokeWeight(3);

  fill(#460011);
  rect(55, 365, 120, 55);
  rect(105, 365, 20, 110);

  fill(200);  
  rect(50, 370, 120, 55);

  textSize(15);
  fill(0);
  text("Watch out for", 60, 390);
  text("the EGGs!", 75, 418);

  // Sunshine
  for (int i = 0; i <= 5; i++) {
    strokeWeight(random(0, 10));
    stroke(#FFF86C, random(0, 100));
    fill(#FFF86C, random(0, 100));
    circle(0, 0, 20 + 30*i);
  }
}
