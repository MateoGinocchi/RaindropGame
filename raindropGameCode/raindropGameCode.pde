int count = 50; //initialize a count variable
PVector mouse;   //declare a P
//Raindrop r;      //declare a new Raindrop called r
Raindrop[] r = new Raindrop[count]; //declare the array



void setup() {
  size(800, 600); //set a size for canvas
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  int i = 0; //declare and initialize i
  while (i<count) { //while new variable is less than count, initialize new raindrop parameters
    r[i] = new Raindrop(random(width),0);   //Initialize r. The parameters used are the initial x and y positions
    i++;
  }
}

void draw() {
  background(0, 200, 255); //set a background each frame
  for (int j=0; j<count; j++) { //while j is less than count, perform the functions listed
    mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
    r[j].display();      //display the raindrop
    r[j].fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    if (r[j].isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r[j].reset();                         //if it is, reset the raindrop
    }
    if (r[j].loc.y > height + r[j].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r[j].reset();                           //if it does, reset the raindrop
    }
  }
}