class SnakeHead extends SnakePart {
  //1. Instance Variables
  int speed, dir;
  PVector direction;
  float tl, tr, bl, br;

  //2. Constructor(s)
  SnakeHead() {
    super(new PVector(TS*1.5, TS*1.5));
    speed = TS;
    direction = new PVector(0, 0);
    tl = 0;
    tr = 0;
    br = 0;
    bl = 0;
    c = red;
  }//-----------------------------------------------------------------------

  //3. Behavior functions

  void show() {
    //Body
    noStroke();
    fill(c);
    rect(location.x, location.y, s, s, tl, tr, br, bl);
    //Eyes
    fill(black);
    ellipse(location.x+TS/5, location.y+TS/5, TS/5, TS/5);
    ellipse(location.x+TS/5, location.y-TS/5, TS/5, TS/5);
    
    //Showing Hue
    fill(white);
    textSize(10);
    text(hue, location.x, location.y);
  }

  void act() {
    if (dir == UP) {
      tr = ROUNDNESS;
      tl = ROUNDNESS;
      br = 0;
      bl = 0;
      direction.set( 0, -1);
    }
    if (dir == LEFT) {
      tr = 0;
      tl = ROUNDNESS;
      br = 0;
      bl = ROUNDNESS;
      direction.set(-1, 0);
    }
    if (dir == DOWN) {
      tr = 0;
      tl = 0;
      br = ROUNDNESS;
      bl = ROUNDNESS;
      direction.set( 0, 1);
    }
    if (dir == RIGHT) {
      tr = ROUNDNESS;
      tl = 0;
      br = ROUNDNESS;
      bl = 0;
      direction.set( 1, 0);
    }

    //Moves
    direction.setMag(speed);
    location.add(direction);

    //Lose if touching edge
    if (location.x < TS/2 || width-TS/2 < location.x || location.y < TS/2 || height-TS/2 < location.y) mode = LOSE;
  }// -----------------------------------------------------------------------------------------
}// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
