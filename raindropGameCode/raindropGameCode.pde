int count = 50;   //initialize a count variable
int score = 0;    //declare and initialize a value for the good score
int bad = 0;      //declare and initialize a value for the bad score
PVector mouse;    //declare a mouse vector
Catcher c;        //declare a catcher of the catcher class

ArrayList<Raindrop> drop = new ArrayList<Raindrop>(); //declare an array list


void setup() {
  size(800, 600); //set a size for canvas


  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  c = new Catcher(50);                  //initialize a catcher
}

void draw() {
  if (bad>score) {                          //if the bad score is greater than the good score, go to game over
    background(0);                          //set background to black
    fill(255, 0, 0);                        //set fill to red
    textSize(100);                          //set text size
    textAlign(CENTER);                      //align text
    text("GAME OVER", width/2, height/2);   //display text "GAME OVER"
    text(score, width/2, (height/2) + 100); //display good score
  } else {
    background(0, 200, 255);                       //set a background each frame
    drop.add(new Raindrop(random(0, width), 0) );  //initialize the array list
    textSize(40);                                  //set a text size
    fill(0);                                       //set a fill
    textAlign(CENTER);                             //align text 
    text(score, width/2, 70);                      //display the good score
    text(bad, width/2, height-10);                 //display the bad score

    for (int j = drop.size() -1; j>=0; j--) { //draw the objects as the size of the array increases
      Raindrop rain = drop.get(j);            //declare a raindrop for the array
      rain.display();                         //display "rain"
      rain.fall();                            //make "rain" fall
      if (rain.isInContactWith(c)) {          //if "rain" touches the catcher, reset the raindrop and add 1 to the good score
        rain.reset();
        score+=1;
      }
      if (rain.loc.y > height + rain.diam/2) {//if "rain" goes off the bottom of the screen, reset the raindrop and add 1 to the bad score
        rain.reset();
        bad+=1;
      }
    }
    println(score);
    c.show();    //draw catcher ellipse
    c.update();  //move catcher according to mouse
  }
}