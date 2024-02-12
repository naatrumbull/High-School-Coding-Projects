

//I COMPLETED THE CHALLENGE!!!!!!!!!!! It took awhile but I did it.

int total;
int zombies;
int people;
int days;
int timer;
int peopleLoss;
int peopleGain;
int zombieLoss;
int zombieGain;
int eventRoll;
int currentScreen;
int curePercentage;

float barLength;

String cureEvent = "";
String event;
String[] location = {"Urbana", "France", "Italy", "Britian", "Canada", "Russia", "Germany", "Switzerland", "the East Coast", "the midwest", "Norway"};

PFont impact;
PFont himma;

boolean cureIsDone()
{
  if (curePercentage == 100)
  {
    return true;
  } else 
  {
    return false;
  }
}

boolean winner()
{
  if(people <= 50 || zombies <= 50)
  {
    return true;
  } else
  {
    return false;
  }
}

void setup()
{
  size(1000, 600);

  impact = createFont("impact", 30);
  himma = createFont("GodOfWar", 80);
  timer = 0;
  
  currentScreen = 1;
  titleScreen();
}

void draw()
{
  if (timer > 0)
  {
    timer--;
  }

  if (mousePressed && timer == 0)
  {
    update();
    render();

    timer = 30;
  }
}

void initialInfection() 
{
  total = (int)(random(25000, 50000));
  zombies = (int)(total * random(0.01, 0.15));
  people = total - zombies;
  days = 1;
  event = "Initial outbreak reported in " + location[(int)random(0, location.length)] + ".";
  cureEvent = "Scientist begin research for a cure.";
  barLength = width * 0.85;
  curePercentage = 0;
}

void zombiesAttack()
{
  peopleLoss = (int)random(0, people/3);
  people -= peopleLoss;
  
  if(!cureIsDone())
  {
    zombieGain = (int)(peopleLoss * random(0.4, 0.6));
  } else 
  {
    zombieGain = 0;
  }
  
  zombies += zombieGain;
  event = "Zombie attack in " + location[(int)random(0, location.length)] + "!!!!\n" + peopleLoss + " people killed.\n" + zombieGain + " zombies gained." ;
}

void peopleAttack()
{
  zombieLoss = (int)(zombies/3);
  zombies -= zombieLoss;
  event = "People attack in " + location[(int)random(0, location.length)] + "!!!!\n" + zombieLoss + " zombies killed." ;
}

void foundSurvivors()
{
  peopleGain = (int)random(0, 101);
  people += peopleGain;
  event = peopleGain + " survivors found in " + location[(int)random(0, location.length)] + ".";
}

void airstrike()
{
  peopleLoss = (int)(people * random(0.15, 0.2));
  people -= peopleLoss;
  zombieLoss = (int)(zombies * random(0.25, 0.4));
  zombies -= zombieLoss;
  event = "Military Airstrike lands in a Zombie infested area.\n" + peopleLoss + " people killed.\n" + zombieLoss + " zombies killed.";
}

void disease()
{
  if(!cureIsDone())
  {
    peopleLoss = (int)(people * random(0.01, 0.3));
  } else 
  {
    peopleLoss = 0;
  }
  
  people -= peopleLoss;
  zombies += peopleLoss;
  event = "The food supply is infected with the zombie virus!\n" + peopleLoss + " people turn into zombies.";
}


void eventSelector()
{
  eventRoll = (int)random(0, 100);

  if (eventRoll < 30)
  {
    zombiesAttack();
  } else if (eventRoll >= 30 && eventRoll < 40)
  {
    foundSurvivors();
  } else if (eventRoll >= 40 && eventRoll < 70)
  {
    peopleAttack();
  } else if (eventRoll >= 70 && eventRoll < 80)
  {
    airstrike();
  } else
  {
    disease();
  }
}


void drawDesign()  //takes information and uses it to draw the game
{
  background(0);
  textAlign(LEFT, CENTER);
  textFont(impact);
  noStroke();

  //grey bars
  fill(100);
  rect(width/15, (height/15) * 2, barLength, height/13); //for humans
  rect(width/15, (height/15) * 5, barLength, height/13); //for zombies
  rect(width/15, (height/15) * 8, barLength, height/13); //for doctors

  //humam population
  fill(255, 0, 0);
  text("People: " + people, width/15, (height/15) * 1.4);
  rect(width/15, (height/15) * 2, barLength * people / total, height/13);

  //zombie population
  fill(255, 127, 0);
  text("Zombies: " + zombies, width/15, (height/15) * 4.4);
  rect(width/15, (height/15) * 5, barLength * zombies / total, height/13);
  
  //doctors cure
  fill(226, 247, 0);
  text("Cure Progress: " + curePercentage + "%", width/15, (height/15) * 7.4);
  rect(width/15, (height/15) * 8, barLength * curePercentage / 100, height/13);
  
  fill(255);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("Day", width/15 * 2, (height/15) * 11);
  text(days, width/15 * 2, (height/15) * 12.5);

  textAlign(LEFT, CENTER);
  textSize(23);
  text(event + "\n" + cureEvent, width/15 * 3, height/15 * 11.75);
}

void titleScreen()
{
  background(0);
  
  textAlign(CENTER, CENTER);
  textFont(himma);
  fill(255);
  text("ZOMBIE\nSIMULATOR", width/2, height * 0.4);
  textSize(20);
  text("CLICK TO START", width/2, height * 0.8);
  
  
  if(mousePressed)
  {
    currentScreen = 2;
  }
}

void endScores()
{
  if(people <= 50)
  {
    peopleLoss = people;
    people -= peopleLoss;
    event = "The zombies have destroyed the final people!\nThe zombies have taken over!!!\nClick to start over";
    if(!cureIsDone())
    {
      cureEvent = "If only the scientist had finished the cure.";
    } else
    {
      cureEvent = "It looks like the cure did not help.";
    }
    
  }
  
  if(zombies <= 50)
  {
    zombieLoss = zombies;
    zombies -= zombieLoss;
    event = "The humans have destroyed the final zombies!\nThey reclaim their world!!!\nClick to start over.";
    
    if(!cureIsDone())
    {
      cureEvent = "Looks like we didn't need the cure at all!";
    } else
    {
      cureEvent = "Thank the scientist for finishing the cure!";
    }
    
  }
}

void endScreen()
{
  drawDesign();
  currentScreen = 1;
}

void update()
{
  if (currentScreen == 1)
  {
    initialInfection();
    days = 1;
  }

  if (currentScreen == 2)
  {
    eventSelector();
    cureEventSelector();
    days++;
    if(winner())
    {
      currentScreen = 3;
    }
    
  }
  
  if (currentScreen == 3)
  {
    endScores();
  }
}

void render()
{
  if (currentScreen == 1)
  {
    titleScreen();
  }

  if (currentScreen == 2)
  {
    drawDesign(); 
  }
  
  if (currentScreen == 3)
  {
    endScreen();
  }
}
