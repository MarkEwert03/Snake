class Snake {
  //1. Instance Variables
  int deathTimer = 1, index;
  final int CC = 5;
  SnakeHead head;
  ArrayList<SnakePart> partList;

  //2. Constructor(s)
  Snake() {
    head = new SnakeHead();
    partList = new ArrayList<SnakePart>();
  }//-----------------------------------------------------------------------

  void show() {
    //Head
    head.show();

    //Part
    for (int i = 0; i < partList.size(); i++) {
      SnakePart tempPart = partList.get(i);
      tempPart.show();
      //Changes color
      if (i < 1000/CC) {
        tempPart.hue = 1000-CC*int(map(i, 0, numberOfTiles, 0, 1000));
      } else tempPart.hue = 2000-CC*int(map(i, 0, numberOfTiles, 0, 1000));
      
      //Moves Cherry
      while (dist(tempPart.location.x, tempPart.location.y, myCherry.x, myCherry.y) < 1) {
        myCherry.hue = tempPart.hue;
        myCherry.x = (int(random(0, width/TS)) * TS) + TS/2;
        myCherry.y = (int(random(0, height/TS)) * TS) + TS/2;
      }
      
    }
  }//-----------------------------------------------------------------------

  void act() {
    if (frameCount % FRAME == 0) {
      //"Moves" tail to front (index number which is zero, heads location)
      partList.add( 0, new SnakePart(head.location) );

      //Head moves one tile
      head.act();

      //Removes tail (doesn't change length) if not touching cherry. If touching, then move cherry
      if (dist(head.location.x, head.location.y, myCherry.x, myCherry.y) < 1) {
        myCherry.x = (int(random(0, width/TS)) * TS) + TS/2;
        myCherry.y = (int(random(0, height/TS)) * TS) + TS/2;
      } else partList.remove(partList.size()-1);

      //Lose if head touches a snake part
      for (int i = 0; i < partList.size(); i++) {
        SnakePart tempPart = partList.get(i);
        if (dist(head.location.x, head.location.y, tempPart.location.x, tempPart.location.y) < 1) {
          mode = LOSE;
        }
      }
      index = partList.size();
    }
  }//-----------------------------------------------------------------------


  void deathAnimation() {
    deathTimer--;
    if (deathTimer < 0) {
      if (index != 0) {
        partList.remove(index-1);
        deathTimer = 20/index;
        index--;
      }
    }
  }//-----------------------------------------------------------------------
}
