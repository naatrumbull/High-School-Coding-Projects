class Hero extends GameObject
{
  int speed = 7;
  boolean isDefending = false;
  boolean regenerating = false;
  boolean isPoweredUp = false;
  int shotDelay = 0;
  int score = 0;
  int isDefendingTimer = 600;
  int isPoweredUpTimer = 300;

  Hero(float x, float y)
  {
    super(x, y, 81, 100, color(0, 255, 0));
    fillBox = false;
    showBox = false;
  }

  void avatar()
  {
    if(!isPoweredUp)
    {
      image(spaceShip, x + -48, y + -47, w + 15, h + 2);
    }
    else if(isPoweredUp)
    {
      if(isPoweredUpTimer > 100)
      {
        image(bonusShip, x + -43, y + -56, w + 3, h + 8);
      }
      else
      {
        if(isPoweredUpTimer % 20 > 0 && isPoweredUpTimer % 20 < 10)
        {
          image(bonusShip, x + -43, y + -56, w + 3, h + 8);
        }
        else
        {
          image(spaceShip, x + -48, y + -47, w + 15, h + 2);
        }
      }
    }
    
    if (isDefending)
    {
      strokeWeight(1);
      if (isDefendingTimer > 180)
      {
        noFill();
        stroke(255);
        
        ellipse(x, y, 113, 113);
        stroke(0);
      } else if (isDefendingTimer % 20 > 0 && isDefendingTimer % 20 < 10)
      {
        noFill();
        stroke(255);
        ellipse(x, y, 100, 100);
        stroke(0);
      }
    }
    
  }

  void setSpeed(int code)
  {
    if (code == 37)
    {
      //left
      setLeftRight(speed * -1);
    } else if (code == 38)
    {
      //up
      setUpDown(-1 * speed);
    } else if (code == 39)
    {
      //right
      setLeftRight(speed);
    } else if (code == 40)
    {
      //down
      setUpDown(speed);
    }
  }

  void shoot()
  {
    if (frameCount > shotDelay)
    {
      if(!isPoweredUp)
      {
        objects.add(new HeroBullet(x, top-20, "up"));
      }
      else
      {
        objects.add(new BonusHeroBullet(x, top-20, "up"));
      }
      
      shotDelay = frameCount + 15;
    }
  }

  void shootBonus()
  {
    objects.add(new HeroBonusBullet(x, top-20, "up"));
  }

  void offScreenCheck()
  {
    defineBoundaries();
    
    if (!regenerating)
    {

      if (bottom + udSpeed >= height)
      {
        y = height - h/2;
      }
      if(top + udSpeed <= 0)
      {
        y = h/2;
      }
      if (left + lrSpeed <= 0)
      {
        x = w/2;
      }
      if (right + lrSpeed >= width)
      {
        x = width - w/2;
      }
    } else
    {
      udSpeed = 0;
    }
    
    /*
    if(top < 0)
    {
      y = h/2;
    }
    if(bottom > height)
    {
      y = height - h/2;
    }
    if(left < 0)
    {
      x = w/2;
    }
    if(right > width)
    {
      x = width - w/2;
    }
    */
  }

  void gotHit()
  {
    if (!isDefending)
    {
      y = height + 50;
      regenerating = true;
    }
  }

  void events() //will always run
  {
    if (regenerating)
    {
      y -= 2;
      if (y <= height - 100) regenerating = false;
    }

    if (isDefending)
    {
      if (isDefendingTimer > 0)
      {
        isDefendingTimer--;
      }

      if (isDefendingTimer == 0)
      {
        isDefending = false;
      }
    }
    
    if (isPoweredUp)
    {
      if(isPoweredUpTimer > 0)
      {
        isPoweredUpTimer--;
      }
      
      if(isPoweredUpTimer == 0)
      {
        isPoweredUp = false;
      }
      
    }
  }
}

class BonusBar extends GameObject
{

  BonusBar()
  {
    super(25, 290, 40, 0, color(0, 255, 0));
    rectMode(CORNER);
    //timer = 0;
    showBox = false;
    center = false;
  }

  void events()
  {
    update();
    render();
  }

  void update()
  {
    if (timer < 500)
    {
      timer++;
    }
    if (timer >= 500)
    {
      text("Press\nEnter", 45, 330);
    }
  }

  void render()
  {

    h = timer/500;
    h = h*90;
    y = 290 - h;
  }
}

class TitleScreenHero extends Hero
{
  TitleScreenHero(float x, float y)
  {
    super(x, y);
    setLeftRight(-10);
    isDefending = false;
  }

  void shoot()
  {
    int rand = (int)random(1, 101);
    if (rand < 5)
    {
      titleScreenObjects.add(new HeroBullet(x, top-20, "up"));
    }
    if (rand == 11)
    {
      titleScreenObjects.add(new HeroBonusBullet(x, top-20, "up"));
    }
  }

  void offScreenCheck()
  {
    if (left + lrSpeed <= 0)
    {
      setLeftRight(10);
    }
    if (right + lrSpeed >= width)
    {
      setLeftRight(-10);
    }
  }
}
