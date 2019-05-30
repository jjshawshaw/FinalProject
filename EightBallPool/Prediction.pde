class Prediction extends Thing implements Displayable {
  Stick s;
  CueBall cBall;
  Prediction(Stick stk) {
    s = stk;
    cBall = stk.cBall;
    x = cBall.x;
    y = cBall.y;
  }
  void display() {
    if (s.firing) {
      boolean collided = false;
      x = cBall.x;
      y = cBall.y;
      while (!collided) {
        x -= s.cVect.x/100;
        y -= s.cVect.y/100;
        for (Wall w : Walls) {
          if (w.isTouching(this)) { 
            collided = true;
            stroke(0);
            line(cBall.x, cBall.y, x, y);
          }
        }
        for (Hole h : hole) {
          if (h.isTouching(this)) { 
            collided = true;
            stroke(0);
            line(cBall.x, cBall.y, x, y);
          }
        }
        for (Ball b : Balls) {
          if (b.isTouching(this)) {
            collided = true;
            stroke(0);
            line(cBall.x, cBall.y, x, y);
          }
        }
      }
    }
  }
}