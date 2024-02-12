

final color PURPLE = color(255,0,255);
final color RED = color(255,50,50);
final color DARK_RED = color(255, 125, 0);
final color ORANGE = color(255,150,0);
final color GREEN_LIGHT = color(150, 255, 150);
final color GREEN = color(50, 200, 50);
final color GREEN_DARK = color(0, 50, 0);
final color BLUE = color(50,100,255);
final color DARK_BLUE = color(0, 50, 255);
final color AQUA = color(50,200,255);
final color YELLOW = color(255,255,100);
final color YELLOW_DARK = color(204, 204, 0);
final color BLACK = color(0);
final color WHITE = color(255);
final color GREY_DARK = color(75);
final color GREY = color(150);
final color GREY_LIGHT = color(205);
final color BEEPER_COLOR = color(25);

final int NUM_ROWS = 14;
final int NUM_COLS = 26;
final int CELL_SIZE = 40;
final int EDGE_SIZE = 8;
final int ROBOT_SIZE = CELL_SIZE - EDGE_SIZE;


final int CID_TEAM_ONE = 1;
final int CID_TEAM_TWO = 2;


World world;
Robot r;

int timer;

PFont basicFont;
PFont robotFont;
PFont displayFontLarge;
PFont displayFontMedium;
PFont displayFontSmall;


boolean commandThreadStarted = false;
CommandThread c;

void init()
{
     c = new CommandThread();
   basicFont = createFont("Arial Black", CELL_SIZE * .5);
   robotFont = createFont("Arial Black", CELL_SIZE * ROBOT_SIZE * .01);
   displayFontLarge = createFont("Arial Black", 28);
   displayFontMedium = createFont("Consolas", 20);

   displayFontSmall = createFont("Consolas", 14);

   world = new World();
   background(0);
}

void commands()
{
   r.go();
}
void loadWorld(String filename)
{
   world.loadWorld(filename);
   r.setWorld(world);
   r.setStart(world.getStartingX(), world.getStartingY(), world.getStartingDirection(), world.getStartingBeepers());
}

void createRobot(Robot rob)
{
   r = rob;
}
void update()
{
   if(!commandThreadStarted)
   {
      c.start();
       commandThreadStarted = true;  
   }
   
   timer++;


   

   background(0);
   drawWorld();
   displayInfo();
   r.render();
   
   if(timer == 1)
   {
       saveFrame("start");  
   }
   
   if(keyPressed)
   {
       saveFrame("end");  
   }
   
}

void displayInfo()
{
   displayBackgroundBar();
   displayScenarioInfo();
   displayStats();
}

void displayBackgroundBar()
{
   noStroke();

   fill(0);
   rect(0, height-CELL_SIZE*2, width, CELL_SIZE*2);

   fill(30);
   rect(0, height-CELL_SIZE*2+4, width, CELL_SIZE*2-4);
}

void displayStats()
{
   int x = 600;
   int y = height - CELL_SIZE*2+10;
   textAlign(CENTER, TOP);

   fill(YELLOW);
   textFont(displayFontLarge);
   text((int) r.countMyActions(), x, y);
   textFont(displayFontMedium);
   text("STEPS", x, y+40);

   fill(WHITE);
   textFont(displayFontLarge);
   text((int) r.countMyBeepers(), x + 100, y);
   textFont(displayFontMedium);
   text("BEEPERS", x + 100, y+40);
}

void displayScenarioInfo()
{
   textAlign(LEFT, TOP);


   int x = 10;
   int y = height - CELL_SIZE*2+10;


   textFont(displayFontMedium);

   fill(YELLOW);
   text(world.getScenario(), x, y);

   textFont(displayFontSmall);

   fill(WHITE);
   text(world.getObjective(), x, y + 30);

   fill(GREEN_LIGHT);
   text(world.getChallenge(), x, y + 50);
}

void drawWorld()
{
   for (int x = 0; x < NUM_COLS; x++)
   {
      for (int y = 0; y < NUM_ROWS; y++)
      {
         world.getCell(x, y).draw();
      }
   }
}

class CommandThread extends Thread
{
   
   CommandThread()
   {
      
      
   }
   
   public void run()
   {
           commands();
   }
}

/******************************************** CLASS OBJECT **********************************************/

class Object
{  
   protected int x;
   protected int y;
   
   Object(int x, int y)
   {
      this.x = x;
      this.y = y;
   }

   boolean inBounds()
   {
      return x > 0 && x < width && y > 0 && y < height;
   }
   
}

/******************************************** CLASS ROBOT **********************************************/

abstract class Robot extends Object
{
  private World w;
  private int numBeepers;
  private int numActions;
  private color primary;
  private color secondary;
  private color border;
  private char letter;
  private String facing = "east";
  private boolean crashed = false;
  
  abstract void go();


  public color getColorPrimary()
  {
    return primary;
  }

  public color getColorSecondary()
  {
    return secondary;
  }

  public color getColorBorder()
  {
    return border;
  }

  protected Robot()
  {
    super(0, 0);
  }

  public void setStart(int x, int y, String direction, int beepers)
  {
    this.x = x;
    this.y = y;
    if(direction.equals("east") || direction.equals("west") || direction.equals("north") || direction.equals("south"))
    {
          facing = direction;
    }
    else
    {
        int r = (int) random(0, 4);
        
        if(r == 0)
        {
           facing = "north";
        }
        else if(r == 1)
        {
           facing = "east"; 
        }
        else if(r == 2)
        {
           facing = "south"; 
        }
        else
        {
           facing = "west"; 
        }
        
    }
    

    numBeepers = beepers;
  }
  public void setWorld(World w)
  {
    this.w = w;
  }

  void setLetter(char letter)
  {
    this.letter = letter;
  }

  void setColorPrimary(color primary)
  {
    this.primary = primary;
  }

  void setColorSecondary(color secondary)
  {
    this.secondary = secondary;
  }

  void setColorBorder(color border)
  {
    this.border = border;
  }

  public boolean frontIsClear()
  {
    if (facingEast() && lookEast())
    {
      return true;
    } else if (facingWest() && lookWest())
    {
      return true;
    } else if (facingNorth() && lookNorth())
    {
      return true;
    } else if (facingSouth() && lookSouth())
    {
      return true;
    } else
    {
      return false;
    }
  }


  private boolean canJumpEast()
  {
     return x < NUM_COLS - 2 && world.canShoot(x+1, y) && world.canMove(x+2, y);
  }

  private boolean lookEast()
  {
    return x < NUM_COLS - 1 && world.canMove(x+1, y);
  }

  private boolean canJumpWest()
  {
    return x > 1 && world.canShoot(x-1, y) && world.canMove(x-2, y);
  }

  private boolean lookWest()
  {
    return x > 0 && world.canMove(x-1, y);
  }

  private boolean canJumpSouth()
  {
    return y < NUM_ROWS - 2 && world.canShoot(x, y+1) && world.canMove(x, y+2);
  }

  private boolean lookSouth()
  {
    return y < NUM_ROWS - 1 && world.canMove(x, y+1);
  }

  private boolean canJumpNorth()
  {
    return y > 1 && world.canShoot(x, y-1) && world.canMove(x, y-2);
  }

  private boolean lookNorth()
  {
    return y > 0 && world.canMove(x, y-1);
  }

  public boolean isOnA()
  {
    return w.getCell(x, y).isA();
  }

  public boolean isOnB()
  {
    return w.getCell(x, y).isB();
  }
  
  public boolean isOnC()
  {
    return w.getCell(x, y).isC();
  }
  
  public boolean isOnD()
  {
    return w.getCell(x, y).isD();
  }
  
  public void takeAction()
  {
       try
       {
             CommandThread.sleep(DELAY);
             numActions++;
       }
       catch(Exception e)
       {
          
       }
  }

  public void move()
  {
    if (crashed)
    {
         return;
    }
    else
    {
      takeAction();
      
    }
     
    if (facing.equals("east"))
    {
      if (lookEast())
      {
        println("Moving East");
        x = x + 1;
      } else
      {
        crash();
        println("*** Error: Can't Go East ***");
      }
    } else if (facing.equals("west") )
    {
      if (lookWest())
      {
        println("Moving West");
        x = x - 1;
      } else
      {
        crash();
        println("*** Error: Can't Go West ***");
      }
    } else if (facing.equals("north"))
    {
      if (lookNorth())
      {
        println("Moving North");
        y = y - 1;
      } else
      {
        crash();
        println("*** Error: Can't Go North ***");
      }
    } else if (facing.equals("south"))
    {

      if (lookSouth())
      {
        println("Moving South");
        y = y + 1;
      } else
      {
        crash();
        println("*** Error: Can't Go South ***");
      }
    } else
    {
      println("*** Error: Not Facing a Valid Direction ***");
    }    
  }
  
  
  public void jump()
  {
    if (crashed)
    {
         return;
    }
    else
    {
      // A jump counts as three actions and slows the game a little extra
       try
       {
             CommandThread.sleep((long) (DELAY * 1.5));
             numActions += 3;
       }
       catch(Exception e)
       {
          
       }
    }
     
     
    if (facing.equals("east"))
    {
      if (canJumpEast())
      {
        println("Jumping East");
        x = x + 2;
      } else
      {
        crash();
        println("*** Error: Can't Jump East ***");
      }
    } else if (facing.equals("west") )
    {
      if (canJumpWest())
      {
        println("Jumping West");
        x = x - 2;
      } else
      {
        crash();
        println("*** Error: Can't Jump West ***");
      }
    } else if (facing.equals("north"))
    {
      if (canJumpNorth())
      {
        println("Jumping North");
        y = y - 2;
      } else
      {
        crash();
        println("*** Error: Can't Jump North ***");
      }
    } else if (facing.equals("south"))
    {

      if (canJumpSouth())
      {
        println("Jumping South");
        y = y + 2;
      } else
      {
        crash();
        println("*** Error: Can't Jump South ***");
      }
    } else
    {
      println("*** Error: Not Facing a Valid Direction ***");
    }
    
    
  }


  public void crash()
  {
    setColorPrimary(GREY);
    setColorSecondary(GREY_DARK);
    setColorBorder(BLACK);
    crashed = true;
  }

  public void turnLeft()
  {
    if (crashed)
    {
         return;
    }
    else
    {
      takeAction();
    }
     
     
    if (facingNorth())
    {
      println("Turning West");
      facing = "west";
    } else if (facingWest())
    {
      println("Turning South");
      facing = "south";
    } else if (facingSouth())
    {
      println("Turning East");
      facing = "east";
    } else if (facingEast())
    {
      println("Turning North");
      facing = "north";
    } else
    {
      println("*** Error: Not Facing a Valid Direction ***");
    }
  }


  public void pickBeeper()
  {
    if (crashed)
    {
         return;
    }
    else
    {
      takeAction();
    }
     
    if (!w.getCell(x, y).hasBeeper())
    {
      crash();
      System.out.println("*** Error: There are no beepers here ***");
    } else
    {
      numBeepers++;
      w.getCell(x, y).removeBeeper();
      System.out.println("Picking up a beeper (NumBeepers = " + countMyBeepers() + ")");
    }
  }

  public void putBeeper()
  {
    if (crashed)
    {
         return;
    }
    else
    {
      takeAction();
    }
     
    if (!hasBeeper())
    {
      crash();
      System.out.println("*** Error: I have no beepers! ***");
    } else
    {
      w.getCell(x, y).addBeeper();
      numBeepers--;
      System.out.println("Putting down a beeper (NumBeepers = " + countMyBeepers() + ")");
    }
  }

  public boolean onBeeper()
  {
    return w.getCell(x, y).hasBeeper();
  }

  public boolean hasBeeper()
  {
    return numBeepers > 0;
  }

  private int countMyBeepers()
  {
    return numBeepers;
  }

  private int countMyActions()
  {
    return numActions;
  }

  public boolean facingEast()
  {
    return facing.equals("east");
  }

  public boolean facingWest()
  {
    return facing.equals("west");
  }

  public boolean facingNorth()
  {
    return facing.equals("north");
  }

  public boolean facingSouth()
  {
    return facing.equals("south");
  }

  void render()
  {

    stroke(border);

    // CALCULATION & SETUP
    float triangleSize = 15;

    int myX = x * CELL_SIZE + EDGE_SIZE/2;
    int myY = y * CELL_SIZE + EDGE_SIZE/2;

    // BODY (PRIMARY COLOR)
    fill(primary);
    rect(myX, myY, ROBOT_SIZE, ROBOT_SIZE, 10);

    // ACCENT (SECONDARY COLOR)
    fill(secondary);
    triangle(myX, myY, myX + triangleSize, myY, myX, myY+triangleSize);                                              // top left
    triangle(myX+ROBOT_SIZE, myY, myX + ROBOT_SIZE - triangleSize, myY, myX+ROBOT_SIZE, myY+triangleSize);                // top right     
    triangle(myX, myY+ROBOT_SIZE, myX + triangleSize, myY+ROBOT_SIZE, myX, myY+ROBOT_SIZE-triangleSize);                  // bottom left     
    triangle(myX+ROBOT_SIZE, myY+ROBOT_SIZE, myX + ROBOT_SIZE - triangleSize, myY+ROBOT_SIZE, myX+ROBOT_SIZE, myY+ROBOT_SIZE-triangleSize);   // bottom right

    fill(primary);
    triangle(myX, myY, myX + triangleSize/2, myY, myX, myY+triangleSize/2);                                              // top left
    triangle(myX+ROBOT_SIZE, myY, myX + ROBOT_SIZE - triangleSize/2, myY, myX+ROBOT_SIZE, myY+triangleSize/2);                // top right     
    triangle(myX, myY+ROBOT_SIZE, myX + triangleSize/2, myY+ROBOT_SIZE, myX, myY+ROBOT_SIZE-triangleSize/2);                  // bottom left     
    triangle(myX+ROBOT_SIZE, myY+ROBOT_SIZE, myX + ROBOT_SIZE - triangleSize/2, myY+ROBOT_SIZE, myX+ROBOT_SIZE, myY+ROBOT_SIZE-triangleSize/2);   // bottom right

    pushMatrix();

    translate(myX+ROBOT_SIZE/2, myY+ROBOT_SIZE/2);


    // LETTER (SECONDARY COLOR)
    textFont(robotFont);
    textAlign(CENTER, CENTER);
    fill(border);
    ellipse(0, 0, ROBOT_SIZE/2+5, ROBOT_SIZE/2+5);

    if (facingWest())
    {
      rotate(radians(-90));
    } else if (facingEast())
    {
      rotate(radians(90));
    } else if (facingSouth())
    {
      rotate(radians(180));
    }

    fill(secondary);
    text(letter, -1, -4);

    popMatrix();

    // drawHitBox();
  }
}

/******************************************** CLASS CELL **********************************************/

class Cell
{
   int x;
   int y;
  boolean isA;
  boolean isB;
  boolean isC;
  boolean isD;
  
   PImage myBackground;
   PImage myObject;

   color c;

   boolean canMove = true;
   boolean canShoot = true;
   
   int numBeepers = 0;

   Cell(int x, int y)
   {
      this.x = x;
      this.y = y;
      c = color(200);
      //  randomSetup();
   }  
   
   
   void addBeeper()
   {
       numBeepers++;  
   }
   void addBeeper(int num)
   {
       numBeepers += num;
   }

   void removeBeeper()
   {
       numBeepers--;  
   }
   
   int countBeeper()
   {
       return numBeepers;  
   }
   
   boolean hasBeeper()
   {
       return numBeepers > 0;  
   }
   
   boolean isA()
   {
      return isA;
      
   }
   
   boolean isB()
   {
      return isB; 
   }
   
   boolean isC()
   {
      return isC; 
   }
   
   boolean isD()
   {
      return isD; 
   }
   void displayPass()
   {
      textFont(basicFont);
      textAlign(CENTER, CENTER);

      if (canMove())
      {
         text(".", x * CELL_SIZE + 25, y * CELL_SIZE + 25);
      } else
      {
         text("!", x * CELL_SIZE + 25, y * CELL_SIZE + 25);
      }
   }

   void draw()
   {
      if (myBackground != null)
      {
         noStroke();
         image(myBackground, x * CELL_SIZE, y*CELL_SIZE, CELL_SIZE, CELL_SIZE);
      } else
      {
         fill(200);
         noStroke();
         rect(x * CELL_SIZE, y * CELL_SIZE, CELL_SIZE, CELL_SIZE);
      }
      if (myObject != null)  
      {
        noStroke();
        image(myObject, x * CELL_SIZE, y*CELL_SIZE, CELL_SIZE, CELL_SIZE);
      }
      
      if(numBeepers > 0)
      {
         fill(BEEPER_COLOR);
         ellipse(x * CELL_SIZE + CELL_SIZE/2, y * CELL_SIZE + CELL_SIZE/2, CELL_SIZE-8, CELL_SIZE-8);
         textFont(robotFont);
         fill(255);
         textAlign(CENTER, CENTER);
         text(numBeepers, x * CELL_SIZE + CELL_SIZE/2-1, y * CELL_SIZE + CELL_SIZE/2-4);
      }

      // displayPass();
   }

   boolean canMove()
   {
      return canMove;
   }
   boolean canShoot()
   {
      return canShoot;
   }

   void setType(String type)
   {
      // OPEN TERRAIN
      if (type.equals("grass"))
      {
         int r = (int) (random(0, 4) + 1);
         myBackground = loadImage("tiles/grass" + r + ".png");
      } 
      if (type.equals("grassDark"))
      {
         int r = (int) (random(0, 4) + 1);
         myBackground = loadImage("tiles/grassDark" + r + ".png");
      }
      if (type.equals("dirt"))
      {
         int r = (int) (random(0, 4) + 1);
         myBackground = loadImage("tiles/dirt" + r + ".png");
      }  
      if (type.equals("tile"))
      {
         int r = (int) (random(0, 4) + 1);
         myBackground = loadImage("tiles/tile" + r + ".png");
      }  
      
      if (type.equals("floorWood"))
      {
         myBackground = loadImage("tiles/floorWood.png");
      }  
     
      if (type.equals("floorBrick"))
      {
         myBackground = loadImage("tiles/floorBrick.png");
      }  
      if (type.equals("aSpot"))
      {
         isA = true;
         myBackground = loadImage("tiles/aSpot.png");
      }  
      
      if (type.equals("bSpot"))
      {
         isB = true;
         myBackground = loadImage("tiles/bSpot.png");
      }  
      
      if (type.equals("cSpot"))
      {
         isC = true;
         myBackground = loadImage("tiles/cSpot.png");
      }  
      
      if (type.equals("dSpot"))
      {
         isD = true;
         myBackground = loadImage("tiles/dSpot.png");
      }  
      
      
      
      // BLOCKS MOVE
      if (type.equals("water"))
      {
         int r = (int) (random(0, 4) + 1);
         canMove = false;
         myBackground = loadImage("tiles/water" + r + ".png");
      }  
      
      
      // BLOCKS ALL
      if (type.equals("rockGrey"))
      {
         canMove = false;
         canShoot = false;
         int r = (int) (random(0, 5) + 1);
         myObject = loadImage("tiles/rockGrey" + r + ".png");
      }  
      if (type.equals("wallGrey"))
      {
         canMove = false;
         canShoot = false;
         myObject = loadImage("tiles/wallGrey.png");
      }  
      if (type.equals("wallWood"))
      {
         canMove = false;
         canShoot = false;
         myObject = loadImage("tiles/wallWood.png");

      } 
      
      if (type.equals("tree"))
      {
         canMove = false;
         canShoot = false;
         myObject = loadImage("tiles/tree.png");
      }
      
      if(type.equals("corn"))
      {
          canMove = false;
          canShoot = false;
          myObject = loadImage("tiles/corn.png");
         int r = (int) (random(0, 4) + 1);
         myBackground = loadImage("tiles/dirt" + r + ".png");
      }
      
            
      if(type.equals("cactus"))
      {
          canMove = false;
          canShoot = false;
          myObject = loadImage("tiles/cactus.png");
         int r = (int) (random(0, 4) + 1);
         myBackground = loadImage("tiles/dirt" + r + ".png");
      }
      
   }

   void removeObject()
   {
      myObject = loadImage("tiles/tree.png");
   }
}

/******************************************** CLASS WORLD **********************************************/

class World
{
  Cell[][] map;
  String name;
  String objective;
  String challenge;
  int startingX;
  int startingY;
  String startingDirection;
  int startingBeepers;
  
   World()
   {
      map = new Cell[NUM_COLS][NUM_ROWS];

      for (int x = 0; x < NUM_COLS; x++)
      {
         for (int y = 0; y < NUM_ROWS; y++)
         {
            map[x][y] = new Cell(x, y);
         }
      }

   }
   Cell getCell(int x, int y)
   {
      return map[x][y];
   }
   void loadWorld(String filename)
   {     
      loadMap(filename);
      
   }

   boolean canMove(int x, int y)
   {
      if (x >= 0 && x < NUM_COLS && y >= 0 && y < NUM_ROWS)
         return map[x][y].canMove();
      else
         return false;
   }

   boolean canShoot(int x, int y)
   {
      if (x >= 0 && x < NUM_COLS && y >= 0 && y < NUM_ROWS)
         return map[x][y].canShoot();
      else
         return false;
   }

   int getRandomX()
   {
      return (int) random(0, NUM_COLS);
   }

   int getRandomY()
   {
      return (int) random(0, NUM_ROWS);
   }
   
  String getObjective()
   {
     return objective;
   }
   
   String getChallenge()
   {
    return challenge; 
   }

  String getScenario()
  {
   return name; 
  }
  
  String getStartingDirection()
  {
    return startingDirection;
  }
  
  int getStartingBeepers()
  {
     return startingBeepers; 
  }
  
  int getStartingX()
{
   return startingX; 
}

int getStartingY()
{
 return startingY; 
}



   void loadMap(String filename)
   {
      String[] lines = loadStrings("maps/" + filename + ".txt");
      String[] terrainMap = new String[NUM_ROWS];
      String[] beeperMap = new String[NUM_ROWS];

      // Find where the BeeperMap starts, construct the standard map
      for (int y = 0; y < NUM_ROWS; y++)
      {
          terrainMap[y] = lines[y];  
      }
      
      // Create the beeper map
      for (int y = NUM_ROWS; y < NUM_ROWS * 2; y++)
      {
           beeperMap[y - NUM_ROWS] = lines[y];  
      }

      // Load the terrain map
      for (int y = 0; y < terrainMap.length; y++)
      {
         for (int x = 0; x < terrainMap[y].length (); x++)
         {
            setCell(x, y, terrainMap[y].charAt(x));
         }
      }
      
      // Load the beeper map
      for (int y = 0; y < beeperMap.length; y++)
      {
         for (int x = 0; x < beeperMap[y].length (); x++)
         {
            addBeeper(x, y, (beeperMap[y].charAt(x)-48));
         }
      }
      
      objective = lines[NUM_ROWS*2];
      challenge = lines[NUM_ROWS*2+1];
      name = filename.toUpperCase().replace("_", " ");
      
      startingX = Integer.parseInt(lines[NUM_ROWS*2+2]);
      startingY = Integer.parseInt(lines[NUM_ROWS*2+3]);
      startingDirection = lines[NUM_ROWS*2+4].trim();
      startingBeepers = Integer.parseInt(lines[NUM_ROWS*2+5]);

   }

   void addBeeper(int x, int y, int num)
   {
       map[x][y].addBeeper(num);  
   }

   void setCell(int x, int y, char c)
   {
      if (c == '\'') { 
         map[x][y].setType("grass");
      }  
      if (c == '\"') { 
         map[x][y].setType("grassDark");
      }
      if (c == 't') {  
         map[x][y].setType("grass"); 
         map[x][y].setType("tree");
      }
      if (c == 'T') {  
         map[x][y].setType("grassDark"); 
         map[x][y].setType("tree");
      }
      if (c == '.') { 
         map[x][y].setType("dirt");
      }
      if (c == 'w') { 
         map[x][y].setType("water");
      }
      if (c == ':') { 
         map[x][y].setType("tile");
      }
      if (c == 'W') { 
         map[x][y].setType("wallGrey");
      }
      if (c == 'a') { 
         map[x][y].setType("aSpot");
      }
     if (c == 'b') { 
         map[x][y].setType("bSpot");
      }
     if (c == 'c') { 
         map[x][y].setType("cSpot");
      }
     if (c == 'd') { 
         map[x][y].setType("dSpot");
      }
      if (c == '#') { 
         map[x][y].setType("wallWood");
      }
      
     if (c == '_') { 
         map[x][y].setType("floorWood");
      }
      
     if (c == '`') { 
         map[x][y].setType("floorBrick");
      }
      
      if(c == '&') {
         map[x][y].setType("corn");
      }
      
      if(c == '*') {
         map[x][y].setType("cactus");
      }
   }
}
