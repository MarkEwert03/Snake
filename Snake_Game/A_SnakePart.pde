class SnakePart {
  //1. Instance Variables
  float s;
  int hue;
  PVector loc;
  color c;

  //2. Constructor(s)
  SnakePart(PVector _loc) {
    s = TS*1.025;
    loc = new PVector(_loc.x, _loc.y);
    hue = 300;
    c = color(hue, 750, 750);
  }

  //3. Behavior functions
  void show() {
    //Main cube
    noStroke();
    if (mode == onePlayer) c = color(hue, 750, 750);
    else if (mode == twoPlayer) c = mint;
    else if (mode == compPlayer) c = color(hue, 750, 750);
    fill(c);
    rect(loc.x, loc.y, s, s);
  }// -----------------------------------------------------------------------------------------
}
