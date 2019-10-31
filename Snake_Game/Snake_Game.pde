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
Snake mySnake;

//Tiles
ArrayList<Tile> tileList;

// ------------------------------------------------------------------------------------------
void setup() {
  //Basic
  // Dimentions: x = 1440. y = 900.
  fullScreen();
  mode = INTRO;

  //Shapes
  rectMode(CENTER);

  //Text
  textAlign(CENTER, CENTER);
  textSize(240);

  //Snake
  mySnake = new Snake();

  //Tile
  tileList = new ArrayList<Tile>();
  final int PIXELSIZE = 90;
  int tileX = 45;
  int tileY = 45;
  for (int i = 0; i < 170; i++) {
    //Adding Tiles
    tileList.add( new Tile(tileX, tileY));
    //Aligning Tiles
    tileX += PIXELSIZE;
    if (width+PIXELSIZE <= tileX) {
      tileY += PIXELSIZE;
      tileX = 45;
    }
    //Changing tile Color
    for (int j = 0; j < tileList.size(); j++) {
      Tile tempTile = tileList.get(i);
      if (i % 2 == 0) tempTile.c = black;
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
  if (key == 'w' || keyCode == UP ) {
      mySnake.direction.set(0, -1);
  }
  if (key == 'a' || keyCode == LEFT)  mySnake.direction.set(-1, 0);
  if (key == 's' || keyCode == DOWN)  mySnake.direction.set(0, 1);
  if (key == 'd' || keyCode == RIGHT) mySnake.direction.set(1, 0);
  if (key == ' ') {
    if (mode == GAME) mode = PAUSE;
    else if (mode == PAUSE) mode = GAME;
  }
}// -----------------------------------------------------------------------------------------
