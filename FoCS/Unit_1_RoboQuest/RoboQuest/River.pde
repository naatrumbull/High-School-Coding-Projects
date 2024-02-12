class River extends Robot // for "river"
{
  
  River()
  {
    super();  
    style();
  }

  void style()
  {
    setLetter('R');
    setColorPrimary(YELLOW);
    setColorSecondary(RED);
    setColorBorder(GREEN_DARK);
  }
    
  void go()
  {
    for(int i = 0; i < 24; i++) 
    {
      if(!frontIsClear() && onBeeper())
      {
        pickBeeper();
        jump();
      } 
      
      else if(onBeeper()) 
      {
        pickBeeper();
      }
      else if(!frontIsClear()) 
      {
        jump();
      }
      else 
      {
        move();
      }
      
    }
    
  }

}
