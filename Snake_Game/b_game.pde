void game() {
  background(white);
  
  //Snake
  mySnake.show();
  mySnake.act();
  
  for (int i = 0; i < 160; i++){
    tileList.add( new Tile(20, 20));
    Tile tempTile = tileList.get(i);
    tempTile.show();
  }
}// -----------------------------------------------------------------------------------------

void gameMousePressed() {
  mode = WIN;
}// -----------------------------------------------------------------------------------------
