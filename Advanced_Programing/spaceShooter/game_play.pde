void generatePowerUp()
  {
    int i = (int)random(0, 1000);
    if(i == 0)
    {
      objects.add(new NewLife());
      println("NEW POWER UP!");
    }
    
    if(i == 1)
    {
      objects.add(new Shield());
    }
    
    if(i == 2)
    {
      objects.add(new PoweredUpShip());
    }
  }
  
void displayObjects() 
{
  
  int objCount = objects.size();
  for (int i = 0; i < objCount; i++)
  {
    objects.get(i).drawObject();
  }
  
  for(Lives obj: lives)
  {
    obj.drawObject();
  }
  
  generatePowerUp();
}

void checkCollisions()
{
  for (GameObject obj : objects)
  {
    if (obj instanceof Enemy || obj instanceof Bullet)
    {
      if (!hero.regenerating && hero.isCollision(obj))
      {
        hero.gotHit();
        obj.decideTrash();
        removeLives(obj.damageAmt);
        println(obj.damageAmt);
      }
    }

    //hero bullets hitting enemy
    if (obj instanceof HeroBullet || obj instanceof HeroBonusBullet || obj instanceof BonusHeroBullet)
    {
      for (GameObject obj2 : objects)
      {
        if (obj2 instanceof Enemy)
        {
          if (obj.isCollision(obj2))
          {
            obj2.takeDamage(obj.damageAmt);
            obj.decideTrash();
            hero.score += obj2.value;
          }
        }
      }
    }
    
    if(obj instanceof PowerUp)
    {
      if(hero.isCollision(obj))
      {
        obj.bonus();
      }
    }
    
  }
}

void emptyTrash()
{
  for (GameObject obj : trash)
  {
    objects.remove(obj);
  }
  
  trash.clear();
}
