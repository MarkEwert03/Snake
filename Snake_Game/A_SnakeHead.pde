class SnakeHead extends SnakePart {
  //1. Instance Variables
  int speed, dir;
  PVector direction;
  float tl, tr, bl, br;
  float eye1X, eye1Y, eye2X, eye2Y = -100;

  //2. Constructor(s)
  SnakeHead() {
    super(new PVector(TS*1.5, TS*1.5));
    speed = TS;
    direction = new PVector(0, 0);
    tl = 0;
    tr = 0;
    br = 0;
    bl = 0;
    eye1X = -10;
    eye1Y = -10;
    eye2X = -10;
    eye2Y = -10;
    c = green;
  }//-----------------------------------------------------------------------

  //3. Behavior functions

  void show() {
    //Body
    noStroke();
    fill(c);
    rect(location.x, location.y, s, s, tl, tr, br, bl);

    //RightEye
    fill(darkGreen);
    ellipse(eye1X, eye1Y, TS/5, TS/5);

    //LeftEye
    ellipse(eye2X, eye2Y, TS/5, TS/5);
  }

  void act() {
    if (dir == UP) {
      //Smooths certain corners
      tr = ROUNDNESS;
      tl = ROUNDNESS;
      br = 0;
      bl = 0;

      //Eyes
      eye1X = location.x+TS/4;
      eye1Y = location.y-TS*1.25;
      eye2X = location.x-TS/4;
      eye2Y = location.y-TS*1.25;

      direction.set(0, -1);
    }
    if (dir == LEFT) {
      //Smooths certain corners
      tr = 0;
      tl = ROUNDNESS;
      br = 0;
      bl = ROUNDNESS;

      //Eyes
      eye1X = location.x-TS*1.25;
      eye1Y = location.y-TS/4;
      eye2X = location.x-TS*1.25;
      eye2Y = location.y+TS/4;

      direction.set(-1, 0);
    }
    if (dir == DOWN) {
      //Smooths certain corners
      tr = 0;
      tl = 0;
      br = ROUNDNESS;
      bl = ROUNDNESS;

      //Eyes
      eye1X = location.x-TS/4;
      eye1Y = location.y+TS*1.25;
      eye2X = location.x+TS/4;
      eye2Y = location.y+TS*1.25;

      direction.set( 0, 1);
    }
    if (dir == RIGHT) {
      //Smooths certain corners
      tr = ROUNDNESS;
      tl = 0;
      br = ROUNDNESS;
      bl = 0;

      //Eyes
      eye1X = location.x+TS*1.25;
      eye1Y = location.y+TS/4;
      eye2X = location.x+TS*1.25;
      eye2Y = location.y-TS/4;

      direction.set( 1, 0);
    }

    //Moves
    direction.setMag(speed);
    location.add(direction);

    //Lose if touching edge
    if (location.x < TS/2 || width-TS/2 < location.x || location.y < TS/2 || height-TS/2 < location.y) mode = LOSE;
  }// -----------------------------------------------------------------------------------------
}// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
