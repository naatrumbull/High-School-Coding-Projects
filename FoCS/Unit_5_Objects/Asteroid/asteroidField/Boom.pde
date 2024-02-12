class Boom
{
  private float x;
  private float y;
  private float size;
  private int timer;
  private int duration;

  Boom(float x, float y, float size, int duration)
  {
    this.x = x;
    this.y = y;
    this.size = size * random(0.5, 0.9);
    this.duration = (int)(duration * random(0.1, 3));
    timer = this.duration;
  }

  public void render()
  {
    noStroke();
    fill(255, random(0, 50), random(200, 255));
    ellipse(x, y, size, size);
  }

  public void update()
  {
    if (timer > 0)
    {
      timer--;
    } else 
    {
      die();
    }
  }


  public void die()
  {
    if (size > BOOM_MIN_SIZE)
    {
      for (int i = 0; i < BOOM_SPLIT; i++)
      {
        float newX = x + random(-size/2, size/2);
        float newY = y + random(-size/2, size/2);
        b.add(new Boom(newX, newY, size/BOOM_SPLIT, duration/2));
      }
    }
    size = 0;
  }
}
