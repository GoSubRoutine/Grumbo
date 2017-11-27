float X=250;  //Tracks Grumbo's position
float Y=250;
int r=188; //Changes Grumbo's skin color
int g=122;
int b=209;
int brow=0; //Changes Grumbo's eyes
int squint=2;
int damage=0; //Keeps track of how much damage Gumbo takes
int spawnTimer=0; //Keeps balls spawning on time
int obstacle_toggle=1; //Changes which ball spawns
float obstacle0x=0; //Tracks ball positions
float obstacle0y=0;
float obstacle1x=0; 
float obstacle1y=0;
float obstacle2x=0; 
float obstacle2y=0;
float backX=0; //Background tileing locations
float backY=0;
float obstacleSpeed=2; //Changes ball speed
int speedTimer=0; //Tracks how long until ball speed increases

void setup() { 
  size (500, 500);
  rectMode(CENTER);
}

void draw() {
  makeBackground();
  moveGrumbo();
  boundryCheck();
  drawGrumbo();
  ballSpawner();
  drawBalls();
  moveBall();
  increaseSpeed();
  hitboxCheck();
  damageEffect();
  resetBackground();
  //println(obstacleSpeed);
}

void makeBackground() {
  noStroke();
  for (backX=0; backX<520; backX=backX+20) { //creates backround
    for (backY=0; backY<520; backY=backY+20) {
      fill (random (235, 255));
      rect(backX, backY, 20, 20);
    }
    fill (random (235, 255));
    rect(backX, backY, 20, 20);
  }
}

void moveGrumbo() { //Moves the player
  if (keyPressed) {
    if (key=='w'||key=='W') {
      Y=Y-6;
    } else if (key=='a'||key=='A') {
      X=X-6;
    } else if (key=='s'||key=='S') {
      Y=Y+6;
    } else if (key=='d'||key=='D')
      X=X+6;
  }
}

void boundryCheck() { //keeps grumbo on screen
  if (X<50) { 
    X=50;
  } else if (X>450) {
    X=450;
  } else if (Y<77.5) {
    Y=77.5;
  } else if (Y>422.5) {
    Y=422.5;
  }
}

void drawGrumbo() { //Show's Grumbo on screen
  fill(r, g, b); //skin work
  ellipse(X, Y-52.5, 70, 50);
  triangle(X-35, Y-52.5, X-35, Y-22.5, X-45, Y-22.5);
  triangle(X+35, Y-52.5, X+35, Y-22.5, X+45, Y-22.5);
  rect(X, Y-37.5, 70, 30);
  triangle(X+35, Y-52.5, X+70, Y-37.5, X+35, Y-42.5);

  fill(116, 51, 144); //shirt work
  rect(X, Y, 90, 50);
  ellipse(X-45, Y, 10, 50);
  ellipse(X+45, Y, 10, 50);

  fill(96, 112, 245); //pants work
  rect(X, Y+36.5, 90, 25);
  rect(X-35, Y+55.5, 20, 15);
  rect(X+35, Y+55.5, 20, 15);

  fill(72, 58, 20); //misc. work onwards
  arc(X+10, Y-52.5, 5, 10, 0, squint*PI); //eye work
  arc(X+30, Y-52.5, 5, 10, 0, squint*PI);
  rect(X+10, Y-60+brow, 10, 2);
  rect(X+30, Y-60+brow, 10, 2);

  rect(X-35, Y+67, 20, 10); //shoes work
  rect(X+35, Y+67, 20, 10);
  ellipse(X+45, Y+67, 20, 10);
  ellipse(X-25, Y+67, 20, 10);

  rect(X-27.5, Y, 5, 30); //arm work
  rect(X-35, Y+12.5, 10, 5);

  quad(X-35, Y-77.5, X, Y-77.5, X-5, Y-57.5, X-40, Y-57.5); //hair work
  quad(X+35, Y-77.5, X, Y-77.5, X+5, Y-62.5, X+40, Y-62.5);

  noFill(); //mouth work
  stroke(72, 58, 20);
  arc(X+20, Y-35, 20, 10, -PI, 0);
}

void ballSpawner() {
  spawnTimer=spawnTimer+1; //counts to 90 frames to move the next ball
  if (spawnTimer>=(90/(obstacleSpeed*.5))) {
    spawnTimer=0;
    if (obstacle_toggle==1) { //changes ball location and queues next ball
      obstacle0x=500;
      obstacle0y=random(0, 500);
      obstacle_toggle=2;
    } else if (obstacle_toggle==2) {
      obstacle1x=500;
      obstacle1y=random(0, 500);
      obstacle_toggle=3;
    } else if (obstacle_toggle==3) {
      obstacle2x=500;
      obstacle2y=random(0, 500);
      obstacle_toggle=1;
    }
  }
}

void drawBalls() { //draws in 3 balls
  fill(255, 0, 0); 
  ellipse (obstacle0x, obstacle0y, 10, 10);
  ellipse (obstacle1x, obstacle1y, 10, 10);   
  ellipse (obstacle2x, obstacle2y, 10, 10);
}

void moveBall() { //keeps moving obstacles left
  obstacle0x=obstacle0x-obstacleSpeed; 
  obstacle1x=obstacle1x-obstacleSpeed;
  obstacle2x=obstacle2x-obstacleSpeed;
}

void increaseSpeed() { //Increases speed every 260 frames (3 balls)
  speedTimer=speedTimer+1;
  if (speedTimer==360) {
    speedTimer=0;
    obstacleSpeed=obstacleSpeed+.25;
  }
  constrain(obstacleSpeed, 2, 14);
}

void hitboxCheck() { //detects when Grumbo is hit by a ball
  if ((obstacle0x+50>X&&obstacle0x-50<X)&&(obstacle0y+77.5>Y&&obstacle0y-77.5<Y)) { //lets the balls hurt Grumbo
    obstacle0x=-200;
    damage=damage+1;
  } else if ((obstacle1x+50>X&&obstacle1x-50<X)&&(obstacle1y+77.5>Y&&obstacle1y-77.5<Y)) {
    obstacle1x=-200;
    damage=damage+1;
  } else if ((obstacle2x+50>X&&obstacle2x-50<X)&&(obstacle2y+77.5>Y&&obstacle2y-77.5<Y)) {
    obstacle2x=-200;
    damage=damage+1;
  }
}

void damageEffect() {
  if (damage==1) { //Shows Angry Grumbo when hit by one ball
    r=230;
    g=20;
    b=20;
    brow=7;
    squint=1;
  } else if (damage>=2) { //Shows Dieing Grumbo when hit by two balls
    X=250;
    Y=250;
    r=r-1;
    obstacle0x=-200;
    obstacle1x=-200;
    obstacle2x=-200;
  }
  if (r<=0) { //Closes game when Grumbo is dead.
    exit();
  }
}

void resetBackground() { //resets background so it can run the tileing again
  backY=0;
  backX=0;
}