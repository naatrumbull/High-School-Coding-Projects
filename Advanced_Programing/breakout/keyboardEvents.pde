boolean rightPressed = false;
boolean leftPressed = false;

void keyPressed()
{
  if(keyCode == RIGHT)
  {
    paddle.speedX = 10;
    rightPressed = true;
  }
  else if (keyCode == LEFT)
  {
    paddle.speedX = -10;
    leftPressed = true;
  }
  else if (keyCode == 32 && screenNumber != START_SCREEN_NUMBER)
  {
    if (ball.speedY == 0)
    {
      ball.speedY = BALL_SPEED;
      ball.speedX = random(-4, 4);
    }
  }
  else if (keyCode == 32 && screenNumber == END_SCREEN_NUMBER)
  {
    prepareLevel1();
  }
}

void keyReleased()
{
  if (keyCode == RIGHT)
  {
    rightPressed = false;
    if (leftPressed) paddle.speedX = -10;
  }
  else if (keyCode == LEFT)
  {
    leftPressed = false;
    if (rightPressed) paddle.speedX = 10;
  }
  if (!rightPressed && !leftPressed)
  {
    paddle.speedX = 0;
  }
}
