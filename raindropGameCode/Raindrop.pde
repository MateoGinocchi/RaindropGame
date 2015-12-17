class Raindrop {
  //declare variables
  PVector loc, vel, acc;
  int diam; 

  //constructor and initialize
  Raindrop(float x, int y) {
    loc = new PVector(x, y);
    diam = 30;
    vel = new PVector(0, 0);
    acc = new PVector(0, .1);
  }
  void display() { //draw the object
    fill(255);  //set a fill
    noStroke(); //set no stroke
    ellipse(loc.x, loc.y, diam, diam); //draw the ellipse
  }
  void fall() { //add velocity and acceleration to the object
    loc.add(vel); //add velocity to the location vector
    vel.add(acc); //add acceleration to the velocity vector
  }
  void reset() { //returns object to the top of canvas
    loc.y = 0; //set y coordinate to zero
    vel = new PVector(0,0); //reset velocity
    vel.add(acc); //re-add acceleration to velocity
    
  }
  boolean isInContactWith(PVector a) { //create a bolean to check if the created vector is within the boundary of the circle
      return a.dist(loc)<=diam/2; //if it is less than return a value for true
  }
}