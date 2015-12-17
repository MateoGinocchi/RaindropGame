class Catcher {
  //declare variables
  PVector loc;
  int diam;

  //constructor
  Catcher(int tDiam) {
    diam = tDiam;
    loc = new PVector(mouseX, mouseY); //location is mouse x mouse y
  }
  void show() {
    fill(0); //set color black
    noStroke(); //set no stroke
    ellipse(loc.x, loc.y, diam, diam); //draw ellipse
  }
  void update() {
    loc.set(mouseX,mouseY); //update the location to mouse x and y
  }
}