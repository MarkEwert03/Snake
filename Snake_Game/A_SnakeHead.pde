class SnakeHead extends SnakePart {
  //1. Instance Variables
  int speed, point;
  PVector vel;
  float tl, tr, bl, br;
  float eye1X, eye1Y, eye2X, eye2Y = -100;
  float snakeCludge, rightTileX, bottomTileY;
  boolean top, bottom;
  color headColor;

  //2. Constructor(s)
  SnakeHead() {
    super(new PVector((TS/2)-0.5, TS/2 +TS*3) );
    speed = TS;
    vel = new PVector(0, 0);
    tl = 0;
    tr = 0;
    br = 0;
    bl = 0;
    eye1X = -10;
    eye1Y = -10;
    eye2X = -10;
    eye2Y = -10;
    if (difficulty == EASY) {
      snakeCludge = 0.0;
      rightTileX = 1349.5;
      bottomTileY = 810;
    }
    if (difficulty == MEDIUM) {
      snakeCludge = 0.0;
      rightTileX = 1394.5;
      bottomTileY = 855;
    }
    if (difficulty == HARD) {
      snakeCludge = 0;
      rightTileX = 1416.5;
      bottomTileY = 877;
    }
    //Can move right 1 tile if true, and thens gets set to false
    top = false;
    bottom = false;
  }//-----------------------------------------------------------------------

  //3. Behavior functions

  void show() {
    //Body
    if (mode == onePlayer) headColor = green;
    else if (mode == twoPlayer) headColor = mint;
    else if (mode == compPlayer) headColor = lime;
    fill(headColor);
    noStroke();
    rect(loc.x, loc.y, s, s, tl, tr, br, bl);

    //RightEye
    fill(darkGreen);
    ellipse(eye1X, eye1Y, TS/5, TS/5);

    //LeftEye
    fill(darkGreen);
    ellipse(eye2X, eye2Y, TS/5, TS/5);
  }

  void act() {
    if (point == UP) {
      //Smooths certain corners
      tr = ROUNDNESS;
      tl = ROUNDNESS;
      br = 0;
      bl = 0;

      //Eyes
      eye1X = loc.x+TS/4;
      eye1Y = loc.y-TS*1.25;
      eye2X = loc.x-TS/4;
      eye2Y = loc.y-TS*1.25;

      vel.set(0, -1);
    }
    if (point == LEFT) {
      //Smooths certain corners
      tr = 0;
      tl = ROUNDNESS;
      br = 0;
      bl = ROUNDNESS;

      //Eyes
      eye1X = loc.x-TS*1.25;
      eye1Y = loc.y-TS/4;
      eye2X = loc.x-TS*1.25;
      eye2Y = loc.y+TS/4;

      vel.set(-1, 0);
    }
    if (point == DOWN) {
      //Smooths certain corners
      tr = 0;
      tl = 0;
      br = ROUNDNESS;
      bl = ROUNDNESS;

      //Eyes
      eye1X = loc.x-TS/4;
      eye1Y = loc.y+TS*1.25;
      eye2X = loc.x+TS/4;
      eye2Y = loc.y+TS*1.25;

      vel.set( 0, 1);
    }
    if (point == RIGHT) {
      //Smooths certain corners
      tr = ROUNDNESS;
      tl = 0;
      br = ROUNDNESS;
      bl = 0;

      //Eyes
      eye1X = loc.x+TS*1.25;
      eye1Y = loc.y+TS/4;
      eye2X = loc.x+TS*1.25;
      eye2Y = loc.y-TS/4;

      vel.set( 1, 0);
    }

    //Moves
    vel.setMag(speed);
    loc.add(vel);

    //Lose if touching edge
    if (loc.x+snakeCludge < TS/2-5 || width-TS/2+5 < loc.x || loc.y < TS/2-5 || height-TS/2+50 < loc.y) {
      mode = LOSE;
    }
  }// -----------------------------------------------------------------------------------------

  void CPU() {
    ////basic follow code for AI snake
    //if (myCherry.y != loc.y+snakeCludge) {
    //  if (myCherry.y < loc.y) point = UP;
    //  if (loc.y < myCherry.y) point = DOWN;
    //} else {
    //  if (myCherry.x < loc.x+snakeCludge) point = LEFT;
    //  if (loc.x+snakeCludge < myCherry.x) point = RIGHT;
    //}

    //Good AI code
    if (loc.y == bottomTileY) {
      if (loc.x != (TS/2)-0.5) point = LEFT;
      else {
        point = UP;
        bottom = true;
      }
    } else {
      if (loc.y == TS/2 && !top) {
        point = RIGHT;
        top = true;
      } else if (loc.y == bottomTileY-TS && !bottom) {
        if (loc.x != rightTileX && loc.x != (TS/2)-0.5) {
          point = RIGHT;
          bottom = true;
        }
      } else {
        //Even numbered tiles
        if ( int(((loc.x+snakeCludge-TS/2)/TS)%2) == 1) {
          point = UP;
          top = false;
          bottom = false;
        }
        //Odd numbered tiles
        if ( int(((loc.x+snakeCludge-TS/2)/TS)%2) == 0 && loc.x != TS/2-0.5) {
          point = DOWN;
          top = false;
          bottom = false;
        }
      }
    }
  }// -----------------------------------------------------------------------------------------
}// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
