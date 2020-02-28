class SnakePart {
  //1. Instance Variables
  float s;
  int hue;
  PVector loc;
  color partColor;

  //2. Constructor(s)
  SnakePart(PVector _loc) {
    s = TS*1.025;
    loc = new PVector(_loc.x, _loc.y);
    hue = 300;
    partColor = color(hue, 750, 750);
  }

  //3. Behavior functions
  void show() {
    //Main cube
    noStroke();
    if (mode == onePlayer) partColor = color(hue, 750, 750);
    else if (mode == twoPlayer) partColor = mint;
    else if (mode == compPlayer) partColor = color(hue, 750, 750);
    fill(partColor);
    rect(loc.x, loc.y, s, s);
  }// -----------------------------------------------------------------------------------------
}
