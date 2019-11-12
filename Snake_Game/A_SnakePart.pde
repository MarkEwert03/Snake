class SnakePart {
  //1. Instance Variables
  int s;
  color c;
  PVector location;

  //2. Constructor(s)
  SnakePart(PVector _loc) {
    s = TILESIZE;
    location = new PVector(_loc.x, _loc.y);
    c = red;
  }

  //3. Behavior functions
  void show() {
    noStroke();
    fill(c);
    rect(location.x, location.y, s, s, TILESIZE/10);
  }// -----------------------------------------------------------------------------------------
}
