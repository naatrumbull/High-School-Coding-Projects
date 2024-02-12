int bonus1;
int bonus2;
int bonus3;


void prepareLevel1()
{
  paddle = new Paddle(width/2, height - 50);
  ball = new Ball(width/2, height/5, BALL_SPEED);
  bricks = new ArrayList<Brick>();
  lives = new ArrayList<Lives>();
  loadBricksLevel1();
  createLives();
  screenNumber = 1;
  
  
}

void level1()
{
  
  noStroke();
  for(int i = 0; i < brickPart.size(); i++)
  {
    brickPart.get(i).update();
  }
  for(int i = 0; i < brickPart.size(); i++)
  {
    brickPart.get(i).render();
  }
  for(int b = 0; b < lives.size(); b++)
  {
    lives.get(b).loadLives();
  }
  for(int b = 0; b < bricks.size(); b++)
  {
    bricks.get(b).display();
  }
  for(int b = 0; b < lives.size(); b++)
  {
    lives.get(b).display();
  }
  for(int b = 0; b < bricks.size(); b++)
  {
    if(bricks.get(b).isSpecial == true)
    {
      bricks.get(b).clr = color(0, random(100, 255), 0);
    }
  }
  
  ball.display();
  paddle.display();
  displayScore();
  
  if (bricks.size() == 0)
  {
    prepareLevel2();
  }
}

void loadBricksLevel1()
{
  int value;
  color clr;
  bonus1 = (int)random(0, 57);
  bonus2 = (int)random(0, 57);
  bonus3 = (int)random(0, 57);
  print (bonus1 + ", " + bonus2 + ", " + bonus3);
  boolean special;
  for(int r = 0; r < 4; r++)
  {
    
    for(int c = 0; c<14; c++)
    {
      if(bricks.size() + 1 == bonus1 || bricks.size() + 1 == bonus2 || bricks.size() + 1 == bonus3)
      {
        clr = color(0, 255, 0);
        value = 100;
        special = true;
      }
      else if (r == 0 || r == 3 || (r==1 || r==2) && (c==0 || c == 13))
      {
        value = 10;
        clr = color(random(50, 180), 0, 0);
        special = false;
      }
      else 
      {
        value = 50;
        clr = color(random(0, 50), 0, 0);
        special = false;
      }
      bricks.add(new Brick(c*50+75, r*20+70, clr, value, special));
    }
  }
}


void createLives()
{
  for (int i = 0; i < 5; i++)
  {
    lives.add(new Lives());
  }
}


void displayScore()
{
  textFont(createFont("Impact", 24));
  textAlign(LEFT);
  fill(255);
  text("Score: " + score, width * .55, 50);
  
  text("HighScore: " + highScore, width * .75, 50);
}
