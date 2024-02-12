int[] createOrder = new int[5];
int changeLightsTimer = 30;
color leftLight = color(120);
color downLight = color(120);
color rightLight = color(120);
color upLight = color(120);
int whichLight = 0;
boolean hasPredicted = false;

void generateOrder()
{
  for (int i = 0; i < createOrder.length; i++)
  {
    createOrder[i] = (int)random(1, 5); //1 - 4
  }
  println(createOrder);
}

void applyOrder()
{
  leftLight = color(120);
  downLight = color(120);
  rightLight = color(120);
  upLight = color(120);

  if (changeLightsTimer > 0)
  {
    changeLightsTimer--;
  }

  if (changeLightsTimer == 0)
  {
    whichLight++;
    if (whichLight > 4)
    {
      whichLight = 0;
      hasPredicted = true;
    }
    changeLightsTimer = 30;
  }

  if (createOrder[whichLight] == 1) leftLight = color(255, 0, 0);
  if (createOrder[whichLight] == 2) rightLight = color(255, 0, 0);
  if (createOrder[whichLight] == 3) upLight = color(255, 0, 0);
  if (createOrder[whichLight] == 4) downLight = color(255, 0, 0);

  if (changeLightsTimer > 20)
  {
    leftLight = color(120);
    downLight = color(120);
    rightLight = color(120);
    upLight = color(120);
  }
}


void newEnemy()
{
  if(!hasPredicted) applyOrder();
  stroke(0);
  strokeWeight(1);
  rectMode(CENTER);

  //pistoles
  pushMatrix();
  rotate(0);
  fill(120);
  rect(-319, 0, 214, 82);
  rect(-319, 0, 82, 214);
  popMatrix();

  pushMatrix();
  rotate(PI/2);
  fill(120);
  rect(-319, 0, 214, 82);
  rect(-319, 0, 82, 214);
  popMatrix();

  pushMatrix();
  rotate(3*PI/2);
  fill(120);
  rect(-319, 0, 214, 82);
  rect(-319, 0, 82, 214);
  popMatrix();

  pushMatrix();
  rotate(PI);
  fill(120);
  rect(-319, 0, 214, 82);
  rect(-319, 0, 82, 214);
  popMatrix();



  //main circle
  fill(255, 124, 0);
  ellipse(0, 0, 600, 600);

  //lights
  fill(leftLight);
  ellipse(-177, 0, 160, 160); //left

  fill(rightLight);
  ellipse(177, 0, 160, 160); // right

  fill(upLight);
  ellipse(0, -177, 160, 160); //up 

  fill(downLight);
  ellipse(0, 177, 160, 160); //down


  stroke(0);
  strokeWeight(1);
  rectMode(CORNER);
}
