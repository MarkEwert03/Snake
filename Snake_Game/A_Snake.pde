class Snake {
  //1. Instance Variables
  int s, speed;
  PVector direction, location, velocity;

  //2. Constructor(s)
  Snake() {
    s = 90;
    speed = 5;
    location  = new PVector(135, 135);
    direction = new PVector(0, 0);
  }

  //3. Behavior functions
  void show() {
    noStroke();
    fill(lime);
    rect(location.x, location.y, s, s, 10);
  }// -----------------------------------------------------------------------------------------

  void act() {
    location.add(direction);
    direction.setMag(speed);

    //0. Snaps to Tiles
    for (int i = 0; i<tileList.size(); i++) {
      Tile tempTile = tileList.get(i);
      //1. Closest tile
      if (dist(location.x, location.y, tempTile.x, tempTile.y) < 45) {
        //2. Snap to x
        if (key == 'w' || keyCode == UP || key == 's' || keyCode == DOWN) {
          mySnake.location.x = tempTile.x;
        }//2.
        //2. Snap to y
        if (key == 'a' || keyCode == LEFT || key == 'd' || keyCode == RIGHT) {
          mySnake.location.y = tempTile.y;
        }//2.
      }//1/
    }//0.
    
    //Lose if touching edge
    if (location.x < 40 || width-40 < location.x || location.y < 40 || height-40 < location.y) mode = LOSE;
  }// -----------------------------------------------------------------------------------------
}// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
