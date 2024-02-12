void displayStats()
{
  fill(255);

  text("Score: " + hero.score, width - 150, 15);
  text("Level " + levelNumber, width - 300, 15);
  text("Health: ", 45, 23);
  text("Charge\nMeter:", 45, 160);
  

  fill(255, 0, 0);
  rect(25, 200, 40, 90);
  
  bonusBar.drawObject();
}

class Lives extends GameObject
{
  Lives(float x, float y, float w, float h, color bgColor)
  {
    super(x, y, w, h, bgColor);
    showBox = false;
    fillBox = false;
  }

  void avatar()
  {
    image(heart, x - 15, y - 15, 30, 30);
  }
}

void removeLives(int numLives)
{
  if (hero.isDefending == false)
  {
    for (int i = 0; i < numLives; i++)
    {
      if (lives.size() != 0)
      {

        Lives b = lives.get(lives.size() - 1);
        lives.remove(b);
      }

      if (lives.size() == 0)
      {
        prepareLoseScreen();
      }
    }
  }
}
