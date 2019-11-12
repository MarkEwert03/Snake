void game() {
  background(white);

  //Tile
  for (int i = 0; i < tileList.size(); i++) {
    Tile tempTile = tileList.get(i);
    tempTile.show();
  }

  //Snake
  mySnake.show();
  mySnake.act();
  
}// -----------------------------------------------------------------------------------------

void gameMousePressed() {
  mode = WIN;
}// -----------------------------------------------------------------------------------------
