int sizeStripe;
float blueWidth;
float blueHeight;
float intervalX;
float intervalY;
float starSize;

int alternate = 13; //number of stripes
int altStarsX = 11;
int altStarsY = 9;


void setup()
{
  size(741, 390); //OG 741, 390
  noStroke();

  blueWidth = 0.76 * height; 
  blueHeight = 0.5385 * height; 
  sizeStripe = height/alternate;
  intervalX = blueWidth / 12;
  intervalY = blueHeight / 10;
  starSize = height * (0.0616/2);
}

void draw()
{
  for (int i = 0; i <= alternate; i++)
  {
    if (i % 2 == 0)
    {
      fill(255, 0, 0);
    } else
    {
      fill(255);
    }

    rect(0, i * sizeStripe, width, sizeStripe);
  }

  fill(0, 0, 255);
  rect(0, 0, blueWidth, blueHeight);

  fill(255);

  for (int y = 0; y < altStarsY; y++)
  {
    if (y % 2 == 0)
    {
      for (int x = 0; x < altStarsX; x++)
      {
        if (x % 2 == 0)
        {
          ellipse((intervalX * x) + intervalX, (intervalY * y) + intervalY, starSize, starSize);
        }
      }
    }

    if (y % 2 == 1)
    {
      for (int x = 0; x < altStarsX; x++)
      {
        if (x % 2 == 1)
        {
          ellipse((intervalX * x) + intervalX, (intervalY * y) + intervalY, starSize, starSize);
        }
      }
    }
  }
  
}
