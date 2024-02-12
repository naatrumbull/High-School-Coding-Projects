class Hero extends Fighter 
{
  
  private int[] expLevelUps = {100, 400, 1000, 1900, 3000, 4500, 6500, 9700, 13000, 18500, 26500};
  
  int level;
  int exp;
  
  Hero(String name, int maxHP, int maxMP, int attack, int defense, int speed, int luck, float x, float y, float w, float h, int r, int g, int b, int level, int exp)
  {
    super(name, maxHP, maxMP, attack, defense, speed, luck, x, y, w, h, r, g, b);
    this.level = level;
    this.exp = exp;
  }
  
  int determinedLevel() 
  {
    for(int i = expLevelUps.length - 1; i >= 0; i++)
    {
      if(exp >= expLevelUps[i]) 
      {
        return i + 2;
      }
    }
    return 1;
  }
  
  void setExp(int amt) 
  {
    exp += amt;
  }
  
  void checkLevel() 
  {
    if (determinedLevel() != level) 
    {
      setLevel(determinedLevel());
    }
  }
  
  void setLevel(int l) 
  {
    level = l;
  }
  
}

class Reyn extends Hero
{
  
  Reyn(float x, float y, float w, float h) 
  {
    super("Reyn", 57, 22, 51, 40, 23, 2, x, y, w, h, 255, 189, 46, 1, 0);
  }
  
  void avatar()
  {
    
  }
  
  
}
