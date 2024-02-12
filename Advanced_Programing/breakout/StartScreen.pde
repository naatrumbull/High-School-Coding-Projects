int timer = 10;
int turnTimer = 50;
float rotate = -PI/8;
float spin = 0;
float spinSpeed = 0.1;

void prepareStartScreen()
{
  btnPlay = new Button(width/2, height*.66, 150, 30, "Play Game");
  score = 0;
  screenNumber=START_SCREEN_NUMBER;
}

void startScreen()
{
  textSize(64);
  textAlign(CENTER, CENTER);
  fill(0);
  
  timer();
  for(int i = 0; i < firework.size(); i++)
  {
    firework.get(i).update();
  }
  for(int i = 0; i < firework.size(); i++)
  {
    firework.get(i).render();
  }
  
  
  pushMatrix();
  translate(width/2, height * .33);
  turnTitle();
  rotate(rotate);
  noStroke();
  fill(255, 255, 0);
  ellipse(5, 5, 370, 130);
  fill(0);
  text("Breakout!", 0, 0);
  popMatrix();
  
  btnPlay.drawButton();
  
}

void turnTitle()
{
  if(turnTimer == 0)
  {
    rotate += (-PI/10);
    turnTimer = 50;
  }
  
  if(turnTimer > 0)
  {
    turnTimer--;
  }
}

void addParticle()
{
  firework.add(new Firework());
}


void timer()
{
  if (timer == 0)
  {
    addParticle();
  
    timer = 90;
  }
  
  if (timer > 0)
  {
    timer--;
  }
}
