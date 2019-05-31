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
    //if (s.firing) {
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
            strokeWeight(5);
            line(cBall.x, cBall.y, x, y);
            noFill();
            ellipse(x, y, 20, 20);
            stroke(255);
            strokeWeight(3);
            line(cBall.x, cBall.y, x, y);
            noFill();
            ellipse(x, y, 20, 20);
            strokeWeight(1);
          }
        }
        for (Hole h : hole) {
          if (h.isTouching(this)) { 
            collided = true;
            stroke(0);
            strokeWeight(5);
            line(cBall.x, cBall.y, x, y);
            noFill();
            ellipse(x, y, 20, 20);
            stroke(255);
            strokeWeight(3);
            line(cBall.x, cBall.y, x, y);
            noFill();
            ellipse(x, y, 20, 20);
            strokeWeight(1);
          }
        }
        for (Ball b : Balls) {
          if (b.isTouching(this)) {
            collided = true;
            stroke(0);
            strokeWeight(5);
            line(cBall.x, cBall.y, x, y);
            noFill();
            ellipse(x, y, 20, 20);
            stroke(255);
            strokeWeight(3);
            line(cBall.x, cBall.y, x, y);
            noFill();
            ellipse(x, y, 20, 20);
            strokeWeight(1);
            float xv = -(s.cVect.x) * vel;
            float yv = -(s.cVect.y) * vel;
            PVector un = new PVector(b.x - x, b.y - y);
            un.normalize();
            PVector ut = new PVector(-un.y, un.x);
            PVector v1 = new PVector(xv, yv);
            PVector v2 = new PVector(b.xv, b.yv);
            float v1n = v1.dot(un);
            float v1t = v1.dot(ut);
            float v2n = v2.dot(un);
            float v2t = v2.dot(ut);
            PVector v1np = new PVector(un.x, un.y);
            v1np.mult(v2n);
            PVector v1tp = new PVector(ut.x, ut.y);
            v1tp.mult(v1t);
            PVector v2np = new PVector(un.x, un.y);
            v2np.mult(v1n);
            PVector v2tp = new PVector(ut.x, ut.y);
            v2tp.mult(v2t);
            v1np.add(v1tp);
            v2np.add(v2tp);
            float x1 = v1np.x;
            float y1 = v1np.y;
            float x2 = v2np.x;
            float y2 = v2np.y;
            stroke(0);
            strokeWeight(5);
            line(x, y, x + x1, y + y1);
            line(b.x, b.y, b.x + x2, b.y + y2);
            noFill();
            ellipse(x, y, 20, 20);
            stroke(255);
            strokeWeight(3);
            line(x, y, x + x1, y + y1);
            line(b.x, b.y, b.x + x2, b.y + y2);
            ellipse(x, y, 20, 20);
            strokeWeight(1);
          }
        }
      }
    //}
  }
}
