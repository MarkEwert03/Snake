class Snake {
  //1. Instance Variables
  int s, speed;
  PVector direction, location;

  //2. Constructor(s)
  Snake() {
    s = 90;
    speed = 4;
    location = new PVector(135, 135);
    direction = new PVector(1, 0);
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
    
  }// -----------------------------------------------------------------------------------------
}// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
