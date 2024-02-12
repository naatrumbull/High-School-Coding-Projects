class Button 
{
  float xPos;
  float yPos;
  float w;
  float h;
  String title;
  int r;
  int g;
  int b;
  
  Button(float x, float y, float w, float h, String s, int r, int g, int b) 
  {
    xPos = x;
    yPos = y;
    this.w = w;
    this.h = h;
    title = s;
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
  float top() 
  {
    return yPos - h / 2;
  }
  
  float bottom() 
  {
    return yPos + h / 2;
  }
  
  float left()
  {
    return xPos - w / 2;
  }
  
  float right() 
  {
    return xPos + w / 2;
  }
  
  void drawButton() {
    noStroke();
    if(mouseOver()) 
    {
      fill(255 - r, 255 - g, 255 - b);
    }
    else 
    {
      fill(r, g, b);
    }
    rectMode(CENTER);
    rect(xPos, yPos, w, h, 3);
    if(mouseOver()) 
    {
      fill(255);
    }
    else 
    {
      fill(0);
    }
    textAlign(CENTER, CENTER);
    textSize(14);
    text(title, xPos, yPos);
    textAlign(LEFT, TOP);
    textSize(12);
    rectMode(CORNER);
  }
  
  boolean mouseOver() 
  {
    if(mouseX > left() && mouseX < right() && mouseY > top() && mouseY < bottom())
    {
      return true;
    }
    return false;
  }
  
}
