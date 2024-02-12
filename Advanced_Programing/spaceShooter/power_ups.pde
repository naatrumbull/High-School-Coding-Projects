class PowerUp extends GameObject
{
  int powerUpTimer = 600;
  
  
  PowerUp()
  {
    super(0, 0, 0, 0, color(125, 125, 200));
    w = 50;
    h = 50;
    x = random(w/2, width - w/2);
    y = random(height/2, height - h/2);
    
  }
  
  void events()
  {
    clearPowerUp();
  }
  
  void clearPowerUp()
  {
    if(powerUpTimer > 0)
    {
      powerUpTimer--;
    }
    
    if(powerUpTimer == 0)
    {
      trash.add(this);
    }
    
  }
  
  
}

class NewLife extends PowerUp
{
  
  NewLife()
  {
    showBox = false;
    fillBox = false;
  }
  
  void avatar()
  {
    if(powerUpTimer < 180)
    {
      if(powerUpTimer % 20 >= 0 && powerUpTimer % 20 <= 10)
      {
        image(heart, x - 25, y - 25, 50, 50);
      }
      else
      {
        //empty
      }
    }
    else
    {
      image(heart, x - 25, y - 25, 50, 50);
    }
  }
  
  void bonus()
  {
    if(lives.size() < 10)
    {
      float xHolder = lives.get(lives.size() - 1).x + 40;
      lives.add(new Lives(xHolder, 30, 30, 30, color(255, 0, 0)));
    }
    
    trash.add(this);
  }
  
}

class Shield extends PowerUp
{
  
  Shield()
  {
    fillBox = false;
    showBox = false;
  }
  
  
  void avatar()
  {
    if(powerUpTimer < 180)
    {
      if(powerUpTimer % 20 >= 0 && powerUpTimer % 20 <= 10)
      {
        image(shield, x - 25, y - 25, 50, 50);
      }
      else
      {
        //empty
      }
    }
    else
    {
      image(shield, x - 25, y - 25, 50, 50);
    }
  }
  
  void bonus()
  {
    hero.isDefending = true;
    hero.isDefendingTimer = 600;
    trash.add(this);
  }
  
}

class PoweredUpShip extends PowerUp
{
  
  PoweredUpShip()
  {
    showBox = false;
    fillBox = false;
  }
  
  void avatar()
  {
    image(lightning, x - 31, y - 33, 65, 65);
  }
  
  void bonus()
  {
    hero.isPoweredUp = true;
    hero.isPoweredUpTimer = 300;
    
    trash.add(this);
  }
  
  
}
