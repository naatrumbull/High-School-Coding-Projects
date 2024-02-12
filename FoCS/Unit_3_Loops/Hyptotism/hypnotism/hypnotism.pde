//Yes, I completed the Challenge, and also SEIZURE WARNING!!!!!

PImage cow;
int space = 120;
float spinCows = 0;
int timer;

void setup()
{
  size(800, 800);
  imageMode(CENTER);
  frameRate(10);
  textSize(110);
  textAlign(CENTER);
  
  timer = 0;
  cow = loadImage("cowthree.png");
}

void draw()
{
  background(random(0, 255), random(0, 255), random(0, 255));

  spinCows += 0.2;
  translate(width/2, height/2);
  
  if (timer > 0)
  {
    for (int y = height - (2 * height); y < height + 100; y+=space)
    {
      for (int x = width - (2 * width); x < width + 100; x+=space)
      {
        pushMatrix();
        translate(x, y);
        rotate(spinCows);
        image(cow, 0, 0, space, space);
        popMatrix();
      }
    }
    pushMatrix();
    rotate(spinCows);
    image(cow, 0, 0);
    popMatrix();
    timer--;
  }
  
  if (timer == 0)
  {
    background(255, 255, 255);
    fill(0);
    text("MOOOOOOO:\nGOT MILK?!?!?!", 0, 0);
    timer = 60;
  }
}
