void drawBill() {

  stroke(0);
  strokeWeight(2);

  fill(160, 72, 56);
  rect(mouseX, 380, hatwidth_1, hatheight_1);     // Bill's Hat upper - lower
  rect(mouseX - 20, 390, hatwidth_2, hatheight_2);
  fill(253, 255, 134);
  triangle(mouseX - 20, 390, mouseX, 390, mouseX - 10, 400);
  triangle(mouseX, 390, mouseX + 20, 390, mouseX + 10, 400);
  triangle(mouseX + 20, 390, mouseX + 40, 390, mouseX + 30, 400);
  triangle(mouseX + 40, 390, mouseX + 60, 390, mouseX + 50, 400);
  triangle(mouseX + 60, 390, mouseX + 80, 390, mouseX + 70, 400);
  triangle(mouseX + 80, 390, mouseX + 100, 390, mouseX + 90, 400);


  fill(255, 241, 203);                            // Bill's Face
  strokeWeight(2);
  arc(mouseX + 40, 400, 30, 30, 0, PI);

  arc(mouseX + 25, 410, 5, 5, PI, TWO_PI);        // Bill's Eyes
  arc(mouseX + 55, 410, 5, 5, PI, TWO_PI);

  noStroke();
  fill(0);                                        // Bill's Moustache
  rect(mouseX + 30, 415, 20, 5);
  triangle(mouseX + 30, 415, mouseX + 25, 420, mouseX + 30, 420);
  triangle(mouseX + 50, 415, mouseX + 50, 420, mouseX + 55, 420);


  fill(255, 241, 203);     
  triangle(mouseX + 33, 415, mouseX + 48, 415, mouseX + 40, 417);

  stroke(0);
  strokeWeight(2);
  fill(245, 168, 196);                            // Bill's Mouth
  arc(mouseX + 40, 420, 5, 5, 0, PI);

  fill(#1D618E);                                  // Bill's Body
  rect(mouseX + 20, 430, 40, 30);
  fill(#9ED7FC);
  arc(mouseX + 40, 430, 20, 20, 0, PI);           // Bill's Inner Collars
  fill(#1D5579); 
  arc(mouseX + 40, 430, 10, 10, 0, PI);           // Bill's Outter Collars

  rect(mouseX + 10, 430, 10, 20);                 // Bill's Arms
  rect(mouseX + 60, 430, 10, 20);

  fill(255, 241, 203); 
  arc(mouseX + 15, 450, 5, 5, 0, PI);             // Bill's Hand
  arc(mouseX + 65, 450, 5, 5, 0, PI);

  fill(255);                                      // Bill's Legs     
  rect(mouseX + 20, 460, 20, 10);
  rect(mouseX + 40, 460, 20, 10);

  fill(0);                                        // Bill's Feet
  rect(mouseX + 20, 470, 10, 5);
  triangle(mouseX + 20, 470, mouseX + 20, 475, mouseX + 15, 475);
  rect(mouseX + 50, 470, 10, 5);
  triangle(mouseX + 60, 470, mouseX + 60, 475, mouseX + 65, 475);

  stroke(0);
  strokeWeight(2);
  fill(#72BEF0, 80);
  ellipse(mouseX + 40, 400, 70, 35);

  strokeWeight(1);
  fill(255, 150);
  circle(mouseX + 75, 410, 5);
  circle(mouseX + 60, 420, 3);
}
