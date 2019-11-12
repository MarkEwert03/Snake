class Snake {
  //1. Instance Variables
  SnakeHead head;
  ArrayList<SnakePart> parts;

  //2. Constructor(s)
  Snake() {
    head = new SnakeHead();
    parts = new ArrayList<SnakePart>();
    parts.add( new SnakePart(new PVector(TILESIZE*1.5, TILESIZE/2)));
    parts.add( new SnakePart(new PVector(TILESIZE/2, TILESIZE/2)));
  }//-----------------------------------------------------------------------

  void show() {
    head.show();
    for (int i = 0; i < parts.size(); i++) {
      parts.get(i).show();
    }
  }//-----------------------------------------------------------------------

  void act() {
    if (frameCount % frames == 0) {
      //Makes part where head is
      parts.add(0, new SnakePart(head.location));
      //Head acts
      head.act();
      //Removes tail part
      parts.remove(parts.size()-1);
    }
  }//-----------------------------------------------------------------------
}
