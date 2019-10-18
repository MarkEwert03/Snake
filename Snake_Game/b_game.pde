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

  if (wKey == true) aKey = sKey = dKey = false;
  if (aKey == true) wKey = sKey = dKey = false;
  if (sKey == true) wKey = aKey = dKey = false;
  if (dKey == true) wKey = aKey = sKey = false;
  }// -----------------------------------------------------------------------------------------

  void gameMousePressed() {
    mode = WIN;
  }// -----------------------------------------------------------------------------------------
