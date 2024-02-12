void setup()
{
  size(600, 600);
  background(5, 236, 255);
}

void tree(float x, float y) // draws the trees
{
  
  //branches
  stroke(95, 103, 103);
  strokeWeight(16);
  line(x, y, x, y -100);
  line(x - 50, y - 175, x, y - 100);
  line(x + 50, y - 200,  x, y - 100);
  
  //leaves
  noStroke();
  fill(77, 22, 134);
  ellipse(x - 50, y - 175, 75, 75);
  ellipse(x + 57, y - 200, 90, 90);
  ellipse(x + -3, y - 220, 100, 100);
}

void bird(float x, float y) 
{
  noFill();
  stroke(0);
  strokeWeight(5);
  
  arc(x, y, 30, 30, 0.9, 3.2);
  arc(x + 20, y, 30, 30, 0.0, 2.3);
}

void draw()
{
  strokeWeight(1);
  background(5, 236, 255);
  
  //birds
  bird(450, 126);
  bird(525, 125);
  bird(487, 160);
  bird(419, 90);
  bird(547, 90);
  
  //sun
  fill(254, 255, 8);
  ellipse(129, 150, 100, 100);
  
  line(90, 115, 50, 80);
  line(75, 150, 28, 150);
  line(125, 100, 125, 50);
  
  //the actual building
  noStroke();
  fill(219, 210, 192);
  rect(183, 99, 198, 362); // center building
  rect(0, 218, 198, 243); //left side
  rect(379, 218, 221, 243); // right side
  triangle(183, 99, 381, 99, 282, 16); // top
  
  //green oulines
  fill(133, 252, 203);
  stroke(133, 252, 203);
  strokeWeight(37);
  
  line(282, 16, 183, 99); 
  line(282, 16, 381, 99); 
  line(183, 99, 183, 200);
  line(183, 200, 0, 200);
  line(381, 99, 381, 200);
  line(381, 200, 800, 200);
  
  //clock
  stroke(0);
  strokeWeight(5);
  fill(255);
  ellipse(283, 116, 60, 60);
  
  //windows
  stroke(133, 252, 203);
  fill(202, 250, 230);
  
  rect(180, 224, 50, 84);
  rect(230, 224, 50, 84);
  rect(280, 224, 50, 84);
  rect(331, 224, 50, 84);
  
  //doors
  rect(188, 360, 60, 100);
  rect(252, 360, 60, 100);
  rect(313, 360, 60, 100);
  
  //side walk
  noStroke();
  fill(188, 186, 158);
  quad(188, 463, 143, 603, 500, 803, 376, 463);
  
  //grass
  fill(43, 147, 47);
  quad(0, 461, 0, 600, 150, 600, 190, 461); //left side
  quad(600, 600, 425, 602, 376, 462, 601, 461);
  
  //HOME OF THE HAWKS
  fill(0);
  textSize(14);
  text("URBANA HIGH SCHOOL", 204, 191);
  
  //tree
  tree(103, 471); // 2nd left
  tree(549, 479); //right most
  tree(40, 495); //left most
  tree(166, 493); // middle
  tree(433, 500); //2nd to right
  
  //draws grid
  if (mousePressed)
  {
    for(int x = 0; x < 610; x += 50)
    {
      stroke(0);
      strokeWeight(1);
      line(x, 0, x, 600);
    }
    
    for(int y = 0; y < 610; y += 50)
    {
      line(0, y, 600, y);
    }
  }
  
  //Use for plotting points
  fill(255);
  rect(mouseX + 15, mouseY + 5, 60, 20);
  fill(0);
  text(mouseX + ", " + mouseY, mouseX + 20, mouseY + 20);
  
}
