class SnakeHead extends SnakePart {
  //1. Instance Variables
  int speed, dir;
  PVector direction;

  //2. Constructor(s)
  SnakeHead() {
    super(new PVector(TILESIZE*1.5, TILESIZE*1.5));
    speed = TILESIZE;
    direction = new PVector(0, 0);
    c = green;
  }//-----------------------------------------------------------------------

  //3. Behavior functions

  //void show() is gotten from SnakePart

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

    direction.setMag(speed);
    location.add(direction);

    //Lose if touching edge
    if (location.x < TILESIZE/2 || width-TILESIZE/2 < location.x || location.y < TILESIZE/2 || height-TILESIZE/2 < location.y) mode = LOSE;
    //if (location.x < TILESIZE)        dir = UP;
    //if (location.y < TILESIZE)        dir = RIGHT;
    //if (width-TILESIZE < location.x)  dir = DOWN;
    //if (height-TILESIZE < location.y) dir = LEFT;
  }// -----------------------------------------------------------------------------------------
}// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
