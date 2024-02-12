Ball[] b = new Ball[100];


void setup()
{
  fullScreen();
  frameRate(60);
  for(int i = 0; i < b.length; i++)
  {
    b[i] = new Ball();
  }
  
}

void draw()
{
  background(0);
  
  for(int i = 0; i < b.length; i++)
  {
    b[i].update();
    b[i].render();
  }
  
}
