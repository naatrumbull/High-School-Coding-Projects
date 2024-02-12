class Ball
{
  float x = width/2;
  float y = height * .33;
  float w = 15;
  float h = 15;
  float speedX = 0;
  float speedY = 0;
  
  Ball(float x, float y, float speed)
  {
    this.x = x;
    this.y = y;
    this.speedY = speed;
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y);
    fill(0, 100, 255);
    ellipse(0, 0, w, h);
    popMatrix();
    move();
  }
  
  void move()
  {
    y += speedY;
    x += speedX;
    
    if (y <= 0)
    {
      bounceOffTop();
    }
    if (x <= 0 || x >= width)
    {
      bounceOffSides();
    }
    if (y > height)
    {
      x = width/2;
      y = height/2;
      
      speedX = 0;
      speedY = 0;
      
      
      if(lives.size() > 0)
      {
        lives.remove(lives.size() - 1);
        paddle.w = 90;
      }
      else
      {
        prepareEndScreen();
      }
      
    }  
    
    checkCollision();
    
  }
  
  void bounceOffTop()
  {
    float variation = random(-3, 3);
    speedY *= -1;
    y+=speedY + variation;
  }
  
  void bounceOffSides()
  {
    float variation = random(-3, 3);
    speedX *= -1;
    x += speedX + variation;
  }
  
  void checkCollision()
  {
    if (this.top() < paddle.bottom() && this.bottom() > paddle.top() && this.right() > paddle.left() && this.left() < paddle.right())
    {
      this.bounceOffTop();
      
      float variation = random(-1, 1);
      if (paddle.speedX > 0)
      {
        variation += 2;
      }
      else if (paddle.speedX < 0)
      {
        variation -= 2;
      }
      
      speedX += variation;
      if (speedX > 10)
      {
        speedX = 10;
      }
      if(speedX < -10)
      {
        speedX = -10;
      }
      x += speedX;
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
