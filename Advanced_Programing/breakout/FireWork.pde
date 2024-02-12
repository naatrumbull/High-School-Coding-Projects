class Firework
{
  int size;
  int red;
  int green;
  int blue;
  float spin = 0;
  float spinSpeed = 0.05;
  float x;
  float y;
  
  Firework()
  {
    size = (int)random(20, 50);
    red = (int)random(0, 256);
    green = (int)random(0, 256);
    blue = (int)random(0, 256);
    x = random(100, 700);
    y = random(100, 500);
    createParticles();
  }
  
  void createParticles()
  {
    for(int i = 0; i < size; i++)
    {
      particle.add(new Particle(0, 0, red + (int)random(-30, 30), green + (int)random(-30, 30), blue + (int)random(-30, 30)));
    }
  }
  
  void update()
  {
    for(int i = 0; i < particle.size(); i++)
    {
      particle.get(i).update();
    }
    spin += spinSpeed;
    if(isDead())
    {
      firework.remove(this);
    }
  }
  
  void render()
  {
    pushMatrix();
    translate(x, y);
    rotate(spin);
    for(int i = 0; i < particle.size(); i++)
    {
      particle.get(i).render();
    }
    popMatrix();
  }
  
  boolean isDead()
  {
    for(int i = 0; i < particle.size(); i++)
    {
      if(particle.get(i).red > 0 || particle.get(i).green > 0 || particle.get(i).blue > 0)
      {
        return false;
      }
    }
    return true;
  }
  
}
