class Stars
{
  private float xPos;
  private float yPos;
  private int size;
  private int speed;

  Stars(float y)
  {
    xPos = random(0, width);
    yPos = y;
    speed = 3;
    setSize();
    setSpeed();
  }

  public void render()
  {
    noStroke();
    fill(255);
    ellipse(xPos, yPos, size, size);
  }

  public void update()
  {
    yPos += speed;
  }

  public void setSize()
  {
    int cube = (int)random(0, 11); 

    if (cube <= 5)
    {
      size = 1;
    } else if (cube >= 6 && cube <= 8)
    {
      size = 2;
    } else 
    {
      size = 3;
    }
  }

  public void setSpeed()
  {
    if (size == 3)
    {
      speed *= 3;
    } else if (size == 2)
    {
      speed *= 2;
    }
  }
}
