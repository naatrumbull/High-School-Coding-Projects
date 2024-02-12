final int NUM_STARS = 5000;
final float BASE_SPEED = 0.5;
final float MIN_SPEED = 0.1;
final int MAX_SPEED = 5;
final float RATE = 0.1;

float[] xPositions;
float[] yPositions;
int[] distance;
float speed;
float shipX;

PImage ship1; //Full
PImage ship2; //Medium
PImage ship3; //Large

void setup()
{
  xPositions = new float[NUM_STARS];
  yPositions = new float[NUM_STARS];
  distance = new int[NUM_STARS];
  speed = BASE_SPEED;
  ship1 = loadImage("spaceshipfull.png");
  ship2 = loadImage("spaceshipmedium.png");
  ship3 = loadImage("spaceshipsmall.png");
  shipX = width/2;

  fullScreen();
  setupStars();
  setupGraphics();
  imageMode(CENTER);
  
}

void draw()
{
  update();
  render();
}

void setupStars()
{
  for (int i = 0; i < NUM_STARS; i++)
  {
    xPositions[i] = random(width); 
    yPositions[i] = random(height);

    float roll = random(0, 100);
    if (roll <= 20)
    {
      distance[i] = 1;
    } else if (roll > 20 && roll < 50)
    {
      distance[i] = 2;
    } else 
    {
      distance[i] = 3;
    }
  }
}

void setupGraphics()
{
  noStroke();
  noCursor();
}

void render()
{
  renderStars();
  renderShips();
}

void renderStars()
{
  for (int i = 0; i < NUM_STARS; i++)
  {
    fill(255);
    ellipse(xPositions[i], yPositions[i], 4 - distance[i], 4 - distance[i]);
  }
}

void update()
{
  changeSpeed();
  moveStars();
  resetStars();
}

void moveStars()
{
  for (int i = 0; i < NUM_STARS; i++)
  {
    if (distance[i] == 1)
    {
      yPositions[i] = yPositions[i] + (speed * 3);
    } else if (distance[i] == 2)
    {
      yPositions[i] = yPositions[i] + (speed * 2);
    } else if (distance[i] == 3)
    {
      yPositions[i] = yPositions[i] + (speed * 1);
    }
  }
}

void resetStars()
{
  for (int i = 0; i < NUM_STARS; i++)
  {
    if (yPositions[i] > height)
    {
      yPositions[i] -= height;
    }
  }
}

void changeSpeed()
{
  background(0);

  if (mousePressed && mouseButton == LEFT || keyPressed && (keyCode == UP || key == 'w' || key == 'W'))
  {
    speed += RATE;
    if (speed > MAX_SPEED)
    {
      speed = MAX_SPEED;
    }
  } else if (mousePressed && mouseButton == RIGHT || keyPressed && (keyCode == DOWN || key == 's' || key == 'S'))
  {
    speed -= RATE;
    if (speed < MIN_SPEED)
    {
      speed = MIN_SPEED;
    }
  }
}

void renderShips()
{
  
  if(keyPressed && (keyCode == LEFT  || key == 'a' || key == 'A'))
  {
    if(shipX < (width/2)/10)
    {
      shipX = (width/2)/10;
    } else
    {
      shipX -= 20;
    }
  } else if (keyPressed && (keyCode == RIGHT || key == 'd' || key == 'D'))
  {
    if(shipX > (width) - ((width/2)/10))
    {
      shipX = (width) - ((width/2)/10);
    } else
    {
      shipX += 20;
    }
  }
  
  if(speed > 3.5)
  {
    image(ship1, shipX, height/2, width/10, height/10);
  } else if(speed > 1.5 && speed <= 3.5)
  {
    image(ship2, shipX, height/2, width/10, height/10);
  } else
  {
    image(ship3, shipX, height/2, width/10, height/10);
  }
}
