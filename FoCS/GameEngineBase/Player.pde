/****************************************************\
 
 Player 
 (a subclass of GameObject)
 
 \****************************************************/
int shootTimer = 0;

class Player extends GameObject
{
  Player(float x, float y)
  {   
    super(x, y, blueTriangle.width, blueTriangle.height);
    image = blueTriangle;
  }

  public void act()
  {
    super.act();

    xSpeed = 0;
    ySpeed = 0;

    if ((getKey('a') || getKey('A')))
    {
      if (x > 0)
      {
        x -= PLAYER_SPEED;
      }
    } else if (getKey('d') || getKey('D'))
    {
      if (x < width - blueTriangle.width)
      {
        x += PLAYER_SPEED;
      }
    } 

    if ((getKey('w') || getKey('W')))
    {
      if (y > 0)
      {
        y -= PLAYER_SPEED;
      }
    } else if (getKey('s') || getKey('S'))
    {
      if (y < height - blueTriangle.height)
      {
        y += PLAYER_SPEED;
      }
    } 


    // Pressing space bar allows you to fire... but it goes every frame!
    // Add a timer using the constant "PLAYER_COOLDOWN" provided in utility


    if (shootTimer > 0)
    {
      shootTimer--;
    }

    if (getKey(' ') && shootTimer == 0)
    {
      objects.add(new PlayerShotBasic(x, y));  
      objects.add(new PlayerShotBasic(x+24, y));  

      shootTimer = PLAYER_COOLDOWN;
    }
  }

  public void reactions()
  {
    for (int x = 0; x < collisions.size (); x++)
    {
      GameObject o = collisions.get(x);

      if (o instanceof EnemyProjectile || o instanceof Enemy)
      {
        takeDamage(o.getDamage());
      }
    }
  }
}
