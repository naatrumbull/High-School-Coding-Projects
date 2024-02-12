
Button b;
SkinnyGuy a;

void setup() 
{
  size(1500, 700);
  b = new Button(width / 2, height / 2, 100, 90, "Hover on Me", 255, 0, 0);
  a = new SkinnyGuy(300, 600, 50, 50);
}

void draw() 
{
  b.drawButton();
  a.avatar();
}
