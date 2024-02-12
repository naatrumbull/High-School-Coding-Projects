//I worked independently for the entirety of this project. 
//I wrote all of the code by myself. I did not borrow code from anybody else.
//The Code for "Wall Ball":

/**** START OF ALL OF THE CONSTANT VARIABLES FOR THIS PROGRAM *****/

//Constant Variables for the Game Screen:
final int PUCK_SIZE = 30;
final int BLOCK_WIDTH = 80;
final int BLOCK_HEIGHT = 20;
final int BLOCK_STARTING_POS_X = 500;
final int BLOCK_STARTING_POS_Y = 560;
final int SCORE_PLACEMENT_X = 600;
final int HIGHSCORE_PLACEMENT_X = 800;
final int SCORE_PLACEMENT_Y = 50;
final int BAR_Y = 115;
final int BAR_HEIGHT = 10;
final int NUM_DOTS = 100; //number of dots that try to block the the screen.

//Constant Variables for the Home Screen:
final int HS_BUTTON_X = 300; // for both
final int HS_BUTTON_WIDTH = 400; // "
final int HS_BUTTON_HEIGHT = 150; // "
final int HS_BUTTON_Y_TOP = 550; // for top button only
final int HS_BUTTON_Y_BOTTOM = 750; // for button button only
final int BLANK_BOX_X = 50;
final int BLANK_BOX_Y = 50;
final int BLANK_BOX_WIDTH = 900;
final int BLANK_BOX_HEIGHT = 400;
final int PADDLE_Y = 400;

//Constant Variables for Instructions
final int I_BUTTON_LEFT_X = 50; 
final int I_BUTTON_RIGHT_X = 550;
final int I_BUTTON_Y = 700;
final int I_BUTTON_WIDTH = 400;
final int I_BUTTON_HEIGHT = 250;
final int I_TEXT_Y = 60; 

//Constant Variables for Game Over Screen
final int FINAL_SCORE_Y = 200;
final int FINAL_HIGHSCORE_Y = 500;

/**** END OF ALL OF THE CONSTANT VARIABLES FOR THIS PROGRAM *****/





/**** START OF ALL OF THE OTHER VARIABLES FOR THIS PROGRAM *****/

//Constant Variables for Game Over Screen
int timer = 0; //used to make sure that two buttons are not clicked on in rapid succession

//Variables for the Game Screen
int blockX; //
int blockY;
float puckSpeedX;
float puckSpeedY;
float puckX;
float puckY;
int score;
int highScore;
//these arrays store information for the dots that block the screen on while playing wall ball
float[] dotsX = new float [NUM_DOTS]; 
float[] dotsY = new float [NUM_DOTS];
float[] dotsXSpeed = new float [NUM_DOTS];
float[] dotsYSpeed = new float [NUM_DOTS];
float[] dotsSize = new float [NUM_DOTS];

//Variables for the Home Screen
float puckXAnimation;
float puckYAnimation;
float puckXSpeedAnimation;
float puckYSpeedAnimation;
float paddleX;



String screen; /* stores a string that determines which screen will be shown:
FOR EXAMPLE:
- "gameScreen" will load the game screen
- "homeScreen" will load the home screen
- "gameOverScreen" will load the game over screen
- "instructions" will load the instructions screen
*/

/**** END OF ALL OF THE OTHER VARIABLES FOR THIS PROGRAM *****/

void setup()
{
  size(1000, 1000);
  noStroke();

  puckSpeedX = random(-5, 5);
  puckSpeedY = random(-5, 5);
  blockX = (int)(mouseX - (0.5 * BLOCK_WIDTH));
  blockY = height - BLOCK_HEIGHT - 20;
  puckX = BLOCK_STARTING_POS_X;
  puckY = BLOCK_STARTING_POS_Y;
  score = 0;
  highScore = 0;
  screen = "homeScreen"; //will load the home screen when initially run
  puckXAnimation = ((BLANK_BOX_X + BLANK_BOX_WIDTH) / 2);
  puckYAnimation = ((BLANK_BOX_Y + BLANK_BOX_HEIGHT) / 2);
  puckXSpeedAnimation = random(-10, 10);
  puckYSpeedAnimation = random(-10, 10);

  //initializes all of the values for all of these arrays
  for (int i = 0; i < NUM_DOTS; i++)
  {
    dotsSize[i] = 2;
    dotsX[i] = random(dotsSize[i] * 0.5, width - (dotsSize[i] * 0.5));
    dotsY[i] = random(dotsSize[i] * 0.5 + (BAR_Y + BAR_HEIGHT), height - (dotsSize[i] * 0.5));
    dotsXSpeed[i] = random(-10, 10);
    dotsYSpeed[i] = random(-10, 10);
  }
}

void draw()
{
  /*
  Calling this function runs the game! Whatever string that 
  "screen" gets will determine the screen that is drawn
  */
  displayScreen(screen);
}

/*
This function determines which functions to call based on what the parameter currentScreen gets. 
The string variable "screen" gets passed into this parameter when this function is called
This function also serves to make sure that only one screen is being displayed at a time
*/
void displayScreen(String currentScreen)
{
  background(255);
  if (currentScreen == "gameScreen")
  {
    noCursor();
    updateGameScreen();
    renderGameScreen();
  } 
  else if (currentScreen == "homeScreen")
  {
    cursor();
    updateHomeScreenAnimation();
    drawHomeScreenAnimation();
    homeScreenButtons();
  } 
  else if (currentScreen == "gameOverScreen")
  {
    cursor();
    gameOverButtons();
    displayFinalScore();
  } 
  else if (currentScreen == "instructions")
  {
    cursor();
    instructionButtons();
    displayInstructionsText();
  }
}

/*
This abstraction allows me to efficiently create new 
buttons and choose what screen they take you to when they are clicked.
*/
void button(int x, int y, int bWidth, int bHeight, String pickScreen)
{
  if (mouseX > x && mouseX < x + bWidth && mouseY > y && mouseY < y + bHeight)
  {
    fill(125);
    if (mousePressed && timer == 0)
    {
      screen = pickScreen; 
      if(pickScreen == "gameScreen") 
      {
        reset();
      }
      timer = 30;
    }
  } 
  else
  {
    if (timer > 0)
    {
      timer--;
    }
    fill(0);
  }
  rect(x, y, bWidth, bHeight);
}

//buttons that will be drawn on the home screen
void homeScreenButtons()
{
  //Play Game Button
  button(HS_BUTTON_X, HS_BUTTON_Y_TOP, HS_BUTTON_WIDTH, HS_BUTTON_HEIGHT, "gameScreen"); 
  
  //Go to Instructins Button
  button(HS_BUTTON_X, HS_BUTTON_Y_BOTTOM, HS_BUTTON_WIDTH, HS_BUTTON_HEIGHT, "instructions"); 
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(createFont("impact", 50));
  text("Start Game", HS_BUTTON_X + (0.5 * HS_BUTTON_WIDTH), HS_BUTTON_Y_TOP + (0.5 * HS_BUTTON_HEIGHT));
  text("How to Play", HS_BUTTON_X + (0.5 * HS_BUTTON_WIDTH), HS_BUTTON_Y_BOTTOM + (0.5 * HS_BUTTON_HEIGHT));
}

//buttons that will be drawn on the instruction screen
void instructionButtons()
{
  //back button
  button(I_BUTTON_LEFT_X, I_BUTTON_Y, I_BUTTON_WIDTH, I_BUTTON_HEIGHT, "homeScreen");
  
  //start playing button
  button(I_BUTTON_RIGHT_X, I_BUTTON_Y, I_BUTTON_WIDTH, I_BUTTON_HEIGHT, "gameScreen");
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(createFont("impact", 50));
  text("Back", I_BUTTON_LEFT_X + (0.5 * I_BUTTON_WIDTH), I_BUTTON_Y + (0.5 * I_BUTTON_HEIGHT));
  text("Start Game", I_BUTTON_RIGHT_X + (0.5 * I_BUTTON_WIDTH), I_BUTTON_Y + (0.5 * I_BUTTON_HEIGHT));
}

//buttons that will be drawn on the game over screen
void gameOverButtons()
{
  //back button
  button(I_BUTTON_LEFT_X, I_BUTTON_Y, I_BUTTON_WIDTH, I_BUTTON_HEIGHT, "homeScreen");
  
  //start playing button
  button(I_BUTTON_RIGHT_X, I_BUTTON_Y, I_BUTTON_WIDTH, I_BUTTON_HEIGHT, "gameScreen");
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(createFont("impact", 50));
  text("Home Screen", I_BUTTON_LEFT_X + (0.5 * I_BUTTON_WIDTH), I_BUTTON_Y + (0.5 * I_BUTTON_HEIGHT));
  text("Start Game", I_BUTTON_RIGHT_X + (0.5 * I_BUTTON_WIDTH), I_BUTTON_Y + (0.5 * I_BUTTON_HEIGHT));
}






/********************Start of Home Screen Functions*****************/
//draws the title
void drawTitle()
{
  fill(100);
  textAlign(CENTER, CENTER);
  textFont(createFont("GodOfWar", 150));
  text("Wall\nBall", width/2, (BLANK_BOX_Y + BLANK_BOX_HEIGHT) / 2);
}

//A function to update all the variables needed to run the animation
void updateHomeScreenAnimation()
{
  //moves the puck 
  puckXAnimation += puckXSpeedAnimation;
  puckYAnimation += puckYSpeedAnimation;

  //makes the puck bounce off walls and paddle
  if (puckXAnimation + PUCK_SIZE > BLANK_BOX_X + BLANK_BOX_WIDTH || puckXAnimation < BLANK_BOX_X)
  {
    puckXSpeedAnimation *= -1;
  }

  if (puckYAnimation < BLANK_BOX_Y || puckYAnimation + PUCK_SIZE > PADDLE_Y)
  {
    puckYSpeedAnimation *= -1;
  }

  //keeps the paddle from going outside the box
  paddleX = (puckXAnimation - (0.5 * BLOCK_WIDTH)) + (0.5 * PUCK_SIZE);

  if (paddleX < BLANK_BOX_X)
  {
    paddleX = BLANK_BOX_X;
  } else if (paddleX + BLOCK_WIDTH > BLANK_BOX_X + BLANK_BOX_WIDTH)  
  {
    paddleX = BLANK_BOX_X + BLANK_BOX_WIDTH - BLOCK_WIDTH;
  }
}

//uses the data created from updateHomeScreenAnimation() to draw the animation
void drawHomeScreenAnimation()
{
  //draws the empty box
  noFill();
  stroke(0);
  strokeWeight(10);
  rect(BLANK_BOX_X, BLANK_BOX_Y, BLANK_BOX_WIDTH, BLANK_BOX_HEIGHT);

  //draw puck
  noStroke();
  fill(0);
  rect(puckXAnimation, puckYAnimation, PUCK_SIZE, PUCK_SIZE);

  //draws paddle
  fill(0);
  rect(paddleX, PADDLE_Y, BLOCK_WIDTH, BLOCK_HEIGHT);

  drawTitle();
}
/******************End of the Home Screen Functions*************/





/***********Start of Instruction Screen Functions*******************/
//writes out the instructions on the instruction screen
void displayInstructionsText()
{
  fill(0);
  textAlign(CENTER, CENTER);
  textFont(createFont("serif", 50));
  text("How to Play Wall Ball:", width/2, I_TEXT_Y);
  text("1: Use the mouse to control the paddle\nat the bottom of the screen.", width/2, I_TEXT_Y + 100);
  text("2. Use the paddle to hit the puck away from you.", width/2, I_TEXT_Y + 220);
  text("3. As the game goes on, your vision\nwill get start to get fuzzier!", width/2, I_TEXT_Y + 340);
  text("4. You get 1 point every time you hit the puck.", width/2, I_TEXT_Y + 460);
  text("Try to beat your highscore!", width/2, I_TEXT_Y + 560);
  
}
/************End of Instruction Screen Functions**************/





/******************Start of the game over screen functions*************/
//writes out the score and highscore on the game over screen
void displayFinalScore()
{
  fill(0);
  textAlign(CENTER, CENTER);
  textFont(createFont("impact", 100));
  text("Final Score:\n" + score, width/2, FINAL_SCORE_Y);
  text("High Score:\n" + highScore, width/2, FINAL_HIGHSCORE_Y);
}
/******************End of the game over screen functions*************/





/******************Start of the game screen functions*************/
/*
This function updates every 
variable needed on the game screen 
by calling many functions
*/
void updateGameScreen()
{
  movePlayer();
  bounceDots();
  updatePuckSpeed();
  movePuck();
  bouncePuckOffPaddle();
  updateHighScore();
  endGame();
  updateDots();
}

//the function that will draw everything on the game screen
void renderGameScreen()
{
  drawPuck();
  drawDots();
  drawPlayer();
  displayScore();
  drawBar();
}

/*
moves the dots based on the values of dotsXSpeed[] and dotsYSpeed[]. 
Each dot has a corresponding x and y speed in these arrays
*/
void updateDots()
{
  for (int i = 0; i < NUM_DOTS; i++)
  {
    dotsX[i] += dotsXSpeed[i];
    dotsY[i] += dotsYSpeed[i];
  }
}

//makes the dots bounce off of the edges of the screen
void bounceDots()
{
  for (int i = 0; i < NUM_DOTS; i++)
  {
    if (dotsX[i] - dotsSize[i] < 0 || dotsX[i] + dotsSize[i] > width)
    {
      dotsXSpeed[i] *= -1;
    }

    if (dotsY[i] - dotsSize[i] < BAR_Y + BAR_HEIGHT || dotsY[i] + dotsSize[i] > height)
    {
      dotsYSpeed[i] *= -1;
    }
  }
}

//displays the dots onto the screen
void drawDots()
{
  for (int i = 0; i < NUM_DOTS; i++)
  {
    fill(30);
    ellipse(dotsX[i], dotsY[i], dotsSize[i], dotsSize[i]);
  }
}

//moves the paddle based on mouseX and keeps the the paddle on the screen
void movePlayer()
{
  blockX = (int)(mouseX - (0.5 * BLOCK_WIDTH));

  if (blockX < 0)
  {
    blockX = 0;
  } else if (blockX > width - BLOCK_WIDTH)
  {
    blockX = width - BLOCK_WIDTH;
  }
}

//displays the paddle
void drawPlayer()
{
  fill(0);
  rect(blockX, blockY, BLOCK_WIDTH, BLOCK_HEIGHT);
}

/*
resets the game by resetting a lot of differnent variables 
to their default values. Is only called when a button 
that takes a player to the game screen is clicked
*/
void reset()
{
  puckY = BLOCK_STARTING_POS_Y;
  puckX = BLOCK_STARTING_POS_X;
  puckSpeedX = random(-5, 5);
  puckSpeedY = random(-5, 5);
  score = 0;
  for (int i = 0; i < NUM_DOTS; i++)
  {
    dotsSize[i] = 2;
  }
  
}

//if the puck hits the bottom of the screen
void endGame()
{
  if (puckY + PUCK_SIZE > height)
  {
    screen = "gameOverScreen";
  }
}

//changes the speed of the puck when it hits a wall
void updatePuckSpeed()
{
  if (puckX > width - PUCK_SIZE || puckX < 0)
  {
    puckSpeedX *= -1;
  }

  if (puckY < BAR_Y + BAR_HEIGHT)
  {
    puckSpeedY*= -1;
  }
}

//makes the puck bounce off of the paddle
void bouncePuckOffPaddle()
{
  if (puckY + PUCK_SIZE > blockY && puckY < blockY + BLOCK_HEIGHT && puckX + PUCK_SIZE > blockX && puckX < blockX + BLOCK_WIDTH)
  {
    puckSpeedY *= -1;
    puckSpeedY--;
    score++;
    for (int i = 0; i < NUM_DOTS; i++)
    {
      dotsSize[i]++;
    }
  }
}

//moves the puck based upon the values of puckSpeedX and puckSpeedY
void movePuck()
{
  puckX += puckSpeedX;
  puckY += puckSpeedY;
}

//if the score exceeds the highscore then change highscore
void updateHighScore()
{
  if (score > highScore)
  {
    highScore = score;
  }
}

//writes the score to the top right hand corner of the screen
void displayScore()
{
  fill(30);
  textAlign(LEFT);
  textFont(createFont("impact", 30));
  text("Score\n" + score, SCORE_PLACEMENT_X, SCORE_PLACEMENT_Y);
  text("Highscore\n" + highScore, HIGHSCORE_PLACEMENT_X, SCORE_PLACEMENT_Y);
}

//draws a bar that separates the top part of the screen from the bottom part of the screen
void drawBar()
{
  fill(0);
  rect(0, BAR_Y, width, BAR_HEIGHT);
}

//draws the puck using the variables puckX, puckY, which are definied in movePuck()
void drawPuck()
{
  fill(0);
  rect(puckX, puckY, PUCK_SIZE, PUCK_SIZE);
}
/***************End of the Game Screen Functions******************/
