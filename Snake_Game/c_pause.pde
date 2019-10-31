void pause() {
  fill(255, 0, 0, 100);
  rect(width/2, height/2, width, height);

  //Tile
  tileList = new ArrayList<Tile>();
  final int PIXELSIZE = 90;
  int tileX = 45;
  int tileY = 45;
  for (int i = 0; i < 170; i++) {
    //Adding Tiles
    tileList.add( new Tile(tileX, tileY));
    //Aligning Tiles
    tileX += PIXELSIZE;
    if (width+PIXELSIZE <= tileX) {
      tileY += PIXELSIZE;
      tileX = 45;
    }
    //Changing tile Color
    for (int j = 0; j < tileList.size(); j++) {
      Tile tempTile = tileList.get(i);
      if (i % 2 == 0) tempTile.c = black;
      else tempTile.c = white;
    }
  }
}// -----------------------------------------------------------------------------------------

void pauseMousePressed() {
  mode = GAME;
}// -----------------------------------------------------------------------------------------
