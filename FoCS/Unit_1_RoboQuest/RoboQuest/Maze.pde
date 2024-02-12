class Maze extends Robot // for maze/maize YES, I COMPLETED THE CHALLENGE
{
  int steps = 0;
  
  Maze()
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

  boolean leftIsClear() 
  {
    turnLeft();
    if(frontIsClear()) 
    {
      turnRight();
      return true;
    } else 
    {
      turnRight();
      return false;
    }
  }
  
  void maze() 
  {
    
    if(isOnA()) 
    {
      return;
    }
    
    if(leftIsClear()) 
    {
      turnLeft();
      move();
      steps++;
      println("I've taken " + steps + " steps!"); //I added this for fun
      
    } 
    else if(!frontIsClear()) 
    {
      println("***DEAD END***"); //also for fun
      turnLeft();
      turnLeft();
    }
    else if(!leftIsClear())
    {
      move();
      steps++;
      println("I've taken " + steps + " steps!");
    }
    
    maze();
    
  }


  void go()
  {
      maze(); //Yeah, I completed the challenge
  }
}
