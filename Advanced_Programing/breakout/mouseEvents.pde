void mousePressed()
{
  if(screenNumber == START_SCREEN_NUMBER)
  {
    if(btnPlay.mouseOver()) prepareLevel1();
  }
  else if(screenNumber == END_SCREEN_NUMBER)
  {
    if (backToHomeScreen.mouseOver()) prepareStartScreen();
  }
}
