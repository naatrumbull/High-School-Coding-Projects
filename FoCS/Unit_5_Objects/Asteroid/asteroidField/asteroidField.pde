final float ASTEROID_BASE_SIZE = 128;
final float ASTEROID_NUMBER = 20;
final float STAR_NUMBER = 1000;
final float SPEED_FACTOR = 170;
final float LASER_MAX_HEAT = 50;
final float LASER_HEAT_RATE = 0.75;
final float LASER_COOL_RATE = 1;
final float LASER_OVERHEAT_PENALTY = 60;
final float BOOM_SCALE = 0.15;
final int BOOM_DURATION = 30;
final int BOOM_AMOUNT = 50;
final int BOOM_SPLIT = 5;
final int BOOM_MIN_SIZE = 50;

ArrayList<Asteroid> a;
ArrayList<Stars> s;
ArrayList<Boom> b;
PImage[] rocks  = new PImage[4];
PImage[] damaged = new PImage[4];
int score;
int gameTimer = 60 * 40;
float curHeat = 0;
int overHeatTimer = 0;

void setup()
{
  fullScreen();
  noCursor();

  rocks[0] = loadImage("asteroidOne.png");
  rocks[1] = loadImage("asteroidTwo.png");
  rocks[2] = loadImage("asteroidThree.png");
  rocks[3] = loadImage("asteroidFour.png");
  damaged[0] = loadImage("asteroidOneDamaged.png");
  damaged[1] = loadImage("asteroidTwoDamaged.png");
  damaged[2] = loadImage("asteroidThreeDamaged.png");
  damaged[3] = loadImage("asteroidFourDamaged.png");

  a = new ArrayList<Asteroid>();
  s = new ArrayList<Stars>();
  b = new ArrayList<Boom>();

  score = 0;

  //creates initial Astroids
  for (int i = 0; i < ASTEROID_NUMBER; i++)
  {
    a.add(new Asteroid(random(0, width), random(0, height), ASTEROID_BASE_SIZE));
  }

  //creates initial stars
  for (int i = 0; i < STAR_NUMBER; i++)
  {
    s.add(new Stars(random(0, height)));
  }
}

void draw()
{
  background(0);
  asteroids();
  stars();
  boom();
  laser();
  displayScore();
  if (gameTimer > 0)
  {
    gameTimer--;
  }
}

void displayScore()
{
  final float HEAT_BAR_X = 50;
  final float HEAT_BAR_Y = 50;
  final float HEAT_BAR_WIDTH = 200;
  final float HEAT_BAR_HEIGHT = 50;

  fill(255);
  textAlign(CENTER, CENTER);
  textFont(createFont("impact", width/50));
  text("SCORE:\n" + score, (width/20) * 18.5, (height/15));

  fill(0, 255, 0);
  rect(HEAT_BAR_X, HEAT_BAR_Y, HEAT_BAR_WIDTH, HEAT_BAR_HEIGHT);

  fill(255, 0, 0);
  rect(HEAT_BAR_X, HEAT_BAR_Y, (curHeat / LASER_MAX_HEAT) * HEAT_BAR_WIDTH, HEAT_BAR_HEIGHT);

  if (gameTimer <= 660)
  {
    fill(255, (int)random(0, 200), (int)random(0, 200));
  } else
  {
    fill(255);
  }
  textAlign(CENTER, CENTER);
  text("TIME:\n" + (int)(gameTimer/60), (width/20) * 17, (height/15));
}

void asteroids()
{
  //updates the astroids
  for (int i = 0; i < a.size(); i++)
  {
    Asteroid c = a.get(i);
    c.update();
  }

  //draws the Astroids
  for (int i = 0; i < a.size(); i++)
  {
    Asteroid c = a.get(i);
    c.render();
  }

  for (int i = 0; i < a.size(); i++)
  {
    Asteroid c = a.get(i);
    c.eventListener();
  }
}

void stars()
{
  //updates the stars
  for (int i = 0; i < s.size(); i++)
  {
    Stars c = s.get(i);
    c.update();
  }

  //Deletes stars and adds new ones to replace the old ones.
  for (int i = s.size() - 1; i >= 0; i--)
  {
    Stars c = s.get(i);
    if (c.yPos > height)
    {
      s.remove(i);
      s.add(new Stars(-5));
    }
  }

  //draws the Stars
  for (int i = 0; i < s.size(); i++)
  {
    Stars c = s.get(i);
    c.render();
  }
}

void boom()
{
  for (int i = 0; i < b.size(); i++)
  {
    Boom c = b.get(i);
    c.update();
  }

  for (int i = 0; i < b.size(); i++)
  {
    Boom c = b.get(i);
    c.render();
  }
}

void laser()
{
  noStroke();

  if (overHeatTimer > 0)
  {
    overHeatTimer--;
  } else if (mousePressed)
  {
    fill(0, 255, 0);
    stroke(0, 255, 0);
    curHeat += LASER_HEAT_RATE;
    if (curHeat > LASER_MAX_HEAT)
    {
      overHeatTimer = (int)LASER_OVERHEAT_PENALTY;
    }
  } else
  {
    fill(255, 0, 0);
    stroke(255, 0, 0);

    curHeat -= LASER_COOL_RATE;
    if (curHeat < 0)
    {
      curHeat = 0;
    }
  }


  ellipse(mouseX, mouseY, width/100, width/100);

  line(0, mouseY, width, mouseY);
  line(mouseX, 0, mouseX, height);
}
