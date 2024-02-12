int randomCureRoll;

void cureEventSelector()
{
  if (curePercentage < 100)
  {
    randomCureRoll = (int)random(0, 100);

    if (randomCureRoll < 50)
    {
      normalDay();
    } else if (randomCureRoll >= 50 && randomCureRoll < 60)
    {
      breakingDevelopment();
    } else if (randomCureRoll >= 60 && randomCureRoll < 70)
    {
      goodDay();
    } else if (randomCureRoll >= 70 && randomCureRoll < 80)
    {
      badDay();
    } else
    {
      zombiesRuinResearch();
    }


    if (curePercentage < 0) 
    {
      curePercentage = 0;
    } else if (curePercentage > 100)
    {
      cureCompleted();
    }
    
  } else 
  {
    cureCompleted();
  }
}

/**** Various Cure Events ******/

void zombiesRuinResearch()
{
  curePercentage -= 10;
  cureEvent = "Zombies destroy research!\nThe cure is delayed 10%.";
}

void breakingDevelopment()
{
  curePercentage += 20;
  cureEvent = "Incredible breakthrough!\nThe cure is 20% closer to being completed.";
}

void normalDay()
{
  curePercentage += 5;
  cureEvent = "A normal day for Scientist.\nThe cure is 5% closer to being completed.";
}

void goodDay()
{
  curePercentage += 10;
  cureEvent = "A pretty good day for Scientist.\nThe cure is 10% closer to being completed.";
}

void badDay()
{
  cureEvent = "Slow day for Scientist.\nNo progress on the cure is made today.";
}

void cureCompleted()
{
  curePercentage = 100;
  cureEvent = "Scientist complete the cure!\nFor now on, Zombies can't infect people but they can still kill them!";
}
