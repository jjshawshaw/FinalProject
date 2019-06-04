class CueBall extends Ball {
  boolean inHole;
  boolean valid;
  CueBall(float x, float y, float xv, float yv, int num) {
    super(x, y, xv, yv, num);
    valid = false;
    inHole = false;
  }
  void display() {
    strokeWeight(2);
    valid = true;
    if (!inHole){
      fill(255, 255, 255);
      ellipse(x, y, 20, 20);
    }
  }
  void collide() {
    float xCor = mouseX;
    float yCor = mouseY;
    for (Hole h : hole) {
      if (h.isTouching(this)) {
              x = 0;
            y = 0;
            xv = 0;
            yv = 0;
        //Balls.remove(this);
        //Displayables.remove(this);
        inHole = true;
      }
    }
    for (Wall w : Walls) {
      if (w.isTouching(this) && !inHole) {
        if (w.dir == 0) {
          yv *= -1;
        } else {
          xv *= -1;
        }
        while (w.isTouching(this)) {
          move();
        }
        xv /= 1.2;
        yv /= 1.2;
      }
    }
    for (Ball b : Balls) {
      if (b != this && b.isTouching(this)) {
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
        xv = v1np.x / 1.1;
        yv = v1np.y / 1.1;
        b.xv = v2np.x / 1.1;
        b.yv = v2np.y / 1.1;
        for (int i = 0; i < 100; i++) {
          if (isTouching(b)) {
            moveAway(b);
            b.moveAway(this);
          }
        }
        for (int i = 0; i < 100; i++) {
        if (isTouching(b)) {
          x += xv;
          y += yv;
          b.x += b.xv;
          b.y += b.yv;
        }
        }
      }
    }     
    boolean stopped = true;
    for (Ball b : Balls) {
      if (b.xv != 0 || b.yv != 0) stopped = false;
    }
    if (inHole && stopped) {
      x = 250;
      y = 350;
      inHole = false;
    }
  }

  boolean isTouching(Prediction other) {
    return false;
  }
}
