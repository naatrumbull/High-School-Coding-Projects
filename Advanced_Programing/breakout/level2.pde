color red = color(255, 0, 0);
void prepareLevel2()
{
  bricks = new ArrayList<Brick>();
  lives = new ArrayList<Lives>();
  paddle = new Paddle(width/2, height - 50);
  ball = new Ball(width/2, height/2, 0);
  loadBricksLevel2();
  setClr();
  makeSpecialLevel2();
  createLives();
  screenNumber = 2;
  
}

void level2()
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
    lives.get(b).display();
  }
  for(int b = 0; b < lives.size(); b++)
  {
    lives.get(b).loadLives();
  }
  for(int b = 0; b < bricks.size(); b++)
  {
    bricks.get(b).display();
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
  
  if(bricks.size() == 0)
  {
    prepareEndScreen();
  }
  
}

void loadBricksLevel2()
{
  for(int y = 0; y < 4; y++)
  {
    for (int x = 0; x < 16; x++)
    {
      bricks.add(new Brick(x*50+25, y*20+70, red, 20, false));
    }
  }
  
  for(int y = 0; y < 3; y++)
  {
    for (int x = 0; x < 3; x++)
    {
      bricks.add(new Brick(x*50+75, y*20+170, red, 20, false));
    }
  }
  
  for(int y = 0; y < 3; y++)
  {
    for (int x = 0; x < 3; x++)
    {
      bricks.add(new Brick(x*50+325, y*20+170, red, 20, false));
    }
  }
  
  for(int y = 0; y < 3; y++)
  {
    for (int x = 0; x < 3; x++)
    {
      bricks.add(new Brick(x*50+575, y*20+170, red, 20, false));
    }
  }
}

void makeSpecialLevel2()
{
  bonus1 = (int)random(0, 91);
  bonus2 = (int)random(0, 91);
  bonus3 = (int)random(0, 91);
  print (bonus1 + ", " + bonus2 + ", " + bonus3);
  
  bricks.get(bonus1).value = 100;
  bricks.get(bonus1).isSpecial = true;
  bricks.get(bonus1).clr = color(0, 255, 0);
  
  bricks.get(bonus2).value = 100;
  bricks.get(bonus2).isSpecial = true;
  bricks.get(bonus2).clr = color(0, 255, 0);
  
  bricks.get(bonus3).value = 100;
  bricks.get(bonus3).isSpecial = true;
  bricks.get(bonus3).clr = color(0, 255, 0);
}

void setClr()
{
  
  color clr;
  int value;
  
  for(int i = 0; i < 16; i++)
  {
    value = 90;
    clr = color(random(0, 50), 0, 0);
    bricks.get(i).clr = clr;
    bricks.get(i).value = value;
  }
  
  for(int i = 0; i < 16; i++)
  {
    value = 70;
    clr = color(random(50, 100), 0, 0);
    bricks.get(i+16).clr = clr;
    bricks.get(i+16).value = value;
  }
  
  for(int i = 0; i < 16; i++)
  {
    value = 50;
    clr = color(random(100, 150), 0, 0);
    bricks.get(i+32).clr = clr;
    bricks.get(i+32).value = value;
  }
  
  for(int i = 0; i < 16; i++)
  {
    value = 40;
    clr = color(random(150, 200), 0, 0);
    bricks.get(i+48).clr = clr;
    bricks.get(i+48).value = value;
  }
  
  for(int i = 0; i < 27; i++)
  {
    value = 20;
    clr = color(random(150, 255), 0, 0);
    bricks.get(i+64).clr = clr;
    bricks.get(i+64).value = value;
  }
  
}
