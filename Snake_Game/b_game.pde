void game() {
  background(white);

  //Tile
  for (int i = 0; i < tileList.size(); i++) {
    Tile tempTile = tileList.get(i);
    tempTile.show();
  }

  //Snake
  for (int i = 0; i < snakeList.size(); i++) {
    Snake tempSnake = snakeList.get(i);
    tempSnake.show();
    tempSnake.act();
  }
  
}// -----------------------------------------------------------------------------------------

void gameMousePressed() {
  mode = WIN;
}// -----------------------------------------------------------------------------------------
