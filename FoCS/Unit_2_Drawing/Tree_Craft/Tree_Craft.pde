void setup()
{
  frameRate(500);
  size(800, 800);
  background(77, 201, 224);
  
  
  fill(7, 147, 64);
  rect(0, 600, width, height);
  
  fill(108, 83, 84);
  rect(375, 300, 50, 510);
}


void draw()
{
  
  
  if(mousePressed && mouseButton == LEFT) //draws leaves
  {
    stroke(0);
    strokeWeight(1);
    fill(255, (int)random(0, 256), 0);
    rect(mouseX + (int)random(-20, 20), mouseY + (int)random(-20, 20), random(5, 16), random(5, 16));
  }
  
  if(mousePressed && mouseButton == RIGHT) //erases
  {
    noStroke();
    fill(77, 201, 224);
    rect(mouseX, mouseY, 35, 35);
    
  }
  
}
