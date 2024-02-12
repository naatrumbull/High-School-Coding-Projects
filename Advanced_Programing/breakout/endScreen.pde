int score = 0;
int highScore = 0;
Button backToHomeScreen;

void prepareEndScreen()
{
  backToHomeScreen = new Button(width/2, height * 0.85, 100, 30, "Play Again");
  screenNumber = END_SCREEN_NUMBER;
}

void endScreen()
{
  background(0);
  
  setText();
  backToHomeScreen.drawButton();
}

void setText()
{
  textFont(createFont("GodOfWar", 70));
  fill(255);
  textAlign(CENTER);
  text("Game Over", width/2, height * 0.25);
  textSize(40);
  text("Final Score\n" + score, width/2, height * .4);
  text("High Score\n" + highScore, width/2, height * 0.60);
  textFont(createFont("Serif", 12));
  textAlign(LEFT);
}
