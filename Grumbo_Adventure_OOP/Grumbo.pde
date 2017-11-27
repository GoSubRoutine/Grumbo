class Grumbo {
  float X=250;  //Tracks Grumbo's position
  float Y=250;
  int r=188; //Changes Grumbo's skin color
  int g=122;
  int b=209;
  int brow=0; //Changes Grumbo's eyes
  int squint=2;
  int damage=0; //Keeps track of how much damage Gumbo takes
  void move() { //Moves the player
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
  void boundry() { //keeps grumbo on screen
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
  void display() { //Show's Grumbo on screen
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
  void checkDamage() {
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
      b1.obstacleX=-200;
      b2.obstacleX=-200;
      b3.obstacleX=-200;
    }
    if (r<=0) { //Closes game when Grumbo is dead.
      exit();
    }
  }
}