boolean up = false; 
boolean left = false;
boolean right = false;
boolean down = false;

void mousePressed()
{
  if(scene == 0 && btnStart.mouseOver())
  {
    prepareLevel1();
  }
  
  if((scene == 100 || scene == 99) && btnPlayAgain.mouseOver())
  {
    prepareLevel1();
  }
}

void keyPressed()
{
  if (keyCode >= 37 && keyCode <= 40)
  {
    hero.setSpeed(keyCode);
    if(keyCode == 37) left = true;
    if(keyCode == 38) up = true;
    if(keyCode == 39) right = true;
    if(keyCode == 40) down = true;
  }
  
  if(keyCode == 32)
  {
    hero.shoot();
  }
  
  
  if(keyCode == 10 && timer >= 500)
  {
    hero.shootBonus();
    timer = 0;
    
  }
}

void keyReleased()
{
  if (keyCode == 37) left = false;
  if(keyCode == 38) up = false;
  if(keyCode == 39) right = false;
  if(keyCode == 40) down = false;
  
  if(keyCode>=37 && keyCode <= 40)
  {
    if(!left && !right && !up && !down)
    hero.stopObject();
  }
}
