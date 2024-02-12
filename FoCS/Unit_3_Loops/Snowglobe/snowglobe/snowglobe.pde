float centerX;
float centerY;
float radius;
int charge;
PImage gingerbread;

void setup()
{
  size(800, 600);
  noStroke();
  textAlign(CENTER);
  gingerbread = loadImage("Gingerbread-Man.png");
  charge = 0;
}

void draw()
{
  drawGlobe();
  drawCharge();
  animate(charge);
}

void drawGlobe()
{
  background(0);

  centerX = 400;
  centerY = 170;
  radius = 300;

  //gingerbread image
  tint(80, 232, 223);
  image(gingerbread, 325, 65, 150, 200);

  //the globe
  fill(255, 255, 255, 50);
  ellipse(centerX, centerY, radius, radius);

  //the globe base
  fill(201, 83, 41);
  rect(229, 311, 356, 98);
  rect(169, 408, 486, 98);
}

void drawCharge()
{
  mouseEvents();

  fill(109, 23, 250);
  textSize(50);
  text(charge, 400, 450);
}

void mouseEvents()
{
  if (mousePressed && mouseButton == LEFT)
  {
    charge++;
  } else if (mousePressed && mouseButton == RIGHT)
  {
    charge = 0;
  } else if (charge > 0)
  {
    charge--;
  }
}

void animate(int c)
{
  float x;
  float y;

  

    for (int i = 0; i < c; i++)
    {
      do
      {
        x = random(0, width);
        y = random(0, height);
      } 
      while (dist(x, y, centerX, centerY) > radius/2);

      fill(255);
      ellipse(x, y, c/100, c/100);
    }
  
}
