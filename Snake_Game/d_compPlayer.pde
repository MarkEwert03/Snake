void compPlayerGame() {
  //Tile
  for (int i = 0; i < tileList.size(); i++) {
    Tile tempTile = tileList.get(i);
    tempTile.show();
  }
  
  //Snake
  mySnake.show();
  mySnake.act();
  mySnake.CPU();
  
  //Cherry
  myCherry.show();
  
}

void compPlayerGameMousePressed() {
}
