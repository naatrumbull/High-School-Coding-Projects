void setup() 
{
  size(800, 800);
}

void draw() 
{
  if(!mousePressed) //daytime
  {
    background(5, 230, 255);
    
    //sun
    fill(243, 252, 0);
    noStroke();
    ellipse(100, 100, 100, 100);
    
    //RAINBOW
    noFill();
    stroke(255, 0, 0);
    strokeWeight(30);
    arc(418, 400, 825, 706, 3.16, 6.24); //red
    
    stroke(255, 172, 5);
    arc(418, 411, 800, 675, 3.16, 6.24); //orange
    
    stroke(246, 255, 5);
    arc(418, 409, 740, 617, 3.16, 6.24); //yellow
    
    stroke(0, 255, 0);
    arc(418, 411, 685, 570, 3.16, 6.24); //green
    
    stroke(0, 0, 255);
    arc(418, 411, 627, 512, 3.16, 6.24); //blue
    
    stroke(108, 0, 252);
    arc(418, 411, 573, 457, 3.16, 6.24); //purple
    
    //clouds
    noStroke();
    fill(255);
    ellipse(94, 412, 150, 150);
    ellipse(12, 426, 100, 100);
    ellipse(162, 443, 74, 75);
    
    ellipse(745, 412, 150, 150);
    ellipse(681, 443, 90, 90);
    ellipse(815, 425, 120, 120);
    
    fill(93, 173, 51);
    rect(0, 450, 810, 500);
  }  
  else if(mousePressed) //nighttime
  {
    background(0);
    noStroke();
    
    //moon
    fill(220);
    ellipse(689, 115, 90, 90);
    
    fill(120, 120, 120, 90);
    ellipse(671, 127, 24, 28);
    ellipse(703, 95, 18, 19);
    
    //the big dipper
    fill(255);
    ellipse(43, 287, 25, 25);
    ellipse(230, 252, 25, 25);
    ellipse(91, 380, 25, 25);
    ellipse(204, 350, 25, 25);
    
    ellipse(382, 213, 25, 25);
    ellipse(533, 140, 25, 25);
    ellipse(633, 209, 25, 25);
    
    //ground
    fill(65, 121, 35);
    rect(0, 450, 810, 500);
    
  }
  
  //apple tree
  stroke(80, 56, 56);
  strokeWeight(20);
  line(635, 415, 635, 700); //bark
  line(635, 479, 580, 440); //bark
  line(637, 490, 700, 460); //bark
  
  noStroke();
  fill(42, 93, 59);
  ellipse(582, 430, 90, 90); //left leaf
  ellipse(635, 394, 120, 120); //middle leaf
  ellipse(691, 446, 80, 80); //right leaf
  
  fill(201, 2, 5);
  ellipse(600, 450, 20, 20);
  ellipse(565, 416, 20, 20);
  ellipse(690, 456, 20, 20);
  ellipse(659, 369, 20, 20);
  ellipse(616, 400, 20, 20);
  
  //main house
  fill(219, 46, 46);
  rect(50, 404, 483, 350);
  //rect(529, 523, 207, 231);
  
  quad(516, 468, 499, 753, 746, 754, 746, 660);
  
  //windows
  stroke(85, 66, 66);
  strokeWeight(5);
  fill(100, 80, 80);
  for(int x = 83; x < 392; x += 110)
  {
    rect(x, 443, 80, 100);
  }
  
  //doors
  rect(607, 651, 52, 100);
  rect(659, 651, 52, 100);
  
  if(mousePressed) //nightime
  {
    fill(28, 255, 185);
    
  } 
  else if(!mousePressed) //daytime
  {
    fill(122, 61, 61);
  }
  
  
  
  //deer
  noStroke();
  ellipse(147, 704, 100, 50);
  quad(103, 668, 106, 703, 60, 692, 60, 685);
  
  stroke(113, 77, 77);
  strokeWeight(7);
  line(100, 680, 108, 647);
  
  if(!mousePressed) //daytime
  {
    stroke(122, 61, 61);
  }
  else if(mousePressed)
  {
    stroke(28, 255, 185);
  }
  
  strokeWeight(10);
  line(122, 719, 109, 742);
  line(109, 742, 117, 767);
  
  line(172, 719, 159, 742);
  line(159, 742, 167, 767);
  
  if(mousePressed)  //nighttime only
  {
    //evil deer
    noStroke();
    fill(255, 0, 0);
    ellipse(84, 680, 10, 10);
    
    //teeth
    fill(255);
    triangle(64, 692, 66, 700, 73, 693);
    triangle(72, 694, 76, 703, 81, 697);
  }
  
  fill(0);
  text(mouseX + " , " + mouseY, mouseX + 20, mouseY);
  
}
