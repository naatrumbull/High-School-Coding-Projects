
class Asteroid
{
  private float x;
  private float y;
  private float xSpeed;
  private float ySpeed;
  private float size;
  private int imageNum;
  private float health;
  private int maxHealth; 

  private boolean isLeftClicked()
  {
    if (mousePressed && mouseX > x && mouseX < x + size && mouseY > y && mouseY < y + size && overHeatTimer == 0)
    {
      return true;
    }

    return false;
  }

  Asteroid(float x, float y, float size)
  {
    imageNum = (int)random(0, 4);
    this.x = x;
    this.y = y;
    xSpeed = random(-1, 1) * (SPEED_FACTOR / size);
    ySpeed = random(-1, 1) * (SPEED_FACTOR / size);
    this.size = size;
    health = 0;
    maxHealth = (int)size;
  }

  public void eventListener()
  {
    if (isLeftClicked())
    {
      leftClickEvent();
    }
  }

  public void leftClickEvent()
  {
    health -= 5;

    if (health / maxHealth < 0.5)
    {
      int dice = (int)random(0, 4);

      image(damaged[dice], x, y, size, size);
    }

    if (health < 0)
    {
      float boomSize = size * BOOM_SCALE;
      float boomX = mouseX + random(-boomSize/2, boomSize/2);
      float boomY = mouseY + random(-boomSize/2, boomSize/2);
      b.add(new Boom(boomX, boomY, boomSize, BOOM_DURATION));
      if (size > 50)
      {
        a.add(new Asteroid(x, y, size/2));
        a.add(new Asteroid(x, y, size/2));
      }
      size = 0;
      score++;
    }
  }

  public void update()
  {
    x += xSpeed;
    y += ySpeed;
    wrap();
  }

  public void render()
  {
    image(rocks[imageNum], x, y, size, size);
  }

  public void wrap()
  {
    if (x > width)
    {
      x = 0 - size;
    } 

    if (x < 0 - size)
    {
      x = width;
    }

    if (y > height)
    {
      y = 0 - size;
    }

    if (y < 0 - size)
    {
      y = height;
    }
  }
}
