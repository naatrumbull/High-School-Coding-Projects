class Particle 
{
  private float xPosition;
  private float yPosition;
  private float speed;
  private float size;
  private int red;
  private int green;
  private int blue;
  private int fade;
  private int hide;


  Particle(float x, float y, float si, float sp, int r, int g, int b, int h)
  {
    xPosition = x;
    yPosition = y;
    size = si;
    speed = sp;
    red = r;
    green = g;
    blue = b;
    fade = 255;
    hide = h;
  }

  public void update()
  {
    yPosition += speed;

    if (size > 2)
    {
      size -= 0.5;
    }

    fade -= hide;
  }

  public void render()
  {
    fill(red, green, blue, fade);
    ellipse(xPosition, yPosition, size, size);
  }
}
