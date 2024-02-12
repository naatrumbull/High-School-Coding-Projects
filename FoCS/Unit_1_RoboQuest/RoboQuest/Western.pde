class Western extends Robot // for "western"
{
  
  Western()
  {
    super();  
    style();
  }

  void style()
  {
    setLetter('W');
    setColorPrimary(GREY);
    setColorSecondary(WHITE);
    setColorBorder(BLACK);
  }
    
  void  turnWest() 
  {
    if(facingNorth()) 
    {
      turnLeft();
    } else if(facingEast()) 
    {
      turnLeft();
      turnLeft();
    } else if(facingSouth()) 
    {
      turnLeft();
      turnLeft();
      turnLeft();
    }
  }
  
  void go()
  {
    turnWest();
    for(int i = 0; i < 22; i++) 
    {
      
      float randColorR = random(0, 255);
      float randColorG = random(0, 255);
      float randColorB = random(0, 255);
      setColorPrimary(color(randColorR, randColorB, randColorG));
      setColorSecondary(color(randColorG, randColorR, randColorB));
      setColorBorder(color(randColorB, randColorG, randColorR));
      move(); 
      
    }
  }

}
