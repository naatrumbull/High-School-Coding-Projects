

void prepareStartScreen()
{
  scene = 0;
}

void startScreen()
{
  background(0);
  displayTitleScreenObjects();
  titleScreenCollisions();
  emptyTitleScreenTrash();
  titleHero.shoot();
  
  textFont(createFont("impact", 150));
  fill(127);
  text("SPACE SHOOTER", width/2, 300);
  textFont(createFont("serif", 12));
  
  btnStart.drawButton();
}

void displayTitleScreenObjects()
{
  for(GameObject obj: titleScreenObjects)
  {
    obj.drawObject();
  }
}

void titleScreenCollisions()
{
  
  for(GameObject obj: titleScreenObjects)
  {
    if(obj instanceof Bullet)
    {
      if(titleEnemy.isCollision(obj))
      {
        titleEnemy.takeDamage(1);
        titleEnemy.health++;
        titleScreenObjectsTrash.add(obj);
      }
      if(obj.bottom < 0)
      {
        titleScreenObjectsTrash.add(obj);
      }
    }
  }
  
}

void emptyTitleScreenTrash()
{
  for(GameObject obj: titleScreenObjectsTrash)
  {
    titleScreenObjects.remove(obj);
  }
  titleScreenObjectsTrash.clear();
}
