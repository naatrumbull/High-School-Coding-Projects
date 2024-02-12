final int DELAY = 10;

void setup()
{
   init();
   size(1040, 640);

   createRobot(new Maze());
   loadWorld("maize");

}

void draw()
{     
   update();
}
