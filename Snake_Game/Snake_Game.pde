//Mark Ewert
//Oct 1

//Mode Framework
int mode;
final int INTRO = 0;
final int GAME  = 1;
final int PAUSE = 2;
final int LOSE  = 3;
final int WIN   = 4;

//Colours
color red             = #df2020;
color orange          = #df8020;
color yellow          = #dfdf20;
color lime            = #80df20;
color green            = #50df20;
color mint            = #20df50;
color cyan            = #20dfdf;
color blue            = #2080df;
color navy            = #2020df;
color purple          = #8020df;
color violet          = #df20df;
color pink            = #df2080;
color black           = 0;
color grey            = 127;
color white           = 255;

//Snake
ArrayList<Snake> snakeList;
int t = 180;

//Tiles
ArrayList<Tile> tileList;
final int TILESIZE = 10;

// ------------------------------------------------------------------------------------------
void setup() {
  //Basic
  fullScreen(); // Dimentions: x = 1440, y = 900
  frameRate(30);
  mode = INTRO;

  //Shapes
  rectMode(CENTER);

  //Text
  textAlign(CENTER, CENTER);
  textSize(240);

  //Snake
  snakeList = new ArrayList<Snake>();
  snakeList.add( new Snake(135, 135));

  //Tile
  tileList = new ArrayList<Tile>();
  int tileX = TILESIZE/2;
  int tileY = TILESIZE/2;
  for (int i = 0; i < 2*(width/TILESIZE)*(height/TILESIZE); i++) {
    //Adding Tiles
    tileList.add( new Tile(tileX, tileY));
    //Aligning Tiles
    tileX += TILESIZE;
    if (width+TILESIZE <= tileX) {
      tileY += TILESIZE;
      tileX = TILESIZE/2;
    }
    //Changing tile Color
    for (int j = 0; j < tileList.size(); j++) {
      Tile tempTile = tileList.get(i);
      if (i % 2 == 0) tempTile.c = 225;
      else tempTile.c = white;
    }
  }
}// -----------------------------------------------------------------------------------------

void draw() {
  background(0);

  //Mode Framework
  if      (mode == INTRO) intro();
  else if (mode == GAME)  game();
  else if (mode == PAUSE) pause();
  else if (mode == LOSE)  lose();
  else if (mode == WIN)   win();
  else println("Error! Mode was " + mode);

  print(snakeList.size());
}// -----------------------------------------------------------------------------------------

void mousePressed() {
  if      (mode == INTRO) introMousePressed();
  else if (mode == GAME)  gameMousePressed();
  else if (mode == PAUSE) pauseMousePressed();
  else if (mode == LOSE)  loseMousePressed();
  else if (mode == WIN)   winMousePressed();
  else println("Error! Mode was " + mode);
}// -----------------------------------------------------------------------------------------

void keyPressed() {
  for (int i = 0; i < snakeList.size(); i++) {
    Snake tempSnake = snakeList.get(i);

    if (key == 'w' || keyCode == UP )   tempSnake.dir = UP;
    if (key == 'a' || keyCode == LEFT)  tempSnake.dir = LEFT;
    if (key == 's' || keyCode == DOWN)  tempSnake.dir = DOWN;
    if (key == 'd' || keyCode == RIGHT) tempSnake.dir = RIGHT;
    if (key == ' ') {
      if (mode == GAME) mode = PAUSE;
      else if (mode == PAUSE) mode = GAME;
    }
  }
}// -----------------------------------------------------------------------------------------
