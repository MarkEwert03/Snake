class Snake {
  //1. Instance Variables
  PVector direction;
  int x, y, s, speed;

  //2. Constructor(s)
  Snake() {
    x = 50;
    y = 50;
    s = 90;
    speed = 4;
  }

  //3. Behavior functions
  void show() {
    noStroke();
    fill(lime);
    rect(x, y, s, s, 10);
  }// -----------------------------------------------------------------------------------------

  void act() {
    if (wKey) y-= speed;
    else if (aKey) x-= speed;
    else if (sKey) y+= speed;
    else if (dKey) x+= speed;
  }// -----------------------------------------------------------------------------------------
  
}// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
