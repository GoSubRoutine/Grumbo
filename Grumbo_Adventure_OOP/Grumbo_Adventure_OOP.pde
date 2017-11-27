Grumbo gr;
Background bg;
Ball b1;
Ball b2;
Ball b3;
Display d;

void setup() { 
  size (500, 500);
  rectMode(CENTER);
  gr = new Grumbo();
  bg = new Background();
  b1 = new Ball(90);
  b2 = new Ball(180);
  b3 = new Ball(270);
  d = new Display();
}

void draw() {
  bg.refresh();
  gr.move();
  gr.boundry();
  gr.display();
  b1.spawn();
  b2.spawn();
  b3.spawn();
  b1.resetTimer();
  b2.resetTimer();
  b3.resetTimer();
  b1.display();
  b2.display();
  b3.display();
  b1.move();
  b2.move();
  b3.move();
  b1.speed();
  b2.speed();
  b3.speed();
  b1.hitbox();
  b2.hitbox();
  b3.hitbox();
  gr.checkDamage();
  bg.reset();
}