class Ball {
  float target;
  float obstacleX=0; //Tracks ball positions
  float obstacleY=0;
  int spawnTimer=0; //Keeps balls spawning on time
  float obstacleSpeed=2; //Changes ball speed
  int speedTimer=0; //Tracks how long until ball speed increases
  Ball (float targtemp) {
    target=targtemp;
  }

  void spawn() {
    spawnTimer=spawnTimer+1; //counts to 90 frames to move the next ball
    if (spawnTimer==(target/(obstacleSpeed*.5))) {
      obstacleX=500;
      obstacleY=random(0, 500);
    }
  }
  void resetTimer() {
    if (spawnTimer>=(270/(obstacleSpeed*.5))) {
      spawnTimer=0;
    }
  }
  void display() { //draws in ball
    fill(255, 0, 0); 
    ellipse (obstacleX, obstacleY, 10, 10);
  }
  void move() {//keeps moving obstacles left
    obstacleX=obstacleX-obstacleSpeed;
  }
  void speed() { //Increases speed every 360 frames (3 balls)
    speedTimer=speedTimer+1;
    if (speedTimer==360) {
      speedTimer=0;
      obstacleSpeed=obstacleSpeed+.25;
    }
    constrain(obstacleSpeed, 2, 14);
  }
  void hitbox() { //detects when Grumbo is hit by a ball
    if ((obstacleX+50>gr.X&&obstacleX-50<gr.X)&&(obstacleY+77.5>gr.Y&&obstacleY-77.5<gr.Y)) { //lets the balls hurt Grumbo
      obstacleX=-200;
      gr.damage=gr.damage+1;
    }
  }
}