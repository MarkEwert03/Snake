void pause() {
  //Tile
  for (int i = 0; i < tileList.size(); i++) {
    Tile tempTile = tileList.get(i);
    tempTile.show();
  }

  //Snake
  mySnake.show();

  //Cherry
  myCherry.show();

  //Transparent tint
  fill(blue, 125);
  rect(width/2, height/2, width, height);
  
}// -----------------------------------------------------------------------------------------

void pauseMousePressed() {
  mode = GAME;
}// -----------------------------------------------------------------------------------------
