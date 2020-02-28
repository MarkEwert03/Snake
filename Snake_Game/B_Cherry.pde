class Cherry {
  //1. Instance Variables
  float x, y, s;
  int hue;

  //2. Constructor(s)
  Cherry() {
    x = (int(random(0, width/TS)) * TS)+TS/2;
    y = (int(random(0, height/TS)) * TS)+TS/2;
    s = TS;
    hue = 0;
  }

  //3. Behavior functions
  void show() {
    image(cherryImage, x, y, s, s);
  }// -----------------------------------------------------------------------------------------
}
