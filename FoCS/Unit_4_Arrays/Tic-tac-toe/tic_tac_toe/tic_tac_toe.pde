int[][] gridData = {
  {0, 0, 0}, 
  {300, 0, 0}, 
  {600, 0, 0}, 
  {0, 300, 0}, 
  {300, 300, 0}, 
  {600, 300, 0}, 
  {0, 600, 0}, 
  {300, 600, 0}, 
  {600, 600, 0}, 
};

int getMouseIndex;
int timer;
int checker;
PFont impact;
String token;

boolean hasWon()
{
  for (int t = 1; t < 3; t++)
  {
    for (int i = 0; i < 7; i += 3)
    {
      if (gridData[i][2] == t && gridData[i + 1][2] == t && gridData[i + 2][2] == t)
      {
        return true;
      }
    }

    for (int i = 0; i <= 2; i++)
    {
      if (gridData[i][2] == t && gridData[i + 3][2] == t && gridData[i + 6][2] == t)
      {
        return true;
      }
    }

    if (gridData[0][2] == t && gridData[4][2] == t && gridData[8][2] == t)
    {
      return true;
    }

    if (gridData[2][2] == t && gridData[4][2] == t && gridData[6][2] == t)
    {
      return true;
    }
  }

  return false;
}

boolean noWinner()
{
  for (int i = 0; i < gridData.length; i++)
  {
    if (gridData[i][2] == 0)
    {
      return false;
    }
  }

  return true;
}

void setup()
{
  size(900, 900);
  textAlign(CENTER, CENTER);
  impact = createFont("impact", 190);
  timer = 0;
  checker = (int)random(1, 3);
  drawGrid();
}

void draw()
{
  if (timer > 0)
  {
    timer--;
  }

  if (timer == 0 && mousePressed)
  {
    update();
    render();

    timer = 30;
  }
}

void update()
{ 
  if (!hasWon() && !noWinner())
  {
    getMouseIndex();
    selectToken();
  }
}

void render()
{
  drawGrid();
  drawToken();
  displayWinner();
}

void drawGrid()
{
  fill(255, 0, 0);
  for (int i = 0; i < gridData.length; i++)
  {
    rect(gridData[i][0], gridData[i][1], width/3, height/3);
  }
}

void drawToken()
{
  fill(0, 0, 0);
  textFont(impact);
  for (int i = 0; i < gridData.length; i++)
  {
    if (gridData[i][2] == 1)
    {
      token = "X";
    } else if (gridData[i][2] == 2)
    {
      token = "O";
    } else
    {
      token = "";
    }
    text(token, gridData[i][0] + width/6, gridData[i][1] + height/6);
  }
}

void getMouseIndex()
{
  getMouseIndex = mouseX / (width/3);

  if (mouseY > 300 && mouseY <= 600)
  {
    getMouseIndex += 3;
  } else if (mouseY > 600)
  {
    getMouseIndex += 6;
  } else
  {
    return;
  }
}

void selectToken()
{
  if (gridData[getMouseIndex][2] == 0)
  {
    checker++;
    if (checker % 2 == 0)
    {
      gridData[getMouseIndex][2] = 1;
    } else if (checker % 2 == 1)
    {
      gridData[getMouseIndex][2] = 2;
    }
  }
}

void displayWinner()
{
  if (hasWon())
  {
    textSize(155);
    fill(0, 255, 0);
    if (checker % 2 == 0)
    {
      text("X is the\nWinner!", width/2, height/2);
    } else if (checker % 2 == 1)
    {
      text("O is the\nWinner!", width/2, height/2);
    }
  }

  if (noWinner() && !hasWon())
  {
    fill(0, 255, 0);
    textSize(100);
    text("It's a tie!\nTime for a rematch!", width/2, height/2);
  }
}
