class Clean extends Robot // for "Clean"
{
  Clean()
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
    while(!isOnB()) //only run this code until I reach "B", then stop                                                                                                                                                
    {
      if(onBeeper()) //#1 check for beeper
      {
        while(onBeeper()) 
        {
          pickBeeper();
        }
      } 
      
      else if(!frontIsClear() && facingWest()) //#2 do I turn Left?
      {
        turnLeft();
        move();
        turnLeft();
      } 
      
      else if (!frontIsClear() && facingEast()) //#3 do I turn Right?
      {
        turnRight();
        move();
        turnRight();
      } 
      
      else // now that I've checked everything, just move forward
      {
      move();
      }
    }
  }

}
