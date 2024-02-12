class Button
{
  float x;
  float y;
  float w;
  float h;
  String title;
  float top;
  float bottom;
  float left;
  float right;
  
  //constructor
  Button(float x, float y, float w, float h, String title)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.title = title;
    this.top = y - h/2;
    this.bottom = y + h/2;
    this.left = x - w/2;
    this.right = x + w/2;
  }
  
  void drawButton()
  {
    if (mouseOver())
    {
      fill(158);
    }
    else
    {
      fill(185);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 3);
    fill(0);
    
    if (mouseOver())
    {
      fill(255);
    }
    else
    {
      fill(0);
    }
    textAlign(CENTER, CENTER);
    textSize(14);
    text(title, x, y);
    
    textAlign(LEFT, TOP);
    textSize(12);
    rectMode(CORNER);
  }
  
  boolean mouseOver()
  {
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) 
    {
      return true;
    }
    return false;
  }
  
  
}// this closes the class
