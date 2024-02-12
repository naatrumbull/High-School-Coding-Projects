int[] lights = new int[7];
int size = 150;
int timer = 0;

void setup()
{
  size(1050, 150);
  setupLights();
  displayLights();
}

void draw()
{

  if (hasWon())
  {
    displayWin();
  } else
  {
    if (timer > 0)
    {
      timer--;
    }

    if (timer == 0 && mousePressed)
    {
      rotateColor(getMouseIndex());
      rotateColor(getMouseIndex() - 1);
      rotateColor(getMouseIndex() + 1);
      displayLights();
      timer = 20;
    }
  }
}

void setupLights()
{
  for (int i = 0; i < lights.length; i++)
  {
    lights[i] = (int)random(0, 3);
  }
}

color getColorFromCode(int c)
{
  if (c == 0)
  {
    return color(255, 0, 0); //red
  } else if (c == 1) 
  {
    return color(0, 255, 0); //green
  } else if (c == 2)
  {
    return color(0, 0, 255); //blue
  } else
  {
    return color(100); //Grey: ERROR
  }
}

void displayLights()
{
  for (int i = 0; i < lights.length; i++)
  {
    fill(getColorFromCode(lights[i]));
    rect(i * size, 0, size, size);
  }
}

int getMouseIndex()
{
  return mouseX/size;
}

void rotateColor(int index)
{
  if (0 <= index && index <= lights.length - 1)
  {
    lights[index]++;
    lights[index] = lights[index] % 3;
  }
}

boolean hasWon()
{
  for (int i = 0; i < lights.length; i++)
  {
    if (lights[i] != lights[0])
    {
      return false;
    }
  }

  return true;
}

void displayWin()
{
  noStroke();
  displayLights();

  textAlign(CENTER, CENTER);
  textSize(80);
  fill(192, 206, 92);
  text("YOU'RE A SUPER WINNER!!", width/2, height/2);
}
