class Harvesty extends Robot // for harvest #2
{
  Harvesty()
  {
    super();  
    style();
  }

  void style()
  {
    setLetter('H');
    setColorPrimary(DARK_BLUE);
    setColorSecondary(YELLOW_DARK);
    setColorBorder(GREY);
  }
  
  void turnRight() 
  {
    turnLeft();
    turnLeft();
    turnLeft();
  }
    
  void row() 
  {
    for(int i = 0; i < 23; i++) 
    {
      move();
      if(onBeeper()) 
      {
        pickBeeper();
      }
    }
    
  }
  
  void cornerLeft()
  {
    turnLeft();
    move();
    turnLeft();
  }
  
  void cornerRight()
  {
    turnRight();
    move();
    turnRight();
  }
  
  void go()
  {
    
    move();
    for(int i = 0; i < 6; i++) 
    {
      row();
      cornerLeft();
      row();
      cornerRight();
    }
    turnLeft();
    turnLeft();
    move();
    turnLeft();
    move();
    //24 lines of code!! Yeah!
  }

}
