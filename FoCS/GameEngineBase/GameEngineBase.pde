/****************************************************\
 
                    GameEngineBase
           (your main class - save as a new name!)
           
           // Last Updated 5/1/18
 
\****************************************************/

ArrayList<GameObject> objects;

void setup()
{
   size(900, 900);
   gameSetup();
   loadImages();
   noCursor();

   objects = new ArrayList<GameObject>();

   objects.add(new Player(width/2, height - 200));

   for (int x = 0; x < 15; x++)
   {
      objects.add(new EvilSquare(random(width), random(0, 100)));
   }
}

void draw()
{
   update();
   render();
}

void update()
{
   act();
   collisions();
   cleanUp();
}

void collisions()
{
   for (GameObject one : objects)
   {
      for (GameObject two : objects)
      {
         if (one.isCollision(two))
         {
            one.addCollision(two);
            two.addCollision(one);
         }
      }
   }
}

void act()
{
   for (int x = 0; x < objects.size (); x++)
   {
      objects.get(x).act();
   }
}

void cleanUp()
{
   for (int x = 0; x < objects.size (); x++)
   {
      objects.get(x).cleanUp();
   }
}

void render()
{
   background(0);
   
   for (int x = 0; x < objects.size (); x++)
   {
      objects.get(x).render();
   }
}
