
Button btnStart;


void setup()
{
  size(700, 700);
  
  btnStart = new Button(width/2, height * 2/3 , 100, 35, "Start");
}

void draw()
{
  background(0);
  
  btnStart.drawButton();
}
