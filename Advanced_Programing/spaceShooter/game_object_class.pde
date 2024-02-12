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
  color bgColor;
  float udSpeed = 0;
  float lrSpeed = 0;
  boolean showBox = true;
  boolean fillBox = true;
  boolean center = true;
  int value = 0;
  int damageAmt = 1;
  int weight = 1;
  color objectStroke = color(255);
  
  
  GameObject(float x, float y, float w, float h, color bgColor)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.bgColor = bgColor;
    defineBoundaries();
  }
  
  void drawObject()
  {
    strokeWeight(weight);
    if(center)
    {
      rectMode(CENTER);
    }
    
    
    stroke(objectStroke);
    if(showBox)
    {
      stroke(objectStroke);
    }
    else 
    {
      noStroke();
    }
    
    if(fillBox)
    {
      fill(bgColor);
    }
    else
    {
      noFill();
    }
    rect(x, y, w, h);
    
    avatar();
    
    rectMode(CORNER);
    strokeWeight(1);
    offScreenCheck();
    move();
    events();
  }
  
  void offScreenCheck()
  {
    if(top > height || bottom < 0 || left > width || right < 0) trash.add(this);
  }
  
  void avatar()
  {
    //can be overwritten
  }
  
  void events()
  {
    //empty, but can be over ridden by a subclass
  }
  
  void decideTrash()
  {
    //used by all game objects to decide when to trash
  }
  
  void bonus()
  {
    //used for the powerups
  }
  
  void takeDamage(int filler)
  {
    filler = 0;
  }
  
  void defineBoundaries()
  {
    top = y - h/2;
    bottom = y + h/2;
    left = x - w/2;
    right = x + w/2;
  }
  
  void move()
  {
    y += udSpeed;
    x += lrSpeed;
    defineBoundaries();
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
  
  boolean isCollision(GameObject obj)
  {
    if(this!=obj && this.top< obj.bottom && this.bottom > obj.top && this.left<obj.right && this.right > obj.left)
    {
      return true;
    }
    
    return false;
  }
  
}
