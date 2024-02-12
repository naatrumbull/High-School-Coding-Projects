int levelNumber;

void prepareStars()
{
  for(int i = 0; i < 400; i++)
  {
    Stars b = new Stars(random(0, width), random(0, height));
    objects.add(b);
  }
}

void prepareLives()
{
  
  for(int i = 0; i < 10; i++)
  {
    Lives b = new Lives(i*40+100, 30, 30, 30, color(255, 0, 0));
    lives.add(b);
  }
}

void prepareLevel1()
{
  reset();
  Enemy1 e = new Enemy1(80, 60);
  objects.add(e);
  e = new Enemy1(400, 60);
  objects.add(e);
  
  
  /*
  EyeEnemy e = new EyeEnemy(200, 100);
  objects.add(e);
  e = new EyeEnemy(400, 300);
  objects.add(e);
  e = new EyeEnemy(600, 150);
  objects.add(e);
  */
  
  /*
  LightEnemy e = new LightEnemy(width/2, 300);
  objects.add(e);
  */
  
  /*
  Boss boss = new Boss(400, 180);
  objects.add(boss);
  */
  
  prepareStars();
  prepareLives();
  
  levelNumber = 1;
  scene = 1;
  
}

void prepareLevel2()
{
  Enemy1 e = new Enemy1(80, 60);
  objects.add(e);
  e = new Enemy1(500, 60);
  objects.add(e);
  e = new Enemy1(210, 60);
  objects.add(e);
  levelNumber = 2;
  scene = 2;
}

void prepareLevel3()
{
  EyeEnemy e = new EyeEnemy(200, 100);
  objects.add(e);
  e = new EyeEnemy(400, 300);
  objects.add(e);
  e = new EyeEnemy(600, 150);
  objects.add(e);
  
  
  levelNumber = 3;
  scene = 3;
}

void prepareLevel4()
{
  LightEnemy e = new LightEnemy(width/3, 300);
  objects.add(e);
  e = new LightEnemy(width/3*2, 300);
  objects.add(e);
  
  levelNumber = 4;
  scene = 4;
}

void prepareLevel5()
{
  Boss boss = new Boss(400, 180);
  objects.add(boss);
  Enemy1 e = new Enemy1(80, 200);
  objects.add(e);
  e = new Enemy1(170, 200);
  objects.add(e);
  e = new Enemy1(850, 200);
  objects.add(e);
  levelNumber = 5;
  scene = 5;
}

void level1()
{
  background(0);
  displayObjects();
  displayStats();
  checkCollisions();
  emptyTrash();
  if (hasWon()) prepareLevel2();
  
}

void level2()
{
  background(0);
  displayObjects();
  displayStats();
  checkCollisions();
  emptyTrash();
  if (hasWon()) prepareLevel3();
}

void level3()
{
  background(0);
  displayObjects();
  displayStats();
  checkCollisions();
  emptyTrash();
  if (hasWon()) prepareLevel4();
}

void level4()
{
  background(0);
  displayObjects();
  displayStats();
  checkCollisions();
  emptyTrash();
  if (hasWon()) prepareLevel5();
}

void level5()
{
  background(0);
  displayObjects();
  displayStats();
  checkCollisions();
  emptyTrash();
  if (hasWon()) scene = 99;
}
