color difficultyColor = yellow, gameModeColor = lime;
final int EASY = 0, MEDIUM = 1, HARD = 2;
final int P1 = 0, P2 = 1, AI = 2;
int difficulty = EASY, gameMode = P1;

void intro() {
  //Background
  background(mint);

  pushMatrix();
  translate(0, 10);

  //Easy
  if (difficulty == EASY) {
    fill(yellow);
    noStroke();
  } else {
    noFill();
    strokeWeight(10);
    stroke(yellow);
  }
  if (dist(mouseX, mouseY, width/4, height/6) < 250/2) ellipse(width/4, height/6, 300, 300);
  else ellipse(width/4, height/6, 250, 250);
  fill(white);
  textSize(50);
  text("Easy", width/4, height/6);

  //Medium
  if (difficulty == MEDIUM) {
    fill(orange);
    noStroke();
  } else {
    noFill();
    strokeWeight(10);
    stroke(orange);
  }
  if (dist(mouseX, mouseY, width/2, height/6) < 250/2) ellipse(width/2, height/6, 300, 300);
  else ellipse(width/2, height/6, 250, 250);
  fill(white);
  text("Medium", width/2, height/6);

  //Hard
  if (difficulty == HARD) {
    fill(red);
    noStroke();
  } else {
    noFill();
    strokeWeight(10);
    stroke(red);
  }
  if (dist(mouseX, mouseY, width*3/4, height/6) < 250/2) ellipse(width*3/4, height/6, 300, 300);
  else ellipse(width*3/4, height/6, 250, 250);
  fill(white);
  text("Hard", width*3/4, height/6);

  //P1
  if (gameMode == P1) {
    fill(lime);
    noStroke();
  } else {
    noFill();
    strokeWeight(10);
    stroke(lime);
  }
  if (dist(mouseX, mouseY, width/4, height/2) < 250/2) ellipse(width/4, height/2, 300, 300);
  else ellipse(width/4, height/2, 250, 250);
  fill(white);
  text("P1", width/4, height/2);

  //P2
  if (gameMode == P2) {
    fill(blue);
    noStroke();
  } else {
    noFill();
    strokeWeight(10);
    stroke(blue);
  }
  if (dist(mouseX, mouseY, width/2, height/2) < 250/2) ellipse(width/2, height/2, 300, 300);
  else ellipse(width/2, height/2, 250, 250);
  fill(white);
  text("P2", width/2, height/2);

  //AI
  if (gameMode == AI) {
    fill(violet);
    noStroke();
  } else {
    noFill();
    strokeWeight(10);
    stroke(violet);
  }
  if (dist(mouseX, mouseY, width*3/4, height/2) < 250/2) ellipse(width*3/4, height/2, 300, 300);
  else ellipse(width*3/4, height/2, 250, 250);
  fill(white);
  text("AI", width*3/4, height/2);

  popMatrix();

  pushMatrix();
  translate(0, -25);

  //Main Text
  if (mouseX>width/2-width*3/10 && mouseY>height*5/6+25-height/8 && mouseX<width/2+width*3/10 && mouseY<height*5/6+25+height/8) {
    strokeWeight(15);
  } else {
    strokeWeight(10);
  }
  textSize(225);
  fill(gameModeColor);
  stroke(difficultyColor);
  rect(width/2, height*5/6+25, width*3/5, height/4);
  fill(white);
  text("Snake", width/2, height*5/6);

  popMatrix();
}// -----------------------------------------------------------------------------------------

void introMousePressed() {
  pushMatrix();
  translate(0, 25);

  //Easy
  if (dist(mouseX, mouseY, width/4, height/6) < 250/2) {
    TS = 180;
    frameRate(60);
    difficultyColor = yellow;
    difficulty = EASY;
    //Medium
  } else if (dist(mouseX, mouseY, width/2, height/6) < 250/2) {
    TS = 90;
    frameRate(45);
    difficultyColor = orange;
    difficulty = MEDIUM;
    //Hard
  } else if (dist(mouseX, mouseY, width*3/4, height/6) < 250/2) {
    TS = 45;
    frameRate(60);
    difficultyColor = red;
    difficulty = HARD;
    //P1
  } else if (dist(mouseX, mouseY, width/4, height/2) < 250/2) {
    gameModeColor = lime;
    gameMode = P1;
    //P2
  } else if (dist(mouseX, mouseY, width/2, height/2) < 250/2) {
    gameModeColor = blue;
    gameMode = P2;
    //AI
  } else if (dist(mouseX, mouseY, width*3/4, height/2) < 250/2) {
    gameModeColor = violet;
    gameMode = AI;
    //Starts game
  } else if (mouseX>width/2-width*3/10 && mouseY>height*5/6+25-height/6 && mouseX<width/2+width*3/10 && mouseY<height*5/6+25+height/6) {
    if (difficulty == EASY) {
      TS = 180;
      if (gameMode == P1) frameRate(15);
      else if (gameMode == AI) frameRate(45);
      pauseColor = yellow;
    } else if (difficulty == MEDIUM) {
      TS = 90;
      if (gameMode == P1) frameRate(30);
      else if (gameMode == AI) frameRate(60);
      pauseColor = orange;
    } else if (difficulty == HARD) {
      TS = 45;
      if (gameMode == P1) frameRate(45);
      else if (gameMode == AI) frameRate(120);
      pauseColor = red;
    }
    //Loads in the tiles
    setup();
    if (gameMode == P1)      mode = onePlayer;
    else if (gameMode == P2) mode = twoPlayer;
    else if (gameMode == AI) mode = compPlayer;
  }

  popMatrix();
}// -----------------------------------------------------------------------------------------
