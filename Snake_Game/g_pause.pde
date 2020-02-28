void pause() {
  //Tile
  for (int i = 0; i < tileList.size(); i++) {
    Tile tempTile = tileList.get(i);
    tempTile.show();
  }

  //Transparent tint
  fill(pauseColor, 255);
  rect(width/2, height/2, width, height);

  //Snake
  mySnake.show();

  //Cherry
  myCherry.show();
}// -----------------------------------------------------------------------------------------

void pauseMousePressed() {
  mode = onePlayer;
}// -----------------------------------------------------------------------------------------
