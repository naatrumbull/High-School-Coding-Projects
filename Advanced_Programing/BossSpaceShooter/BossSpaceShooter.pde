color[] selectColor = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(120, 255, 0), color(0, 125, 255), color(125, 125, 255)};
int color1;
int color2;
int color3;
int color4;
int color5;
int color6;
int timer = 60;
float spinAmt = 0;


void setup()
{
  color1 = (int)random(0, selectColor.length);
  color2 = (int)random(0, selectColor.length);
  color3 = (int)random(0, selectColor.length);
  color4 = (int)random(0, selectColor.length);
  color5 = (int)random(0, selectColor.length);
  color6 = (int)random(0, selectColor.length);
  generateOrder();
  size(800, 800);
}


void draw()
{
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  newEnemy();
  popMatrix();
}

void changeColors()
{
  if (timer > 0)
  {
    timer--;
  }

  if (timer == 0)
  {

    color1 = (int)random(0, selectColor.length);
    color2 = (int)random(0, selectColor.length);
    color3 = (int)random(0, selectColor.length);
    color4 = (int)random(0, selectColor.length);
    color5 = (int)random(0, selectColor.length);
    color6 = (int)random(0, selectColor.length);

    timer = 60;
  }
}

void drawBoss()
{
  pushMatrix();
  
  noStroke();
  rectMode(CENTER);
  changeColors();

  //creepy eyes
  fill(28, 140, 27);
  ellipse(-80, -136, 168, 240);
  ellipse(70, -137, 168, 240);
  fill(45);
  ellipse(-79, -135, 100, 156);
  ellipse(69, -139, 100, 154);

  //body
  fill(175);
  rect(0, 0, 350, 260, 60);

  //misiles
  fill(250, 40, 40);
  rect(-77, 135, 59, 130);
  rect(75, 135, 59, 130);
  fill(212, 229, 28);
  rect(-77, 136, 41, 116);
  rect(75, 136, 41, 116);
  fill(0, 0, 134);
  rect(-77, 136, 32, 101);
  rect(75, 136, 32, 101);

  //circles
  fill(selectColor[color1]);
  ellipse(-85, -79, 21, 21);
  fill(selectColor[color2]);
  ellipse(-139, 5, 21, 21);
  fill(selectColor[color3]);
  ellipse(-132, 94, 21, 21);
  fill(selectColor[color4]);
  ellipse(135, 78, 21, 21);
  fill(selectColor[color5]);
  ellipse(135, -4, 21, 21);
  fill(selectColor[color6]);
  ellipse(73, -82, 21, 21);

  //window
  fill(173, 246, 231);
  ellipse(-1, -13, 95, 134);

  //alien
  fill(27, 140, 27);
  ellipse(-13, -44, 20, 20);
  ellipse(12, -44, 20, 20);
  ellipse(-1, -28, 33, 33);
  stroke(26, 140, 27);
  strokeWeight(13);
  line(-2, -19, -2, 12);
  noStroke();
  fill(0);
  ellipse(-13, -43, 12, 12);
  ellipse(12, -43, 12, 12);
  fill(0);
  ellipse(14, -42, 8, 8);
  ellipse(-12, -42, 8, 8);
  stroke(0);
  strokeWeight(5);
  noFill();
  arc(-1, -25, 19, 17, PI, 2*PI); 

  noStroke();
  fill(119, 184, 172);
  ellipse(-1, 32, 71, 47);
  
  rectMode(CORNER);
  strokeWeight(1);
  popMatrix();
}
