class Fighter extends GameObject
{
  private String name;
  private int maxHP; //maxiumum amt of HP they have
  private int currentHP; //Actual HP they have
  private int maxMP;
  private int currentMP;
  private int attack;
  private int tempAttack;
  private int defense;
  private int tempDefense;
  private int speed;
  private int luck;
  
  Fighter(String name, int maxHP, int maxMP, int attack, int defense, int speed, int luck, float x, float y, float w, float h, int r, int g, int b)
  {
    super(x, y, w, h, r, g, b);
    this.name = name;
    this.maxHP = maxHP;
    currentHP = maxHP;
    this.maxMP = maxMP;
    currentMP = maxMP;
    this.attack = attack;
    tempAttack = attack;
    this.defense = defense;
    tempDefense = defense;
    this.speed = speed;
    this.luck = luck;
  }
  
  void setCurrentHP(int amt)
  {
    currentHP += amt;
    
    if(currentHP < 0)
    {
      currentHP = 0;
    }
    
    if(currentHP > maxHP)
    {
      currentHP = maxHP;
    }
  }
  
  void setCurrentMP(int amt)
  {
    currentMP += amt;
    
    if(currentMP < 0)
    {
      currentMP = 0;
    }
    
    if(currentMP > maxMP)
    {
      currentMP = maxMP;
    }
  }
  
  void setMaxHP(int amt)
  {
    maxHP += amt;
  }
  
  void setMaxMP(int amt)
  {
    maxMP += amt;
  }
  
  void setAttack(int amt)
  {
    attack += amt;
  }
  
  void setTempAttack(int amt)
  {
    tempAttack += amt;
  }
  
  void resetTempAttack()
  {
    tempAttack = attack;
  }
  
  void setDefense(int amt)
  {
    defense += amt;
  }
  
  void setTempDefense(int amt)
  {
    tempDefense += amt;
  }
  
  void resetTempDefense()
  {
    tempDefense = defense;
  }
  
  void setSpeed(int amt) 
  {
    speed += amt;
  }
  
  void setLuck(int amt)
  {
    luck += amt;
  }
  
  void mainAttack() 
  {
    
  }
  
  void magicAttacks()
  {
    
  }
  
  void specialAttack()
  {
    
  }
  
}
