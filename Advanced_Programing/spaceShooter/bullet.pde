class Bullet extends GameObject
{
  
  Bullet(float x, float y, float w, float h, String direction)
  {
    super(x, y, w, h, color(255, 0, 0));
    if(direction == "up")
    {
      setUpDown(-15);
    }
    else if (direction == "down")
    {
      setUpDown(15);
    }
    else if (direction == "left")
    {
      setLeftRight(-15);
    }
    else if (direction == "right")
    {
      setLeftRight(15);
    }
    else if(direction == "upRight")
    {
      setLeftRight(7.5);
      setUpDown(-7.5);
    }
    else if(direction == "upLeft")
    {
      setLeftRight(-7.5);
      setUpDown(-7.5);
    }
    else if(direction == "downRight")
    {
      setLeftRight(7.5);
      setUpDown(7.5);
    }
    else if(direction == "downLeft")
    {
      setLeftRight(-7.5);
      setUpDown(7.5);
    }
    
    showBox = false;
    
  }
  
  void decideTrash()
  {
    trash.add(this);
  }
  
}

class HeroBullet extends Bullet
{
  HeroBullet(float x, float y, String direction)
  {
    super(x, y, 5, 30, direction);
    bgColor = color(255, 0, 0);
    damageAmt = 1;
  }
  
  void avatar()
  {
    
  }
  
}

class BonusHeroBullet extends Bullet
{
  BonusHeroBullet(float x, float y, String direction)
  {
    super(x, y, 10, 50, direction);
    bgColor = color(221, 255, 3);
    damageAmt = 2;
  }
  
  void avatar()
  {
    
  }
  
  void events()
  {
    if(bgColor == color(221, 255, 3))
    {
      bgColor = color(255);
    }
    else
    {
      bgColor = color(221, 255, 3);
    }
  }
  
}

class EnemyBullet extends Bullet
{
  EnemyBullet(float x, float y, String direction)
  {
    super(x, y, 5, 30, direction);
    bgColor = color(255, 255, 0);
  }
  
  void avatar()
  {
    
  }
}

class EnemyBullet2 extends Bullet
{
  EnemyBullet2(float x, float y, String direction)
  {
    super(x, y, 30, 5, direction);
    bgColor = color(255, 255, 0);
  }
  
  void avatar()
  {
    
  }
}

class RotatedEnemyBullet extends Bullet
{
  RotatedEnemyBullet(float x, float y, String direction)
  {
    super(x, y, 5, 30, direction);
    bgColor = color(255, 255, 0);
    showBox = false;
    fillBox = false;
  }
  
  void avatar()
  {
    pushMatrix();
    translate(x + 0, y + 0);
    rotate(PI/4);
    fill(255, 255, 0);
    rect(0, 0, 5, 30);
    popMatrix();
  }
  
}

class RotatedEnemyBullet2 extends Bullet
{
  RotatedEnemyBullet2(float x, float y, String direction)
  {
    super(x, y, 5, 30, direction);
    bgColor = color(255, 255, 0);
    showBox = false;
    fillBox = false;
  }
  
  void avatar()
  {
    pushMatrix();
    translate(x + 0, y + 0);
    rotate(3*PI/4);
    fill(255, 255, 0);
    rect(0, 0, 5, 30);
    popMatrix();
  }
  
}

class EyeEnemyBullet extends Bullet
{
  
  float transparency = 255;
  
  EyeEnemyBullet(float x, float y)
  {
    super(x, y, 90, 90, null);
    objectStroke = color(0, 255, 0, transparency);
    showBox = true;
    fillBox = false;
    weight = 10;
  }
  
  void events()
  {
    rectMode(CENTER);
    objectStroke = color(0, 255, 0, transparency);
    w += 2;
    h += 2;
    transparency -= 2;
    if(transparency <= 0)
    {
      trash.add(this);
    }
    rectMode(CORNER);
  }
  
}

class MegaBossBullet1 extends Bullet
{
  MegaBossBullet1(float x, float y, String direction)
  {
    super(x, y, 20, 60, direction);
    bgColor = color(245, 22, 208);
    damageAmt = 2;
    
  }
  
  void avatar()
  {
    
  }
  
}

class HeroBonusBullet extends Bullet
{
  HeroBonusBullet(float x, float y, String direction)
  {
    super(x, y, 50, 70, direction);
    damageAmt = 3;
  }
}
