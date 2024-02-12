void mousePressed()
{
  if (btnStart.mouseOver() && btnStart.title == "Start")
  {
    btnStart.title = "Clicked";
  }
  else if (btnStart.mouseOver() && btnStart.title == "Clicked")
  {
    btnStart.title = "Start";
  }
}
