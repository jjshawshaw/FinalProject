class Stick extends Thing implements Displayable, Moveable{
  float dir;
  CueBall cBall;
  PVector cVect;
  public Stick(CueBall c){
    x = width / 2;
    y = height / 2;
    this.dir = 0;
    cBall = c;
    cVect = new PVector(x - cBall.x, y - cBall.y);
  }
  void move(){
    x = mouseX; 
    y = mouseY;
    cVect = new PVector(x - cBall.x, y - cBall.y);
  }
  void display(){
    pushMatrix();
    translate(cBall.x, cBall.y);
    rotate(cVect.heading());
    fill(160, 42, 42);
    rect(20, 0, 200, 7);
    fill(255);
    rect(20 , 0, 7, 7);
    popMatrix();
  }
}
