class SnakePart {
  //1. Instance Variables
  float s;
  color c;
  int hue;
  PVector location;

  //2. Constructor(s)
  SnakePart(PVector _loc) {
    s = TS*1.025;
    location = new PVector(_loc.x, _loc.y);
    c = lime;
    hue = 300;
  }

  //3. Behavior functions
  void show() {
    //Main cube
    noStroke();
    fill(color(hue, 750, 750));
    rect(location.x, location.y, s, s);
  }// -----------------------------------------------------------------------------------------
}
