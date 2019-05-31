class Stick extends Thing implements Displayable, Moveable {
  float dir;
  CueBall cBall;
  PVector cVect;
  boolean firing;
  boolean stopped;
  public Stick(CueBall c) {
    x = width / 2;
    y = height / 2;
    this.dir = 0;
    cBall = c;
    cVect = new PVector(x - cBall.x, y - cBall.y);
    firing = false;
    stopped = true;
  }
  void move() {
    x = mouseX; 
    y = mouseY;
    if (vel == 0.0) cVect = new PVector(x - cBall.x, y - cBall.y);
    stopped = true;
    for (Ball b : Balls) {
      if (b.xv != 0 || b.yv != 0) stopped = false;
    }
    if (!firing && mousePressed && stopped) { 
      firing = true;
    } else if (firing && !mousePressed) {
      firing = false;
      cVect.normalize();
      cBall.xv = -(cVect.x) * vel;
      cBall.yv = -(cVect.y) * vel;
      if (vel != 0) {
        turn++;
      }
      vel = 0;
    } else if (firing && mousePressed) {
      if (dist(mouseX, mouseY, cBall.x, cBall.y) > dist(pmouseX, pmouseY, cBall.x, cBall.y)) {
        if (vel < 50) vel += .5;
      } else if (dist(mouseX, mouseY, cBall.x, cBall.y) < dist(pmouseX, pmouseY, cBall.x, cBall.y)) {
        if (vel > 0) vel -= .5;
      }
    }
  }


  void display() {
    fill(0);
    text("cue velocity: " + vel, 50, 50);
    text("Turn: " + turn, 50, 40);
    if (stopped) {
      pushMatrix();
      translate(cBall.x, cBall.y);
      rotate(cVect.heading());
      fill(50, 0, 0);
      rect(20, -3.5, 300, 7);
      fill(255);
      rect(20, -3.5, 7, 7);
      fill(0);
      rect(20, -3.5, 2.5, 7);
      popMatrix();
    }
  }
}
