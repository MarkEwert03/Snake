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

//Key Commands
boolean wKey, aKey, sKey, dKey;

//Snake
Snake mySnake;

//Tiles
ArrayList<Tile> tileList;

// ------------------------------------------------------------------------------------------
void setup() {
  //Basic
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
  if (key == 'w' || keyCode == UP)    wKey = true;
  if (key == 'a' || keyCode == LEFT)  aKey = true;
  if (key == 's' || keyCode == DOWN)  sKey = true;
  if (key == 'd' || keyCode == RIGHT) dKey = true;
  if (key == ' ') {
    if (mode == GAME) mode = PAUSE;
    else if (mode == PAUSE) mode = GAME;
  }
}// -----------------------------------------------------------------------------------------

void keyReleased() {
  if (key == 'w' || keyCode == UP)    wKey = false;
  if (key == 'a' || keyCode == LEFT)  aKey = false;
  if (key == 's' || keyCode == DOWN)  sKey = false;
  if (key == 'd' || keyCode == RIGHT) dKey = false;
}// -----------------------------------------------------------------------------------------
