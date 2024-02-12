/*
I completed the 2 player challenge!!!!
 
 Left Paddle is controlled with Up and Down keys.
 Right Paddle is controlled with mouse.
 */

float leftPaddleX;
float leftPaddleY;
float rightPaddleX;
float rightPaddleY;
float puckX;
float puckY;
float puckXSpeed;
float puckYSpeed;
int humanScore;
int cpuScore;

final int PADDLE_WIDTH = 30;
final int PADDLE_HEIGHT = 150;
final int PUCK_SIZE = 25;
final int WALL_HEIGHT = 15;
final int SCORE_FONT_SIZE = 50;
final int SCORE_OFFSET = 50;
final int PADDLE_SPEED = 10; //speed the left paddle goes at with up and down keys


void drawPaddles() //draws the paddles
{
  rect(leftPaddleX, leftPaddleY, PADDLE_WIDTH, PADDLE_HEIGHT); //left
  rect(rightPaddleX, rightPaddleY, PADDLE_WIDTH, PADDLE_HEIGHT); //right
}

void movePlayerPaddle() //what allows the mouse player to move.
{
  background(0);
  if (mouseY > height - PADDLE_HEIGHT / 2) //keeps the paddle from going off bottom screen
  {
    rightPaddleY = height - PADDLE_HEIGHT;
  } else if (mouseY < PADDLE_HEIGHT / 2) //keeps the paddle from going off the top of the screen
  {
    rightPaddleY = 0;
  } else 
  {
    rightPaddleY = mouseY - (PADDLE_HEIGHT / 2);
  }
}

void drawPuck() //draws a puck, really simple
{
  fill(255);
  rect(puckX, puckY, PUCK_SIZE, PUCK_SIZE);
}

void movePuck()  //moves the puck by changing its position based on the speed variables
{
  puckX += puckXSpeed;
  puckY += puckYSpeed;
}

void moveComputerPaddle() //AKA KEYBOARD(NO longer a computer I guess...)
{
  if (keyPressed) //the left paddle can only move if a key is pressed
  {
    if (keyCode == UP || key == 'w' || key == 'W') //allows paddle to go up
    {
      leftPaddleY -= PADDLE_SPEED;
    } else if (keyCode == DOWN || key == 's' || key == 'S') //allows paddle to go down
    {
      leftPaddleY += PADDLE_SPEED;
    }

    if (leftPaddleY < 0) //keeps paddle in the screen(top)
    {
      leftPaddleY = 0;
    } 
    if (leftPaddleY > height - PADDLE_HEIGHT) //also keeps paddle in the screen(bottom)
    {
      leftPaddleY = height - PADDLE_HEIGHT;
    }
  }
}


void bounceWalls() //changes the direction of the ball when it hits a wall, works at any size screen.
{
  if (puckX < 0)
  {
    puckXSpeed *= -1;
  } else if (puckX > width - PUCK_SIZE)
  {
    puckXSpeed *= -1;
  } else if (puckY < 0)
  {
    puckYSpeed *= -1;
  } else if (puckY > height - PUCK_SIZE)
  {
    puckYSpeed *= -1;
  }
}

void bounceLeftPaddle() //lets the ball bounce back when it hits the left paddle
{
  if (puckX < leftPaddleX + PADDLE_WIDTH && puckX + PUCK_SIZE > leftPaddleX && puckY + PUCK_SIZE > leftPaddleY && puckY < leftPaddleY + PADDLE_HEIGHT)
  {
    puckXSpeed *= -1;
    puckXSpeed++;
  }
}

void bounceRightPaddle() //lets the ball bounce back when it hits the right paddle
{
  if (puckX < rightPaddleX + PADDLE_WIDTH && puckX + PUCK_SIZE > rightPaddleX && puckY + PUCK_SIZE > rightPaddleY && puckY < rightPaddleY + PADDLE_HEIGHT)
  {
    puckXSpeed *= -1;
    puckXSpeed--;
  }
}

void checkBoundary() // resets the game when the puck hits the left or right wall
{
  if (puckX < 0 || puckX > width - PUCK_SIZE)
  {
    if (puckX < 0)
    {
      cpuScore++;
    } else if (puckX > width - PUCK_SIZE)
    {
      humanScore++;
    }
    puckX = width/2;
    puckY = height/2;
    puckXSpeed = random(-5, 5);
    puckYSpeed = random(-5, 5);
  }
}

void displayScore() //shows the score for left and right paddles
{

  text(humanScore, (width/2) - width/5, SCORE_OFFSET); //left side
  text(cpuScore, (width/2) + width/5, SCORE_OFFSET); //right side
}

void update() //calls various methods
{
  movePlayerPaddle();
  moveComputerPaddle();
  movePuck();
  bounceWalls();
  bounceLeftPaddle();
  bounceRightPaddle();
  checkBoundary();
}

void drawWalls() //draws the center wall with a for loop
{
  for (int y = 75; y < height; y += 50)
  {
    rect((width/2) - WALL_HEIGHT/2, y, WALL_HEIGHT, WALL_HEIGHT);
  }
}

void render() //calls more methods
{
  drawPaddles();
  drawWalls();
  drawPuck();
  displayScore();
}

void setup()
{
  fullScreen();

  background(0);
  fill(255);
  noStroke();
  noCursor();
  textAlign(CENTER);
  textSize(SCORE_FONT_SIZE);

  //initial variable values
  leftPaddleY = height/2 - PADDLE_HEIGHT/2; 
  rightPaddleY = height/2 - PADDLE_HEIGHT/2; 
  leftPaddleX = 30; 
  rightPaddleX = width - 60 - PADDLE_WIDTH; 
  puckX = width/2 - PUCK_SIZE/2;
  puckY = height/2 - PUCK_SIZE/2;
  puckXSpeed = random(-5, 5);
  puckYSpeed = random(-5, 5);
  humanScore = 0;
  cpuScore = 0;
}

void draw() //Don't put anything else in draw!
{
  update();
  render();
}
