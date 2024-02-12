//I completed the Challenge!!!


//RED BALL
float xPos;
float yPos;
int ballSize;
float xSpeed;
float ySpeed;
int numHitWall;

//GREEN BALL
float xPosG;
float yPosG;
int ballSizeG;
float xSpeedG;
float ySpeedG;
int numHitWallG;

void setup()
{
  size(800, 800);
  frameRate(300);
  
  //Red Ball
  xPos = width/2;
  yPos = height/2;
  xSpeed = random(-2, 2);
  ySpeed = random(-2, 2);
  ballSize = (int)random(10, 110);
  numHitWall = 0;
  
  //Green Ball
  xPosG = width/2;
  yPosG = height/2;
  xSpeedG = random(-2, 2);
  ySpeedG = random(-2, 2);
  ballSizeG = (int)random(10, 110);
  numHitWallG = 0;
}

void redBall()
{
  xPos += xSpeed;
  yPos += ySpeed;
  
  fill(255, 0, 0);
  ellipse(xPos, yPos, ballSize, ballSize);
  
  if(xSpeed > 0 && xPos > width - ballSize/2) 
  {
    numHitWall++;
    xSpeed *= -1;
    xSpeed -= 1;
    println("Karel, the Red ball hit the wall " + numHitWall + " times.");
  }
  else if(ySpeed > 0 && yPos > height - ballSize/2)
  {
    numHitWall++;
    ySpeed *= -1;
    ySpeed -= 1;
    println("Karel, the Red ball hit the wall " + numHitWall + " times.");
  }  
  else if(xSpeed < 0 && xPos < 0 + ballSize/2)
  {
    numHitWall++;
    xSpeed *= -1;
    xSpeed += 1;
    println("Karel, the Red ball hit the wall " + numHitWall + " times.");
  }
  else if(ySpeed < 0 && yPos < 0 + ballSize/2)
  {
    numHitWall++;
    ySpeed *= -1;
    ySpeed += 1;
    println("Karel, the Red ball hit the wall " + numHitWall + " times.");
  }
}

void greenBall()
{
  xPosG += xSpeedG;
  yPosG += ySpeedG;
  
  fill(0, 255, 0);
  ellipse(xPosG, yPosG, ballSizeG, ballSizeG);
  
  if(xSpeedG > 0 && xPosG > width - ballSizeG/2) 
  {
    numHitWallG++;
    xSpeedG *= -1;
    xSpeedG -= 1;
    println("Karel, the Green Ball hit the wall " + numHitWallG + " times.");
  }
  else if(ySpeedG > 0 && yPosG > height - ballSizeG/2)
  {
    numHitWallG++;
    ySpeedG *= -1;
    ySpeedG -= 1;
    println("Karel, the Green ball hit the wall " + numHitWallG + " times.");
  }  
  else if(xSpeedG < 0 && xPosG < 0 + ballSizeG/2)
  {
    numHitWallG++;
    xSpeedG *= -1;
    xSpeedG += 1;
    println("Karel, the Green ball hit the wall " + numHitWallG + " times.");
  }
  else if(ySpeedG < 0 && yPosG < 0 + ballSizeG/2)
  {
    numHitWallG++;
    ySpeedG *= -1;
    ySpeedG += 1;
    println("Karel, the Green ball hit the wall " + numHitWallG + " times.");
  }
}

void draw()
{
  
  if(numHitWall < 25 && numHitWallG < 25)
  {
    background(15, 229, 255);
    redBall();
    greenBall();
  }
  else
  {
    if(numHitWall == 25)
    {
      fill(0);
      textSize(width/20);
      text("Red Ball Wins!!!", width/3, height/3);
      println("Red Ball Wins!!!!!");
      numHitWall++;
    }
    else if(numHitWallG == 25)
    {
      fill(0);
      textSize(width/20);
      text("Green Ball Wins!!!", width/3, height/3);
      println("Green Ball Wins!!!!!");
      numHitWallG++;
    }
  }
  
  
  
}
