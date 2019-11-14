class SnakePart {
  //1. Instance Variables
  float s;
  float tl, tr, bl, br;
  color c;
  PVector location;

  //2. Constructor(s)
  SnakePart(PVector _loc) {
    s = TILESIZE*1.05;
    location = new PVector(_loc.x, _loc.y);
    c = lime;
    tl = 0;
    tr = 0;
    br = 0;
    bl = 0;
   
  }

  //3. Behavior functions
  void show() {
    noStroke();
    fill(c);
    rect(location.x, location.y, s, s, tl, tr, br, bl);
  }// -----------------------------------------------------------------------------------------
}
