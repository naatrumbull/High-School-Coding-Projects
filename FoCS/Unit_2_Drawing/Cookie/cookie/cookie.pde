//I completed the challenge!!!

PImage cookie;
int numClicks;
int timer;
int xCookie;
int yCookie;

int checker = 0;
boolean clickChecker()
{
  if(mousePressed && checker == 0) //will only add a click if checker == 0; 
  {
    checker = 1;
    return true;
  }
  else if(!mousePressed) //once the mouse is not pressed
  {
    checker = 0;
    return false;
  }
  else
  {
    return false;
  }
}

void setup()
{
  numClicks = 0;
  timer = 0;
  xCookie = 400;
  yCookie = 290;

  size(800, 800);
  background(0);
  imageMode(CENTER);

  cookie = loadImage("cookies-transparent-background-5.png");
}

void draw()
{
  background(0);

  image(cookie, xCookie, yCookie, 300, 300);

  fill(255);
  textSize(125);
  textAlign(CENTER);
  text("Clicks: " + numClicks, 400, 650);

  if (timer == 0  && sqrt(pow(400 - mouseX, 2) + pow(290 - mouseY, 2)) < 150 && clickChecker())
  {
    numClicks++;
    timer = 8;

    xCookie += 20;
    yCookie += 20;
  } else if (timer > 0)
  {
    timer--;
    xCookie = 400;
    yCookie = 290;
    
  }
}
