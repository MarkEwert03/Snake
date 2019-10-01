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

void setup() {
  fullScreen();
}

void draw() {
  background(0);
  if (mode == INTRO) intro();
  if (mode == GAME)  game();
  if (mode == PAUSE) pause();
  if (mode == LOSE)  lose();
  if (mode == WIN)   win();
}

void mousePressed() {
  if (mode == INTRO) introMousedPressed();
  if (mode == GAME)  gameMousedPressed();
  if (mode == PAUSE) pauseMousedPressed();
  if (mode == LOSE)  loseMousedPressed();
  if (mode == WIN)   winMousedPressed();
}
