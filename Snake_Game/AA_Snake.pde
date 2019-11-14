class Snake {
  //1. Instance Variables
  SnakeHead head;
  ArrayList<SnakePart> partList;

  //2. Constructor(s)
  Snake() {
    head = new SnakeHead();
    partList = new ArrayList<SnakePart>();
  }//-----------------------------------------------------------------------

  void show() {
    head.show();
    for (int i = 0; i < partList.size(); i++) {
      SnakePart tempPart = partList.get(i);
      tempPart.show();
      
    }
  }//-----------------------------------------------------------------------

  void act() {
    println(snakeTimer);
    snakeTimer--;
    if (frameCount % frames == 0) {
      //"Moves" tail to front (index number which is zero, heads location)
      partList.add(0, new SnakePart(head.location));
      //Head acts
      head.act();
      //Removes tail part
      if (0 < snakeTimer) {
        partList.remove(partList.size()-1);
      }
      if (snakeTimer <= 0) snakeTimer = 60;
    }
  }//-----------------------------------------------------------------------
}
