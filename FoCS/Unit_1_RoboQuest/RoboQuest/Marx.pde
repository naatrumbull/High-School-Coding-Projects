class Marx extends Robot // example code
{
  Marx()
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
    
    while(!isOnA()) 
    {
      if(!onBeeper() && !isOnB() && !isOnA()) //If there is not a Beeper, put beeper down! (Unless you're on A or B)
      {
        putBeeper();
      }
      
      else if(facingEast() && !frontIsClear()) //do I turn Left
      {
        turnLeft();                                                                                                                                                                                                                                                                                                                                                             
        if(!frontIsClear()) 
        {
          turnLeft();
          move();
        } 
        
        else
        {
          move();
          turnLeft();
        }
      }
      
      else if(facingWest() && !frontIsClear()) // do I turn Left
      {
        turnRight();
        move();
        turnRight();
      } 
      
      else //now that I've checked everything I can move
      {
        move();
      }
    }
  }

}
