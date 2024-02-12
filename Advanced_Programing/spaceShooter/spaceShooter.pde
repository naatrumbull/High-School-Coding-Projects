

int scene;
Button btnStart;
Button btnPlayAgain;
Hero hero;
PImage spaceShip;
PImage heart;
PImage shield;
PImage bonusShip;
PImage lightning;
ArrayList<GameObject> titleScreenObjects = new ArrayList<GameObject>();
ArrayList<GameObject> titleScreenObjectsTrash = new ArrayList<GameObject>();
ArrayList<GameObject> objects = new ArrayList<GameObject>();
ArrayList<GameObject> trash = new ArrayList<GameObject>();
ArrayList<Lives> lives = new ArrayList<Lives>();
float timer = 0;
TitleScreenHero titleHero; 
TitleScreenEnemy titleEnemy;


GameObject bonusBar;


void setup()
{
  fullScreen(); //OG 1000, 800
  btnStart = new Button(width/2, height*2/3, 100, 35, "Start");
  btnPlayAgain = new Button(width/2, height*2/3, 100, 35, "Play Again");
  hero = new Hero(width/2, height-100);
  hero.fillBox = false;
  objects.add(hero);
  spaceShip = loadImage("spaceShip.png");
  heart = loadImage("heart.png");
  bonusBar = new BonusBar();
  //objects.add(bonusBar);
  titleHero = new TitleScreenHero(350, 700);
  titleScreenObjects.add(titleHero);
  titleEnemy = new TitleScreenEnemy(400, 50);
  titleScreenObjects.add(titleEnemy);
  shield = loadImage("shield.png");
  bonusShip = loadImage("bonusShip.png");
  lightning = loadImage("lightning.png");
  
  prepareStartScreen();
  //prepareLoseScreen();
  
}

void draw()
{
  
  background(0);
  fill(225, 225, 0);
  textSize(20);
  textAlign(CENTER, CENTER);
  if(scene == 0) startScreen();
  else if (scene == 1) level1();
  else if (scene == 2) level2();
  else if (scene == 3) level3();
  else if (scene == 4) level4();
  else if (scene == 5) level5();
  else if (scene == 99) win();
  else if (scene == 100) lose();
  else displayReminder();
}

void displayReminder()
{
  background(255, 0, 0);
  text("You need to edit scenes in the draw function", width/2, height/2);
}
