int timer = 0;
String[] words = {"ellipse", "String", "loop", "array", "method", "if", "else", "condititonal", "processing", "print"};
String textHolder = "";

void setup()
{
  size(800, 800);
  background(108, 207, 255);
  textAlign(CENTER, CENTER);
  textSize(25);
}

void draw()
{
  if (timer > 0)
  {
    timer--;
  }
  
  if (timer == 0)
  {
    float xPos;
    float yPos;
    xPos = random(0, width);
    yPos = random(0, height);
    
    setRandomText();
    drawBubble(xPos, yPos);
    drawWord(xPos, yPos);
    
    timer = 5;
  }
}

void setRandomText()
{
  textHolder = words[(int)random(0, words.length)];
}

void drawBubble(float x, float y)
{
  stroke(0);
  fill(random(0, 255), random(0, 255), random(0, 255));
  
  ellipse(x, y, textHolder.length() * 20, 50);
}

void drawWord(float x, float y)
{
  fill(255);
  text(textHolder, x, y);
}

void mousePressed()
{
  background(108, 207, 255);
}

void mouseMoved()
{
  fill(108, 207, 255);
  noStroke();
  ellipse(mouseX, mouseY, 100, 100);
}
