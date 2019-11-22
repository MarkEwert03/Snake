class Tile {
  //1. Instance Variables
  int x, y, s;
  color c;

  //2. Constructor(s)
  Tile(int _x, int _y) {
    x = _x;
    y = _y;
    s = TS;
    int xIndex = x/TS;
    int yIndex = y/TS;
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
