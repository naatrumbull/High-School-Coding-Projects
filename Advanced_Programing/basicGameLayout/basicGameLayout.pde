int scene = 0;
Button btnStart;


void setup()
{
  size(1000, 800);
  btnStart = new Button(width/2, height*2/3, 100, 35, "Start");
}

void draw()
{
  background(0);
  fill(225, 225, 0);
  textSize(20);
  textAlign(CENTER, CENTER);
  if(scene == 0) startScreen();
  else if (scene == 1) level1();
  else if (scene == 2) level2();
  else if (scene == 99) win();
  else if (scene == 100) lose();
  else displayReminder();
}

void displayReminder()
{
  background(255, 0, 0);
  text("You need to edit scenes in the draw function", width/2, height/2);
}
