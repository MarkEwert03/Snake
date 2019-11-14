class Tile {
  //1. Instance Variables
  int x, y, s;
  color c;

  //2. Constructor(s)
  Tile(int _x, int _y) {
    x = _x;
    y = _y;
    s = TILESIZE;
    int xIndex = x/TILESIZE;
    int yIndex = y/TILESIZE;
    if ((xIndex + yIndex) % 2 == 0 ) c = white;
    else c = grey;
  }

  //3. Behavior functions
  void show() {
    noStroke();
    fill(c);
    rect(x, y, s, s);
  }// -----------------------------------------------------------------------------------------
  
}// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
