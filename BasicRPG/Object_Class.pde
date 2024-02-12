class GameObject 
{
  float x;
  float y;
  float w;
  float h;
  float top;
  float bottom;
  float left;
  float right;
  int r;
  int g;
  int b;
  boolean showBox = true;
  boolean fillBox = true;
  boolean center = true;
  float udSpeed = 0;
  float lrSpeed = 0;
  
  GameObject(float x, float y, float w, float h, int r, int g, int b)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
  void drawObject()
  {
    if(center) 
    {
      rectMode(CENTER);
    }
    
    if(showBox) 
    {
      stroke(0);
    }
    else 
    {
      noStroke();
    }
    
    if(fillBox)
    {
      fill(r, g, b);
    }
    else
    {
      noFill();
    }
    
    rect(x, y, w, h);
    
    avatar();
    
    rectMode(CORNER);
    strokeWeight(1);
    stroke(0);
    move();
    events();
    
  }
  
  void avatar()
  {
    
  }
  
  void move()
  {
    y += udSpeed;
    x += lrSpeed;
  }
  
  void events() 
  {
    
  }
  
  void setUpDown(float speed)
  {
    udSpeed = speed;
  }
  
  void setLeftRight(float speed)
  {
    lrSpeed = speed;
  }
  
  void stopObject()
  {
    udSpeed = 0;
    lrSpeed = 0;
  }
  
  float top() 
  {
    return y - h / 2;
  }
  
  float bottom() 
  {
    return y + h / 2;
  }
  
  float left()
  {
    return x - w / 2;
  }
  
  float right() 
  {
    return x + w / 2;
  }
  
  boolean isCollision(GameObject obj)
  {
    if(this!=obj && this.top< obj.bottom && this.bottom > obj.top && this.left<obj.right && this.right > obj.left)
    {
      return true;
    }
    
    return false;
  }
}
