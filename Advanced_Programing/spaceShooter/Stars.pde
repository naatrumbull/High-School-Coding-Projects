class Stars extends GameObject
{
  
  int radius;
  color starColor = color(random(0, 255), random(0, 255), random(0, 255));
  
  Stars(float x, float y)
  {
    super(x, y, 0, 0, color(255));
    setRadius();
    w = radius;
    h = radius;
    setSpeed();
    fillBox = false;
    showBox = false;
    
  }
  
  void setRadius()
  {
    int num = (int)random(0, 101);
    if(num >= 40)
    {
      radius = 2;
    }
    else if(num >= 5)
    {
      radius = 4;
    }
    else
    {
      radius = 6;
    }
  }
  
  void setSpeed()
  {
    if(radius == 2)
    {
      setUpDown(2);
    }
    else if(radius == 4)
    {
      setUpDown(5);
    }
    else if(radius == 6)
    {
      setUpDown(10);
    }
  }
  
  void offScreenCheck()
  {
    if(top > height) 
    {
      trash.add(this);
      Stars b = new Stars(random(0, width), -5);
      objects.add(b);
    }
  }
  
  void avatar()
  {
    fill(starColor);
    ellipse(x, y, w, h);
  }
  
}
