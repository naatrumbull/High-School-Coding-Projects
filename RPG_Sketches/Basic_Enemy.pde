int DmgTimer = 80;


void damageAnimation() 
{
  for(int i = 80; i >= 0; i--) 
  {
    int t = i % 6;
    if(t == 0 || t == 1 || t == 2) 
    {
      invertColors();
    }
    else
    {
      revertColors();
    }
    drawSkinnyGuy();
  }
  revertColors();
}

void revertColors() 
{
  r = 0;
}

void invertColors() 
{
  r = 255;
}


void drawSkinnyGuy() 
{ 
  
  //head
  noFill();
  strokeWeight(30);
  stroke(r + 0);
  ellipse(0, -227, 180, 180);
  
  //head thing
  fill(r + 0, r + 0, r + 0);
  ellipse(-21, -223, 107, 105);
  
  //arms
  line(-59, -158, -176, 71);
  line(59, -158, 176, 71);
  line(-59, -294, -176, -527);
  line(60, -298, 176, -527);
  
  //eyes
  strokeWeight(1);
  stroke(r + 0, r + 0, r + 0);
  
  fill(r + 11, r + 250, r + 39);
  ellipse(-41, -225, 67, 97);
  
  fill(r + 0);
  ellipse(-55, -216, 24, 40);
  
  //bottom branches
  strokeWeight(20);
  stroke(r + 0);
  line(-140, -1, -37, -28);
  line(-96, -68, 36, -89);
  line(139, 10, 80, 80);
  line(-144, 36, 31, 80);
  line(89, -75, -9, 19);
  
  strokeWeight(10);
  line(-45, -69, -34, -29);
  line(-35, -23, -95, 47);
  line(18, -77, 43, -25);
  line(73, -57, 89, 70);
  line(13, 5, 10, 72);
  
  strokeWeight(5);
  line(-42, -59, 25, -54);
  line(-82, 30, 8, 42);
  line(14, 50, 76, -25);
  line(17, 48, 82, 36);
  line(-22, -16, -38, 35);
  line(-46, -5, 32, -42);
  line(-135, 46, -93, -11);
  line(-119, 25, -60, 5);
  line(46, -137, 34, -92);
  line(-22, -79, -41, -152);
  line(-25, -104, 37, -118);
  line(-45, -133, -68, -76);
  line(-107, -67, -53, -29);
  line(87, 14, 141, -17);
  
  
  //top branches
  strokeWeight(20);
  stroke(r + 0);
  line(-155, -489, 15, -522);
  line(83, -362, -5, -379);
  line(-110, -401, 8, -478);
  line(50, -436, 138, -464);
  line(-69, -337, -46, -361);
  
  strokeWeight(10);
  line(-55, -445, -36, -512);
  line(8, -517, 108, -453);
  line(-18, -458, -54, -350);
  line(55, -434, 1, -382);
  line(84, -446, 60, -375);
  line(-123, -496, -66, -431);
  
  strokeWeight(5);
  line(-86, -456, -49, -477);
  line(-39, -493, 34, -497);
  line(-29, -423, 20, -404);
  line(-58, -429, -66, -346);
  line(-37, -316, -9, -378);
  line(147, -491, 56, -487);
  line(20, -321, 6, -376);
  line(41, -304, 33, -376);
  line(-60, -402, -43, -383);
  line(1, -463, 68, -450);
  line(-56, -346, -22, -348);
  
  
  
  
  
}
