//Change only this variable! Please change the number!!
final int input = 15;

//Don't change anything else
int output()
{
  int store = input;
  
  for(int i = 1; i < input; i++)
  {
    store = store * i;
  }
  
  return store;
}

PFont impact;
String equation()
{
  String store = "Equation:\n" + input;
  
  for(int i = input -1 ; i > 0; i--)
  {
    store = store + " x " + i;
  }
  
  return store;
}


void setup()
{
  size(800, 200);
  impact = createFont("impact", 20);
  textAlign(LEFT, CENTER);
  println("Input: " + input);
  println("Output: " + output());
  println(equation());
}

void draw()
{
  background(46, 177, 255);
  textAlign(LEFT, CENTER);
  textFont(impact);
  
  fill(0);
  text("Input: " + input + "\nOutput: " + output(), width/10, (height/10) * 2);
  text(equation(), width/10, (height/10) * 6);
}
