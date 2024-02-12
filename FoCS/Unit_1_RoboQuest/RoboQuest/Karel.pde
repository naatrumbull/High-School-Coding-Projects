class Karel extends Robot // example code
{
  Karel()
  {
    super();  
    style();
  }

  void style()
  {
    setLetter('K');
    setColorPrimary(YELLOW);
    setColorSecondary(RED);
    setColorBorder(GREEN_DARK);
  }
  
  void turnRight() 
  {
    turnLeft();
    turnLeft();
    turnLeft();
  }
  
  void go()
  {
    
  }

}
