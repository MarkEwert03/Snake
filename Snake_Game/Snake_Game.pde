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
color green           = #50df20;
color mint            = #20df50;
color cyan            = #20dfdf;
color blue            = #2080df;
color navy            = #2020df;
color purple          = #8020df;
color violet          = #df20df;
color pink            = #df2080;
color black           = #000000;
color grey            = #808080;
color white           = #ffffff;

//Tiles
ArrayList<Tile> tileList;

//--
//Main variable that changes the sizes of everything, framerate, and other things too
int TS = 90; 
//--
float numberOfTiles;

//Snake
Snake mySnake;
final int FRAME = 5;
final int ROUNDNESS = TS;

//Cherry
Cherry myCherry;

// ------------------------------------------------------------------------------------------
void setup() {
  //Basic
  fullScreen(); // Dimentions: x = 1440, y = 900
  numberOfTiles = (width/TS)*(height/TS);
  frameRate(width/TS);
  mode = INTRO;

  //Shapes
  colorMode(HSB, 1000, 1000, 1000, 1000);
  rectMode(CENTER);
  noStroke();
  loseAlpha = 0;

  //Text
  textAlign(CENTER, CENTER);
  textSize(240);

  //Tile
  tileList = new ArrayList<Tile>();
  int tileX = TS/2;
  int tileY = TS/2;
  for (int i = 0; i < (width+1/TS)*(height/TS); i++) {
    //Adding Tiles
    tileList.add( new Tile(tileX, tileY));
    //Aligning Tiles
    tileX += TS;
    if (width + TS <= tileX) {
      tileY += TS;
      tileX = TS/2;
    }
  }

  //Snake
  mySnake = new Snake();
  
  //Cherry
  myCherry = new Cherry();
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
  if (key == 'w' || keyCode == UP )   mySnake.head.dir = UP;
  if (key == 'a' || keyCode == LEFT)  mySnake.head.dir = LEFT;
  if (key == 's' || keyCode == DOWN)  mySnake.head.dir = DOWN;
  if (key == 'd' || keyCode == RIGHT) mySnake.head.dir = RIGHT;
  if (key == ' ') {
    if (mode == GAME) mode = PAUSE;
    else if (mode == PAUSE) mode = GAME;
  }
}// -----------------------------------------------------------------------------------------
