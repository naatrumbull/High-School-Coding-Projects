class Enemy extends GameObject
{
  
  int health = 0;
  boolean isDamaged = false;
  int damageTimer = 20;
  int r = 0;
  
  Enemy(float x, float y, float w, float h, color bgColor)
  {
    super(x, y, w, h, bgColor);
  }
  
  void offScreenCheck()
  {
    if(x + w/2 >= width || x - w/2 <= 0)
    {
      lrSpeed *= -1;
    }
    if(y + h/2 >= height || y - h/2 <= 0)
    {
      udSpeed *= -1;
    }
  }
  
  void takeDamage(int damageAmt)
  {
    if(health > 0 && isDamaged == false)
    {
      health = health - damageAmt;
      isDamaged = true;
    }
    
    if(health <= 0)
    {
      trash.add(this);
    }
  }
  
  
  void damagedAnimation()
  {
    
    if(isDamaged)
    {
      
      if((damageTimer % 4 == 2 || damageTimer % 4 == 3) && damageTimer > 0)
      {
        r = -255;
        damageTimer --;
      }
      else
      {
        r = 0;
        damageTimer --;
      }
    }
    
    if(damageTimer == 0)
    {
      isDamaged = false;
      damageTimer = 45;
      r = 0;
    }
    
  }
  
}
