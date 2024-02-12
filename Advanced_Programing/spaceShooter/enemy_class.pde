
/********************  Light Enemy ***************************************/

class LightEnemy extends Enemy
{
  int[] createOrder = new int[5];
  int changeLightsTimer = 30;
  color leftLight = color(120);
  color downLight = color(120);
  color rightLight = color(120);
  color upLight = color(120);
  int whichLight = 0;
  boolean hasPredicted = false;
  int shootTimer = 30;


  LightEnemy(int x, int y)
  {
    super(x, y, 250, 250, color(0, 0, 255));
    health = 15;
    value = 50;
    generateOrder();
    showBox = false;
    fillBox = false;
  }
  
  void events()
  {
    //Move Events
    int rand = (int)random(501);
    if(rand == 0)
    {
      setLeftRight(-2);
    }
    if(rand == 1)
    {
      setLeftRight(2);
    }
    if(rand == 2)
    {
      setUpDown(-2);
    }
    if(rand == 3)
    {
      setUpDown(2);
    }
    if(rand == 4)
    {
      setUpDown(2);
    }
    if(rand == 5)
    {
      setLeftRight(2);
    }
    
    
    //Shoot Bullet Events
    if(shootTimer > 0)
    {
      shootTimer--;
    }
    
    
    if(hasPredicted && shootTimer == 0)
    {
      if(createOrder[whichLight] == 1) //left
      {
        objects.add(new EnemyBullet2(left - 15, y, "left"));
        objects.add(new RotatedEnemyBullet((x - w/4) - 40, (y + h/4) + 40 , "downLeft"));
        objects.add(new RotatedEnemyBullet2((x - w/4) - 40, (y - h/4) - 40, "upLeft"));
      }
      if(createOrder[whichLight] == 2) //right
      {
        objects.add(new EnemyBullet2(right + 15, y, "right"));
        objects.add(new RotatedEnemyBullet((x + w/4) + 40, (y - h/4) - 40 , "upRight"));
        objects.add(new RotatedEnemyBullet2((x + w/4) + 40, (y + h/4) + 40, "downRight"));
      }
      if(createOrder[whichLight] == 3) //Up
      {
        objects.add(new EnemyBullet(x, top - 5, "up"));
        objects.add(new RotatedEnemyBullet((x + w/4) + 40, (y - h/4) - 40 , "upRight"));
        objects.add(new RotatedEnemyBullet2((x - w/4) - 40, (y - h/4) - 40, "upLeft"));
      }
      if(createOrder[whichLight] == 4) //down
      {
        objects.add(new EnemyBullet(x , bottom + 5, "down"));
        objects.add(new RotatedEnemyBullet((x - w/4) - 40, (y + h/4) + 40 , "downLeft"));
        objects.add(new RotatedEnemyBullet2((x + w/4) + 40, (y + h/4) + 40, "downRight"));
      }
      whichLight++;
      shootTimer = 30;
      if(whichLight > 4)
      {
        hasPredicted = false;
        whichLight = 0;
        generateOrder();
      }
    }
    
    
  }
  
  void avatar()
  {
    
    pushMatrix();
    translate(x + 0, y + 0);
    scale(0.29, 0.29);
    drawLightEnemy();
    popMatrix();
  }
  
  void generateOrder()
  {
    for (int i = 0; i < createOrder.length; i++)
    {
      createOrder[i] = (int)random(1, 5); //1 - 4
    }
    //println(createOrder);
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

  void drawLightEnemy()
  {
    damagedAnimation();
    if (!hasPredicted) applyOrder();
    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);

    //pistoles
    pushMatrix();
    rotate(0);
    fill(r+120);
    rect(-319, 0, 214, 82);
    rect(-319, 0, 82, 214);
    popMatrix();

    pushMatrix();
    rotate(PI/2);
    fill(r+120);
    rect(-319, 0, 214, 82);
    rect(-319, 0, 82, 214);
    popMatrix();

    pushMatrix();
    rotate(3*PI/2);
    fill(r+120);
    rect(-319, 0, 214, 82);
    rect(-319, 0, 82, 214);
    popMatrix();

    pushMatrix();
    rotate(PI);
    fill(r+120);
    rect(-319, 0, 214, 82);
    rect(-319, 0, 82, 214);
    popMatrix();
    
    //diagonalPistols
    pushMatrix();
    rotate(PI/4);
    fill(r+120);
    rect(-319, 0, 214, 82);
    rect(-319, 0, 82, 214);
    popMatrix();
    
    pushMatrix();
    rotate(3*PI/4);
    fill(r+120);
    rect(-319, 0, 214, 82);
    rect(-319, 0, 82, 214);
    popMatrix();
    
    pushMatrix();
    rotate(5*PI/4);
    fill(r+120);
    rect(-319, 0, 214, 82);
    rect(-319, 0, 82, 214);
    popMatrix();
    
    pushMatrix();
    rotate(7*PI/4);
    fill(r+120);
    rect(-319, 0, 214, 82);
    rect(-319, 0, 82, 214);
    popMatrix();


    //main circle
    fill(r+255, r+124, r+0);
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
}

/********************  UFO's ***************************************/

class Enemy1 extends Enemy
{


  Enemy1(int x, int y)
  {
    super(x, y, 135, 78, color(255, 255, 0));
    setLeftRight(10);
    fillBox = false;
    showBox = false;
    value = 20;
    health = 3;
  }
  
  void offScreenCheck()
  {
    if(x + w/2 >= width || x - w/2 <= 0)
    {
      lrSpeed *= -1;
    }
    if(bottom >= height/2 || y - h/2 <= 0)
    {
      udSpeed *= -1;
    }
  }

  void events() //runs every frame
  {
    //moveEvents
    int moveNum = (int)random(0, 500);
    if(moveNum == 0)
    {
      setLeftRight(0);
      setUpDown(2);
    }
    if(moveNum == 1)
    {
      setLeftRight(10);
    }
    if(moveNum == 2)
    {
      setLeftRight(-10);
    }
    if(moveNum == 3)
    {
      setUpDown(0);
    }
    
    
    //bullet Events
    int rand = (int)random(100) + 1; //random # between 1 and 100
    if (rand <= 5)
    {
      EnemyBullet b = new EnemyBullet(x, bottom + 5, "down");
      objects.add(b);
    }
  }

  void avatar()
  {
    damagedAnimation();
    pushMatrix();
    translate(x+-133, y+-132);
    scale(0.66, 0.72);
    fill(r+255, r+255, r+0);
    ellipse(200, 171, 81, 76);
    fill(r+0, r+0, r+225);
    ellipse(200, 201, 200, 62);
    fill(r+225, r+225, r+0);
    ellipse(200, 174, 82, 13);

    fill(r+255, r+0, r+0);
    ellipse(137, 191, 10, 10);
    fill(r+0, r+255, r+0);
    ellipse(164, 200, 10, 10);
    fill(r+255, r+0, r+0);
    ellipse(200, 203, 10, 10);
    fill(r+0, r+255, r+0);
    ellipse(236, 200, 10, 10);
    fill(r+255, r+0, r+0);
    ellipse(267, 191, 10, 10);
    popMatrix();
  }
}


/********************  Eye Enemy ***************************************/
class EyeEnemy extends Enemy
{
  EyeEnemy(int x, int y)
  {
    super(x, y, 80, 80, color(255, 0, 0));
    setLeftRight(5);
    setUpDown(2);
    health = 6;
    value = 50;
    showBox = false;
    fillBox = false;
  }

  void avatar()
  {
    damagedAnimation();
    pushMatrix();
    translate(x + 0, y + 1);
    scale(0.16, 0.16);

    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);
    fill(r + 6, r+201, r+40);
    rect(0, 0, 500, 500);
    fill(r+12, r+111, r+29);
    rect(0, 0, 450, 450);
    fill(r+255);
    ellipse(0, 27, 378, 378);
    fill(r+250, r+18, r+25);
    ellipse(0, 81, 329, 270);
    fill(0);
    ellipse(0, 89, 181, 246);

    rectMode(CORNER);
    stroke(0);
    strokeWeight(1);
    popMatrix();
  }

  void events()
  {
    int rand = (int)random(100) + 1; //random # between 1 and 100
    if (rand <= 2)
    {
      EyeEnemyBullet b = new EyeEnemyBullet(x, y);
      objects.add(b);
    }

    int moveAround = (int)random(1000);
    if (moveAround == 2)
    {
      setUpDown(2);
    }
    if (moveAround == 3)
    {
      setLeftRight(-5);
    }
    if (moveAround == 4)
    {
      setLeftRight(5);
    }
    if (moveAround == 5)
    {
      setUpDown(-2);
    }
  }
}

/********************  BOSS ***************************************/
class Boss extends Enemy
{
  color[] selectColor = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(120, 255, 0), color(0, 125, 255), color(125, 125, 255)};
  int color1 = (int)random(0, selectColor.length);
  int color2 = (int)random(0, selectColor.length);
  int color3 = (int)random(0, selectColor.length);
  int color4 = (int)random(0, selectColor.length);
  int color5 = (int)random(0, selectColor.length);
  int color6 = (int)random(0, selectColor.length);
  int timer = 30;
  float scaleX = 0.58;
  float scaleY = 0.55;
  float spinAmt = 0;
  float yDrop = 8;

  Boss(int x, int y)
  {
    super(x, y, 210, 240, color(125, 125, 0));
    value = 2000;
    setLeftRight(10);
    showBox = false;
    fillBox = false;
    health = 30;
  }
  
  void offScreenCheck()
  {
    if(x + w/2 >= width || x - w/2 <= 0)
    {
      lrSpeed *= -1;
    }
    if(bottom >= height/2 || y - h/2 <= 0)
    {
      udSpeed *= -1;
    }
  }
  
  void events()
  {
    //moveEvents
    int moveNum = (int)random(0, 500);
    if(moveNum == 0)
    {
      setLeftRight(0);
      setUpDown(2);
    }
    if(moveNum == 1)
    {
      setLeftRight(10);
    }
    if(moveNum == 2)
    {
      setLeftRight(-10);
    }
    if(moveNum == 3)
    {
      setUpDown(0);
    }
    
    
    
    //bullet events
    if (health > 0)
    {
      int rand = (int)random(2000) + 1; //random # between 1 and 2000

      if (rand <= 80)
      {
        EnemyBullet b = new EnemyBullet(x - 46, bottom + 5, "down");
        EnemyBullet j = new EnemyBullet(x + 43, bottom + 5, "down");
        objects.add(b);
        objects.add(j);
      } else if (rand >= 201 && rand <= 210)
      {
        MegaBossBullet1 b = new MegaBossBullet1(x - 46, bottom + 5, "down");
        MegaBossBullet1 j = new MegaBossBullet1(x + 43, bottom + 5, "down");
        objects.add(b);
        objects.add(j);
      }
    }
  }

  void avatar()
  {
    if (health > 0)
    {
      pushMatrix();
      translate(x + 0, y + 8);
      scale(0.58, 0.55);

      drawBoss();
      popMatrix();
    } else
    {
      pushMatrix();
      yDrop += 2;
      translate(x + 0, y + yDrop);
      scaleX -= 0.005;
      scaleY -= 0.005;
      spinAmt += 0.3;
      if (scaleX <= 0 && scaleY <= 0)
      {
        trash.add(this);
      } else if (scaleX <= 0)
      {
        scaleX = 0;
      } else if (scaleY <= 0)
      {
        scaleY = 0;
      }
      scale(scaleX, scaleY);
      rotate(spinAmt);
      if (scaleY != 0) drawBoss();

      popMatrix();
    }
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

      timer = 30;
    }
  }


  void takeDamage(int damageAmt)
  {
    if (health > 0 && isDamaged == false)
    {
      health = health - damageAmt;
      isDamaged = true;
    }
  }

  void drawBoss()
  {
    noStroke();
    rectMode(CENTER);
    changeColors();
    damagedAnimation();

    //creepy eyes
    fill(r+28, r+140, r+27);
    ellipse(-80, -136, 168, 240);
    ellipse(70, -137, 168, 240);
    fill(r+45);
    ellipse(-79, -135, 100, 156);
    ellipse(69, -139, 100, 154);

    //body
    fill(r+175);
    rect(0, 0, 350, 260, 60);

    //misiles
    fill(r+250, r+40, r+40);
    rect(-77, 135, 59, 130);
    rect(75, 135, 59, 130);
    fill(r+212, r+229, r+28);
    rect(-77, 136, 41, 116);
    rect(75, 136, 41, 116);
    fill(r+0, r+0, r+134);
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
    fill(r+173, r+246, r+231);
    ellipse(-1, -13, 95, 134);

    //alien
    fill(r+27, r+140, r+27);
    ellipse(-13, -44, 20, 20);
    ellipse(12, -44, 20, 20);
    ellipse(-1, -28, 33, 33);
    stroke(r+26, r+140, r+27);
    strokeWeight(13);
    line(-2, -19, -2, 12);
    noStroke();
    fill(r+0);
    ellipse(-13, -43, 12, 12);
    ellipse(12, -43, 12, 12);
    fill(r+0);
    ellipse(14, -42, 8, 8);
    ellipse(-12, -42, 8, 8);
    stroke(r+0);
    strokeWeight(5);
    noFill();
    arc(-1, -25, 19, 17, PI, 2*PI); 

    noStroke();
    fill(r+119, r+184, r+172);
    ellipse(-1, 32, 71, 47);

    rectMode(CORNER);
    strokeWeight(1);
  }
}


/********************  Title Screen UFO ***************************************/

class TitleScreenEnemy extends Enemy1
{
  TitleScreenEnemy(int x, int y)
  {
    super(x, y);
    setLeftRight(10);
  }

  void events()
  {
  }
}
