void intro() {
  //Background
  background(mint);

  //Main Text
  textSize(360);
  if (dist(mouseX, mouseY, width/4, height/4) < 250/2)        fill(yellow);
  else if (dist(mouseX, mouseY, width/2, height/4) < 250/2)   fill(orange);
  else if (dist(mouseX, mouseY, width*3/4, height/4) < 250/2) fill(red);
  else fill(white);
  text("Snake", width/2, height*3/4);

  fill(yellow);
  if (dist(mouseX, mouseY, width/4, height/4) < 250/2) ellipse(width/4, height/4, 300, 300);
  else ellipse(width/4, height/4, 250, 250);
  fill(white);
  textSize(50);
  text("Easy", width/4, height/4);

  fill(orange);
  if (dist(mouseX, mouseY, width/2, height/4) < 250/2) ellipse(width/2, height/4, 300, 300);
  else ellipse(width/2, height/4, 250, 250);
  fill(white);
  text("Medium", width/2, height/4);

  fill(red);
  if (dist(mouseX, mouseY, width*3/4, height/4) < 250/2) ellipse(width*3/4, height/4, 300, 300);
  else ellipse(width*3/4, height/4, 250, 250);
  fill(white);
  text("Hard", width*3/4, height/4);
}// -----------------------------------------------------------------------------------------

void introMousePressed() {
  //Easy
  if (dist(mouseX, mouseY, width/4, height/4) < 250/2) {
    TS = 180;
    setup();
    mode = GAME;
    //Medium
  } else if (dist(mouseX, mouseY, width/2, height/4) < 250/2) {
    TS = 90;
    setup();
    mode = GAME;
    //Hard
  } else if (dist(mouseX, mouseY, width*3/4, height/4) < 250/2) {
    TS = 45;
    setup();
    mode = GAME;
  }
}// -----------------------------------------------------------------------------------------
