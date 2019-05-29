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
      while (!collided) {
        x -= s.cVect.x;
        y -= s.cVect.y;
        for (Wall w : Walls) {
          if (w.isTouching(this)) collided = true;
        }
      }
      stroke(0);
      line(cBall.x, cBall.y, x, y);
    }
  }
}