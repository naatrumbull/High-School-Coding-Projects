int r;

void setup() 
{
  size(540, 800);
  r = 0;
}

void draw() 
{
  background(120);

  pushMatrix();
  //scale(0.76);
  translate(width/2 + 0, height/2 + 237);
  rectMode(CENTER);

  //drawReyn();
  //damageAnimation();
  if(mousePressed) r = 255;
  else r = 0;
  drawSkinnyGuy();
  

  rectMode(CORNER);
  popMatrix();
}

void drawReyn() 
{
  
  //legs
  noStroke();
  fill(r + 252, r + 218, r + 143);
  rect(171, 737, 98, 265);
  rect(-178, 727, 100, 295);
  
  //left arm
  noStroke();
  fill(r + 252, r + 218, r + 143);
  
  pushMatrix();
  rotate(-0.61);
  rect(346, 260, 356, 100);
  popMatrix();
  
  
  fill(r + 123, r + 91, r + 91);
  pushMatrix();
  rotate(0.90);
  rect(165, -145, 327, 100);
  popMatrix();
  
  //neck
  strokeWeight(1);
  stroke(r + 0);
  fill(r + 252, r + 218, r + 143);
  rect(-8, -164, 176, 82);
  
  //legs
  noStroke();
  fill(r + 30, r + 30, r + 73);
  pushMatrix();
  rotate(0.25);
  rect(-16, 499, 206, 472);
  popMatrix();
  
  pushMatrix();
  rotate(-0.23);
  rect(13, 491, 197, 472);
  popMatrix();
  
  //shoulders and body
  noStroke();
  fill(r + 123, r + 91, r + 91);
  rect(-8, -33, 392, 193, 93);
  rect(-8, 140, 392, 361);
  
  // right arm
  fill(r + 252, r + 218, r + 143);
  
  noStroke();
  pushMatrix();
  rotate(-0.61);
  rect(87, 82, 356, 100);
  popMatrix();
  
  stroke(0);
  strokeWeight(5);
  fill(r + 123, r + 91, r + 91);
  pushMatrix();
  rotate(0.90);
  rect(-30, 76, 327, 100);
  popMatrix();
  
  //head
  noStroke();
  fill(r + 252, r + 218, r + 143);
  ellipse(0, -398, 500, 434);
  
  //eyes
  noStroke();
  fill(r + 0);
  ellipse(95, -447, 41, 18);
  ellipse(204, -472, 40, 18);
  
  //hair
  fill(r + 255, r + 142, r + 3);
  strokeWeight(8);
  stroke(r + 0);
  triangle(-75, -563, -342, -503, -152, -398);
  triangle(32, -612, -275, -607, -88, -512);
  triangle(-21, -573, -268, -556, -114, -481);
  triangle(-127, -458, -410, -441, -163, -331);
  triangle(-112, -483, -385, -483, -148, -386);
  triangle(-144, -409, -383, -337, -146, -289);
  
  //freckles
  noStroke();
  fill(r + 223, r + 122, r + 122);
  ellipse(23, -364, 6, 6);
  ellipse(42, -347, 5, 8);
  ellipse(18, -338, 6, 9);

  stroke(r + 0);
  strokeWeight(8);
  noFill();
  arc(156, -304, 92, 70, -PI, 0);
  
  //knuckles
  stroke(0);
  strokeWeight(3);
  fill(r + 252, r + 218, r + 143);
  ellipse(217, -120, 31, 32);
  ellipse(246, -111, 24, 25);
  ellipse(260, -89, 24, 25);
  ellipse(276, -71, 25, 20);
  ellipse(286, -50, 20, 20);
}
