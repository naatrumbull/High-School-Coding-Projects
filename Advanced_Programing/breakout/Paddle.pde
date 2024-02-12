class Paddle
{
  float x;
  float y;
  float w = 90;
  float h = 20;
  float speedX = 0;
  
  Paddle(float x, float y)
  {
    this.x = x - w/2;
    this.y = y;
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y);
    fill(180);
    rect(0, 0, w, h);
    popMatrix();
    move();
  }
  
  void move()
  {
    if(x + speedX > 0 && x + w + speedX < width)
    {
      x += speedX;
    } 
    else if (x + w > width)
    {
      x = width - w;
    }
    else if (x < 0)
    {
      x = 0;
    }
  }
  
  float left()
  {
    return x;
  }
  
  float right()
  {
    return x + w;
  }
  
  float top() 
  {
    return y;
  }
  
  float bottom()
  {
    return y + h;
  }
  
}
