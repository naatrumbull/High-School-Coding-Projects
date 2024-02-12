void prepareWinScreen()
{
  scene = 99;
}

void win()
{
  background(255, 255, 0);
  text("You Win!", width/2, height/2);
  
  btnPlayAgain.drawButton();
}

boolean hasWon()
{
  for(GameObject obj: objects)
  {
    if(obj instanceof Enemy || obj instanceof Bullet)
    {
      return false;
    }
  }
  
  return true;
}
