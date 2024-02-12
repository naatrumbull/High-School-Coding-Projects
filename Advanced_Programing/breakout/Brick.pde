class Brick
{
  float x;
  float y;
  final int BRICK_WIDTH = 50;
  final int BRICK_HEIGHT = 20;
  color clr;
  int value = 50;
  boolean isSpecial;
  int rand;
  
  Brick(float x, float y, color clr, int value, boolean isSpecial)
  {
    this.x = x - BRICK_WIDTH/2;
    this.y = y;
    this.clr = clr; 
    this.value = value;
    this.isSpecial = isSpecial; 
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y);
    stroke(200);
    fill(clr);
    rect(0, 0, BRICK_WIDTH, BRICK_HEIGHT);
    popMatrix();
    checkCollisions();
  }
  
  void checkCollisions()
  {
    if(this.top() < ball.bottom() && this.bottom() > ball.top() && this.right() > ball.left() && this.left() < ball.right())
    {
      ball.bounceOffTop();
      ball.x += ball.speedX;
      bricks.remove(this);
      score += value;
      if(score > highScore) highScore = score;
      checkSpecial();
      
      for(int i = 0; i < 30; i++)
      {
        if(isSpecial)
        {
          brickPart.add(new Particle(x, y, 0, 255, 0));
        }
        else
        {
          brickPart.add(new Particle(x, y, 150, 0, 0)); 
        } 
      }
      
      
    }
  }
  
  void checkSpecial()
  {
    rand = (int)random(0, 3);
    if (isSpecial)
    {
      if (rand == 0) 
      {
        bonusPaddle();
        print("Large Paddle");
      }
      else if (rand == 1) 
      {
        bonusSlowBall();
        print("Slow Paddle");
      }
      else if (rand == 2) 
      {
        bonusNewLife();
        print("New Life");
      }
    }
  
  }
  
  void bonusPaddle()
  {
    paddle.w *= 2;
  }
  
  void bonusSlowBall()
  {
    ball.speedY *= 0.6;
    ball.speedX *= 0.6;
  }
  
  void bonusNewLife()
  {
    if (lives.size() < 8)
    {
      lives.add(new Lives());
    }
  }
  
  float left()
  {
    return x;
  }
  
  float right()
  {
    return x + BRICK_WIDTH;
  }
  
  float top() 
  {
    return y;
  }
  
  float bottom()
  {
    return y + BRICK_HEIGHT;
  }
}
