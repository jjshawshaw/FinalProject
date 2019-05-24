class Stick extends Thing implements Displayable, Moveable {
  float dir;
  CueBall cBall;
  PVector cVect;
  boolean firing;
  public Stick(CueBall c) {
    x = width / 2;
    y = height / 2;
    this.dir = 0;
    cBall = c;
    cVect = new PVector(x - cBall.x, y - cBall.y);
    cVect.limit(300);
    firing = false;
  }
  void move() {
    x = mouseX; 
    y = mouseY;
    cVect = new PVector(x - cBall.x, y - cBall.y);
    cVect.limit(200);
    if (!firing && mousePressed && cBall.xv == 0 && cBall.yv == 0) firing = true;
    else if (firing && !mousePressed) {
      firing = false;
      cBall.xv = -(cVect.x) / 5;
      cBall.yv = -(cVect.y) / 5;
    }
  }
  
  void display() {
    if (cBall.xv == 0 && cBall.yv == 0){
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
  void display(String file){
    if (cBall.xv == 0 && cBall.yv == 0){
      pushMatrix();
      translate(cBall.x, cBall.y);
      rotate(cVect.heading());
      fill(160, 42, 42);
      rect(20, -3.5, 200, 7);
      fill(255);
      rect(20, -3.5, 7, 7);
      popMatrix();
    }
  }
}
