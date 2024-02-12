

final int START_SCREEN_NUMBER = 0;
final int END_SCREEN_NUMBER = 10;
final int BALL_SPEED = 10;
PImage heart;
int screenNumber = 0;
Button btnPlay;
Paddle paddle;
Ball ball;

ArrayList<Lives> lives;
ArrayList<Particle> particle;
ArrayList<Particle> brickPart;
ArrayList<Firework> firework;
ArrayList<Brick> bricks;

void setup()
{
  heart = loadImage("heart.png");
  
  particle = new ArrayList<Particle>();
  brickPart = new ArrayList<Particle>();
  firework = new ArrayList<Firework>();
  
  size(800, 600);
  prepareStartScreen();
  
}

void draw()
{
  background(0);
  if (screenNumber == START_SCREEN_NUMBER)
  {
    startScreen();
  }
  else if (screenNumber == 1)
  {
    level1();
  } 
  else if (screenNumber == 2)
  {
    level2();
  }
  else if (screenNumber == END_SCREEN_NUMBER)
  {
    endScreen();
  }
}
