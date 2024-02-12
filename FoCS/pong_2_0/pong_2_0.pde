final int PUCK_WIDTH = 15;
final int PADDLE_HEIGHT = 120;
final int PADDLE_WIDTH = 25;
final int TEXT_FONT_SIZE = 80;
final int PADDLE_SPEED = 10;
final int PUCK_SIZE = 40;
final int SCORE_OFFSET = 80;

float leftPaddleX;
float leftPaddleY;
float rightPaddleX;
float rightPaddleY;
float puckX;
float puckY;
float puckSpeedX;
float puckSpeedY;
int mouseScore;
int keyScore;


void setup()
{
  fullScreen();

  fill(255);
  background(0);
  textAlign(CENTER);
  textSize(TEXT_FONT_SIZE);
  noStroke();

  leftPaddleX = 30;
  leftPaddleY = height/2 - PADDLE_HEIGHT/2;
  rightPaddleX = width - PADDLE_WIDTH - 30;
  rightPaddleY = mouseY - PADDLE_HEIGHT/2;
  puckX = width/2 - PUCK_SIZE/2;
  puckY = height/2 - PUCK_SIZE/2;
  puckSpeedX = random(-5, 5);
  puckSpeedY = random(-5, 5);
  mouseScore = 0;
  keyScore = 0;
}

void draw()
{
  background(0); 
  
  //moves puck
  puckX += puckSpeedX;
  puckY += puckSpeedY;
  
  //moves the puck when it hits a wall
  if (puckY < 0)
  {
    puckSpeedY *= -1;
  } else if(puckY > height - PUCK_SIZE)
  {
    puckSpeedY *= -1;
  } else if(puckX < 0)
  {
    puckSpeedX = random(-5, 5);
    puckSpeedY = random(-5, 5);
    puckX = width/2 - PUCK_SIZE/2;
    puckY = height/2 - PUCK_SIZE/2;
    mouseScore++;
  }
  else if(puckX > width - PUCK_SIZE)
  {
    puckSpeedX = random(-5, 5);
    puckSpeedY = random(-5, 5);
    puckX = width/2 - PUCK_SIZE/2;
    puckY = height/2 - PUCK_SIZE/2;
    keyScore++;
  }
  
  //allows puck to bounce off left paddle
  if(puckX < leftPaddleX + PADDLE_WIDTH && puckX + PUCK_SIZE > leftPaddleX && puckY + PUCK_SIZE > leftPaddleY && puckY < leftPaddleY + PADDLE_HEIGHT)
  {
    puckSpeedX *= -1;
    puckSpeedX++;
  }
  
  //allosw puck to bounce off right paddle
  if(puckX < rightPaddleX + PADDLE_WIDTH && puckX + PUCK_SIZE > rightPaddleX && puckY + PUCK_SIZE > rightPaddleY && puckY < rightPaddleY + PADDLE_HEIGHT)
  {
    puckSpeedX *= -1;
    puckSpeedX--;
  }
  
  //gives control for right paddle
  if(mouseY < PADDLE_HEIGHT/2)
  {
    rightPaddleY = 0;
  } else if (mouseY > height - PADDLE_HEIGHT/2)
  {
    rightPaddleY = height - PADDLE_HEIGHT;
  } else 
  {
    rightPaddleY = mouseY - PADDLE_HEIGHT/2;
  }
  
  //gives control for left paddle
  if(keyPressed)
  {
    if(leftPaddleY < 0)
    {
      leftPaddleY = 0;
    } else if(leftPaddleY > height - PADDLE_HEIGHT)
    {
      leftPaddleY = height - PADDLE_HEIGHT;
    }
    
    if(keyCode == UP)
    {
      leftPaddleY -= PADDLE_SPEED;
    } else if (keyCode == DOWN)
    {
      leftPaddleY += PADDLE_SPEED;
    }
  }
  
  //paddle
  rect(leftPaddleX, leftPaddleY, PADDLE_WIDTH, PADDLE_HEIGHT); //key controlled paddle
  rect(rightPaddleX, rightPaddleY, PADDLE_WIDTH, PADDLE_HEIGHT); //mouse controlled paddle
 
  //puck
  rect(puckX, puckY, PUCK_SIZE, PUCK_SIZE);
  
  //scores
  text(keyScore, width/2 - width/5, SCORE_OFFSET);
  text(mouseScore, width/2 + width/5, SCORE_OFFSET);
}
