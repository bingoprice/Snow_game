PVector mouse ; 
ArrayList<Snow> snowballs = new ArrayList<Snow>();
/**********
 int num = 50;  
 Snow[] r = new Snow[num];  //declare a new Snow called r
 *****************/
Catcher c;
float s;





void setup() {
  size(1200, 800);
  mouse = new PVector(); //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  c = new Catcher(mouseX, mouseY);
  snowballs.add(new Snow(random(width), random(height)));
  frameRate(25);
}

void draw() {

  println(snowballs.size());
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0, 200, 255);
  c.display();
  if (snowballs.size() < 5) {
    snowballs.add(new Snow(random(width), random(height)));
  }
  for (int j = snowballs.size()-1; j >= 0; j--) {
    Snow r = snowballs.get(j);
    r.fall();         //make the Snow fall. It should accelerate as if pulled towards the ground by earth's gravity
    r.display(); //display the Snow
    if (r.isDead()) {
      snowballs.remove(j);
    }

    if (r.loc.y > height + r.diam/2) {     //check to see if the Snow goes below the bottom of the screen
      r.reset();                           //if it does, reset the Snow
    }
  }
}
//void score() {
  //if (s == 20) {
    //gameOverPage();
  //}