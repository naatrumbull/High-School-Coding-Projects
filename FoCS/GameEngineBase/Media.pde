/****************************************************\

                     Media
          (A place to load images and audio files)

\****************************************************/

PImage blueTriangle;
PImage blueShot;
PImage redSquare;
PImage redShot;
PImage defaultImage;

public void loadImages()
{
  blueTriangle = loadImage("blue_triangle.png");
  blueShot = loadImage("blue_shot.png");
  redSquare = loadImage("red_square.png");
  redShot = loadImage("red_shot.png");
  defaultImage = loadImage("default_image.png");
}