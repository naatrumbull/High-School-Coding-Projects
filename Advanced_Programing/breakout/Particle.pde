class Particle 
{
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float size;
  int red;
  int green;
  int blue;
  int brightness;
  int darken;
  
  Particle(float x, float y, int red, int green, int blue)
  {
    this.x = x;
    this.y = y;
    xSpeed = random(-8, 8);
    ySpeed = random(-8, 8);
    size = random(10, 50);
    this.red = red;
    this.green = green;
    this.blue = blue;
    brightness = 255;
    darken = (int)random(4, 10);
  }
  
  void update()
  {
    x += xSpeed;
    y += ySpeed;
    brightness -= darken;
    
    if (brightness < 0)
    {
      particle.remove(this);
    }
  }
  
  void render()
  {
    fill(red, green, blue, brightness);
    ellipse(x, y, size, size);
  }
}
