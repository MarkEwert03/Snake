class Tile {
  //1. Instance Variables
  int x, y, s;
  color c;

  //2. Constructor(s)
  Tile(int _x, int _y) {
    x = _x;
    y = _y;
    s = TILESIZE;
    int x_index = x/TILESIZE;
    int y_index = y/TILESIZE;
    if ((x_index + y_index) % 2 == 0 ) c = white;
    else c = black;
  }

  //3. Behavior functions
  void show() {
    noStroke();
    fill(c);
    rect(x, y, s, s);
  }// -----------------------------------------------------------------------------------------
  
}// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
