int loseAlpha = 0;

void lose() {
  //Tile
  for (int i = 0; i < tileList.size(); i++) {
    Tile tempTile = tileList.get(i);
    tempTile.show();
  }

  //Snake
  mySnake.show();
  mySnake.deathAnimation();

  //Cherry
  myCherry.show();

  //Transparent tint
  fill(orange, loseAlpha);
  rect(width/2, height/2, width, height);

  //Death Animation
  textSize(240);
  if (mySnake.index == 0) {
    fill(white);
    if (loseAlpha <= 1000) loseAlpha += 1370/TS;
    else text("YOU LOSE", width/2, height/2);
  }
}// -----------------------------------------------------------------------------------------

void loseMousePressed() {
  //Variable reset
  setup();
}// -----------------------------------------------------------------------------------------
