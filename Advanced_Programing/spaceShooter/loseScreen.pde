


void prepareLoseScreen()
{

  scene = 100;
}



void lose()
{
  background(0);

  fill(255);
  textFont(createFont("GodOfWar", 60));
  text("Game Over", width/2, height/3);
  textFont(createFont("serif", 12));


  btnPlayAgain.drawButton();
}

void reset()
{
  hero.x = width/2;
  hero.y = height - 100;
  timer = 0;
  hero.score = 0;
  hero.isPoweredUp = false;
  hero.isDefending = false;
  hero.isDefendingTimer = 600;
  hero.isPoweredUpTimer = 300;
  for (GameObject obj : objects)
  {
    if (obj instanceof PowerUp)
    {
      trash.add(obj);
    }

    if (obj instanceof Enemy)
    {
      trash.add(obj);
    }

    if (obj instanceof Bullet)
    {
      trash.add(obj);
    }

    if (obj instanceof Stars)
    {
      trash.add(obj);
    }
  }

  lives.clear();
  emptyTrash();
}
