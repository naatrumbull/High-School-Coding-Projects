class Ball
{
  private float size;
  private float xPos;
  private float yPos;
  private float xSpeed;
  private float ySpeed;
  private int red;
  private int green;
  private int blue;
  
  Ball()
  {
    red = (int)random(0, 255);
    green = (int)random(0, 255);
    blue = (int)random(0, 255);
    size = random(10, 50);
    xPos = width/2;
    yPos = height/2;
    xSpeed = random(-3, 3);
    ySpeed = random(-3, 3);
  }
  
  public void update()
  {
    comeBack();
    xPos += xSpeed;
    yPos += ySpeed;
  }
  
  public void render()
  {
    fill(red, green, blue);
    ellipse(xPos, yPos, size, size);
  }
  
  public void comeBack()
  {
    if (xPos < 0 + size * 0.5)
    {
      xSpeed *= -1;
      xSpeed++;
    } else if (xPos > width - size * 0.5)
    {
      xSpeed *= -1;
      xSpeed--;
    }
    
    if (yPos < 0 + size * 0.5)
    {
      ySpeed *= -1;
      ySpeed++;
    } else if (yPos > height - size * 0.5)
    {
      ySpeed *= -1;
      ySpeed--;
    }
  }
  
}
