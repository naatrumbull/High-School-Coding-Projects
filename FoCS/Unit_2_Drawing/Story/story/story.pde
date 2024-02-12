String story;

String getPlace() 
{
  int randomNum = (int)random(1, 8);

  if (randomNum == 1)
  {
    return "Seattle Washington";
  } else if (randomNum == 2)
  {
    return "Ijamsville MD";
  } else if (randomNum == 3)
  {
    return "Mount Airy MD";
  } else if (randomNum == 4)
  {
    return "Monrovia MD";
  } else if (randomNum == 5)
  {
    return "Oakdale MD";
  } else if (randomNum == 6)
  {
    return "Trumbull Connecticut";
  } else 
  {
    return "Fairfax Virgina";
  }
}

String getFirstWord()
{
  int randomNum = (int)random(1, 15);

  if (randomNum == 1)
  {
    return "Poison";
  } else if (randomNum == 2)
  {
    return "Lightning";
  } else if (randomNum == 3)
  {
    return "Bull";
  } else if (randomNum == 4)
  {
    return "Rhapsody in";
  } else if (randomNum == 5)
  {
    return "Sparkling";
  } else if (randomNum == 6)
  {
    return "Inconvient";
  } else if (randomNum == 7)
  {
    return "Incredible";
  } else if (randomNum == 8)
  {
    return "Imagine";
  } else if (randomNum == 9)
  {
    return "Flombatios";
  } else if (randomNum == 10)
  {
    return "Fabulous";
  } else if (randomNum == 11)
  {
    return "Shady";
  } else if (randomNum == 12)
  {
    return "Moon";
  } else if (randomNum == 13)
  {
    return "Masculine";
  } else 
  {
    return "Pretty";
  }
}

String getSecondWord()
{
  int randomNum = (int)random(1, 21);

  if (randomNum == 1)
  {
    return "Flower";
  } else if (randomNum == 2)
  {
    return "Lepracaun";
  } else if (randomNum == 3)
  {
    return "Dragons";
  } else if (randomNum == 4)
  {
    return "Roses";
  } else if (randomNum == 5)
  {
    return "Cheese";
  } else if (randomNum == 6)
  {
    return "Mockingbirds";
  } else if (randomNum == 7)
  {
    return "Nucleic Acid";
  } else if (randomNum == 8)
  {
    return "Super Show";
  } else if (randomNum == 7)
  {
    return "Bricks";
  } else if (randomNum == 8)
  {
    return "Cake";
  } else if (randomNum == 9)
  {
    return "Lizards";
  } else if (randomNum == 10)
  {
    return "Bread";
  } else if (randomNum == 11)
  {
    return "Hitman";
  } else if (randomNum == 12)
  {
    return "Fairy";
  } else if (randomNum == 13)
  {
    return "Juice";
  } else if (randomNum == 14)
  {
    return "Barn";
  } else if (randomNum == 15)
  {
    return "Buttons";
  } else if (randomNum == 16)
  {
    return "Armageddon";
  } else if (randomNum == 17)
  {
    return "Carpenters";
  } else if (randomNum == 18)
  {
    return "Lips";
  } else if (randomNum == 19)
  {
    return "Coyote";
  } else
  {
    return "Clam";
  }
}

String getSchool()
{
  int randomNum = (int)random(1, 16);

  if (randomNum == 1)
  {
    return "Urbana";
  } else if (randomNum == 2)
  {
    return "Liganore";
  } else if (randomNum == 3)
  {
    return "Oakdale";
  } else if (randomNum == 4)
  {
    return "The Fake TJ";
  } else if (randomNum == 5)
  {
    return "The Real TJ";
  } else if (randomNum == 6)
  {
    return "Towson";
  } else if (randomNum == 7)
  {
    return "Delaware";
  } else if (randomNum == 8)
  {
    return "Cedar Cliff";
  } else if (randomNum == 9)
  {
    return "Hawkings";
  } else if (randomNum == 10)
  {
    return "Penn State";
  } else if (randomNum == 11)
  {
    return "Harvard";
  } else if (randomNum == 12)
  {
    return "Herndon";
  } else if (randomNum == 13)
  {
    return "Bethel Park";
  } else if (randomNum == 14)
  {
    return "Frederick High";
  } else 
  {
    return "Green Valley Elementary";
  }
}

String getMascot()
{
  int randomNum = (int)random(1, 9);

  if (randomNum == 1)
  {
    return "Pigeons";
  } else if (randomNum == 2)
  {
    return "Lizards";
  } else if (randomNum == 3)
  {
    return "Losers";
  } else if (randomNum == 4)
  {
    return "Dung Beetles";
  } else if (randomNum == 5)
  {
    return "Wolverines";
  } else if (randomNum == 6)
  {
    return "Hawks";
  } else if (randomNum == 7)
  {
    return "Lancers";
  } else 
  {
    return "Terps";
  }
}

void setStory()
{
  story = 
    "Now taking the field from " + getPlace() + ", performing their 2018\nprogram, " 
    + getFirstWord() + " " + getSecondWord() + ", Bands of America is proud\nto present; the " + getSchool() + " Mighty " + 
    getMascot() + " Marching Band!!";
}

void tellStory()
{
  println(story);
}

void setup()
{
  setStory();

  size(1000, 200);
  background(0);


  textFont(createFont("Monospaced", 20));
  textAlign(CENTER);
  text(story, width/2, height/3);
  tellStory();
}

int timer = 0;

void draw()
{
  if (mousePressed && timer == 0)
  {
    background(0);
    setStory();
    tellStory();

    text(story, width/2, height/3);

    timer = 40;
  } 

  if (timer > 0)
  {
    timer--;
  }
}
