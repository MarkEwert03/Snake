class Snake {
  //1. Instance Variables
  int deathTimer = 1, index, finalLength;
  int CC;
  SnakeHead head;
  ArrayList<SnakePart> partList;
  color lastPartColor;

  //2. Constructor(s)
  Snake() {
    head = new SnakeHead();
    partList = new ArrayList<SnakePart>();
    if (TS == 180) CC = 1;
    else if (TS == 90) CC = 2;
    else if (TS == 45) CC = 4;
  }//-----------------------------------------------------------------------

  void show() {
    //Part
    for (int i = 0; i < partList.size(); i++) {
      SnakePart tempPart = partList.get(i);
      tempPart.show();

      //Changes color
      tempPart.hue = 300+CC*int(map(i, 0, numberOfTiles, 0, 1000));
      if (tempPart.hue > 1000) tempPart.hue-= 1000;

      //Moves Cherry
      while (dist(tempPart.loc.x, tempPart.loc.y, myCherry.x, myCherry.y) < 1) {
        if (i == partList.size()-1) {
        }
        myCherry.x = (int(random(0, width/TS)) * TS) + TS/2;
        myCherry.y = (int(random(0, height/TS)) * TS) + TS/2;
      }
    }

    //Head
    head.show();
  }//-----------------------------------------------------------------------

  void act() {
    if (frameCount % FRAME == 0) {
      //"Moves" tail to front (index number which is zero, heads location)
      partList.add( 0, new SnakePart(head.loc) );

      //Head moves one tile
      head.act();

      //Removes tail (doesn't change length) if not touching cherry. If touching, then move cherry
      if (dist(head.loc.x, head.loc.y, myCherry.x, myCherry.y) < 1) {
        myCherry.x = (int(random(0, width/TS)) * TS) + TS/2;
        myCherry.y = (int(random(0, height/TS)) * TS) + TS/2;
      } else partList.remove(partList.size()-1);

      //Lose if head touches a snake part
      for (int i = 0; i < partList.size(); i++) {
        SnakePart tempPart = partList.get(i);
        if (i == partList.size()-1) lastPartColor = tempPart.partColor;
        if (dist(head.loc.x, head.loc.y, tempPart.loc.x, tempPart.loc.y) < 1) {
          mode = LOSE;
          print("Touched part");
        }
      }
      index = partList.size();
      finalLength = index;
    }

    //Win Condition
    if (partList.size() == numberOfTiles-1) mode = WIN;
  }//-----------------------------------------------------------------------

  void CPU() {
    head.CPU();
  }//-----------------------------------------------------------------------


  void endAnimation() {
    deathTimer--;
    if (deathTimer < 0) {
      if (index != 0) {
        partList.remove(index-1);
        deathTimer = 15/index;
        index--;
      }
    }
  }//-----------------------------------------------------------------------
}
