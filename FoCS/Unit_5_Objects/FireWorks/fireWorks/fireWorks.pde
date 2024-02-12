ArrayList<Particle> p;
int timer;

float speed;
int red;
int green;
int blue;
int numParticles;


void setup()
{
  size(900, 900);
  background(0);
  noStroke();
  p = new ArrayList<Particle>();
  timer = 0;
}

void draw()
{
  update();
  render();
}

void update()
{
  if (timer > 0)
  {
    timer--;
  }

  if (timer == 0 && mousePressed)
  {
    speed = random(1, 3.5);
    red = (int)random(0, 255);
    green = (int)random(0, 255);
    blue = (int)random(0, 255);
    numParticles = (int)random(30, 100);

    for (int i = 0; i < numParticles; i++)
    {
      p.add(new Particle(mouseX + random(-80, 80), mouseY + random(-80, 80), random(30, 60), speed, red + (int)random(-15, 16), green + (int)random(-15, 16), blue + (int)random(-15, 16), (int)random(1, 6)));
    }

    for (int i = p.size() - 1; i >= 0; i--)
    {
      Particle z = p.get(i);
      if (z.fade <= 0)
      {
        p.remove(i);
      }
    }

    timer = 20;
    println(p.size()); //prints the number of items in "p"
  }
}

void render()
{
  background(0);
  for (int i = 0; i < p.size(); i++)
  {
    Particle x = p.get(i);
    x.update();
    x.render();
  }
}
