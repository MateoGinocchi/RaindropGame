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
  void display() {
    fill(255);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }
  void fall() {
    loc.add(vel);
    vel.add(acc);
  }
  void reset() {
    if (loc.y+diam/2>=height) {
      loc.y = 0;
      loc.add(vel);
      vel = new PVector(0, 0);
      vel.add(acc);
    }
  }
  boolean isInContactWith(PVector a) {
      return a.dist(loc)<=diam/2;
  }
}