class Lives
{
  
  float x;
  float y;
  
  
  Lives ()
  {
    
  }
  
  void display()
  {
    image(heart, x, y, 20, 20);
  }
  
  void loadLives()
  {
    for (int i = 0; i < lives.size(); i++)
    {
      lives.get(i).x = i*30+20;
      lives.get(i).y = 30;
    }
  }
  
}
