int winAlpha;
void win() {
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
  tint(1000, 1000, 1000, winAlpha);
  image(winPic, width/2, height/2);

  //Death Animation
  textSize(240);
  if (mySnake.index == 0) {
    fill(white);
    if (winAlpha <= 1000) winAlpha += 15;
    else text("YOU WIN", width/2, height/2);
  }
}// -----------------------------------------------------------------------------------------

void winMousePressed() {
  //Variable reset
  setup();
}// -----------------------------------------------------------------------------------------
