void pause() {
  //Tile
  for (int i = 0; i < tileList.size(); i++) {
    Tile tempTile = tileList.get(i);
    tempTile.show();
  }
  
  mySnake.show();
  
   fill(grey, 125);
  rect(width/2, height/2, width, height);
}// -----------------------------------------------------------------------------------------

void pauseMousePressed() {
  mode = GAME;
}// -----------------------------------------------------------------------------------------
