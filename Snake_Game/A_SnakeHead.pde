class SnakeHead extends SnakePart {
  //1. Instance Variables
  int speed, dir;
  PVector direction;

  //2. Constructor(s)
  SnakeHead() {
    super(new PVector(TILESIZE*1.5, TILESIZE*1.5));
    s = TILESIZE;
    speed = TILESIZE;
    direction = new PVector(0, 0);
    c = lime;
  }//-----------------------------------------------------------------------

  //3. Behavior functions

  //void show() is gotten from SnakePart

  void act() {

    if (dir == UP)    direction.set( 0, -1);
    if (dir == LEFT)  direction.set(-1, 0);
    if (dir == DOWN)  direction.set( 0, 1);
    if (dir == RIGHT) direction.set( 1, 0);

    direction.setMag(speed);
    location.add(direction);

    //Lose if touching edge
    if (location.x < TILESIZE/2 || width-TILESIZE/2 < location.x || location.y < TILESIZE/2 || height-TILESIZE/2 < location.y) mode = LOSE;
  }// -----------------------------------------------------------------------------------------
}// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
