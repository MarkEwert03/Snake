class Snake {
  //1. Instance Variables
  int s, speed, bodyLength, dir;
  PVector direction, location, velocity;

  //2. Constructor(s)
  Snake(int _x, int _y) {
    s = TILESIZE;
    speed = 10;
    location  = new PVector(_x, _y);
    direction = new PVector(0, 0);
  }

  //3. Behavior functions
  void show() {
    noStroke();
    fill(lime);
    rect(location.x, location.y, s, s, TILESIZE/10);
  }// -----------------------------------------------------------------------------------------

  void act() {
    location.add(direction);
    direction.setMag(speed);
    
    if (dir == UP)    direction.set( 0, -1);
    if (dir == LEFT)  direction.set(-1,  0);
    if (dir == DOWN)  direction.set( 0,  1);
    if (dir == RIGHT) direction.set( 1,  0);

    ////0. Snaps to Tiles
    //for (int i = 0; i<tileList.size(); i++) {
    //  Tile tempTile = tileList.get(i);
    //  //1. Closest tile
    //  if (dist(location.x, location.y, tempTile.x, tempTile.y) < 45) {
    //    //2. Snap to x
    //    if (key == 'w' || keyCode == UP || key == 's' || keyCode == DOWN) {
    //      location.x = tempTile.x;
    //    }//2.
    //    //2. Snap to y
    //    if (key == 'a' || keyCode == LEFT || key == 'd' || keyCode == RIGHT) {
    //      location.y = tempTile.y;
    //    }//2.
    //  }//1/
    //}//0.
    
    //Lose if touching edge
    //if (location.x < TILESIZE/2 || width-TILESIZE/2 < location.x || location.y < TILESIZE/2 || height-TILESIZE/2 < location.y) mode = LOSE;
  }// -----------------------------------------------------------------------------------------
}// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
