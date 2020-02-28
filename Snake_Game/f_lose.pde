int loseAlpha = 0;
void lose() {
  //Tile
  for (int i = 0; i < tileList.size(); i++) {
    Tile tempTile = tileList.get(i);
    tempTile.show();
  }

  //Cherry
  myCherry.show();

  //Snake
  mySnake.show();
  mySnake.endAnimation();

  //Transparent tint
  fill(mySnake.lastPartColor, loseAlpha);
  rect(width/2, height/2, width, height);

  //Death Animation
  textSize(240);
  if (mySnake.index == 0) {
    fill(white);
    if (loseAlpha <= 1000) loseAlpha += 15;
    else {
      textSize(240);
      text("YOU LOSE", width/2, height/3);
      textSize(120);
      text("Your length was "+mySnake.finalLength, width/2, height*2/3);
    }
  }
}// -----------------------------------------------------------------------------------------

void loseMousePressed() {
  //Variable reset
  setup();
}// -----------------------------------------------------------------------------------------
