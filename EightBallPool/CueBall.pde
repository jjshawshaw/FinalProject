class CueBall extends Ball {
  boolean inHole = false;
  boolean valid = true;
  CueBall(float x, float y, float xv, float yv, int num) {
    super(x, y, xv, yv, num);
  }
  void display() {
    if (inHole){
      float xCor = mouseX;
      float yCor = mouseY;
      valid = true;
      if (xCor < 50|| xCor > 815 || yCor < 175 || yCor > 51110){
        valid = false;
      }
      for (Wall w: Walls){
        if (w.isTouching(xCor, yCor)){
          valid = false;
        }
      }
      for (Hole h : hole){
        if (h.isTouching(xCor, yCor)){
          valid = false;
        }
      }
      for (Ball b: Balls){
        if (b.isTouching(xCor, yCor)){
          valid = false;
        }
      }
      if (valid){
        fill(255, 255, 255);
        ellipse(xCor, yCor, 20, 20);
      }
    }
    else{
      fill(255, 255, 255);
      ellipse(x, y, 20, 20);
    }
  }
  void collide() {
    float xCor = mouseX;
    float yCor = mouseY;
    for (Hole h : hole) {
      if (h.isTouching(this)) {
        //Balls.remove(this);
        //Displayables.remove(this);
        Moveables.remove(this);
        inHole = true;
        if (mousePressed && valid){
          setX(xCor);
          setY(yCor);
          xv = 0;
          yv = 0;
          Moveables.add(this);
          inHole = false;
        }
      }
    }
    for (Wall w : Walls) {
      if (w.isTouching(this)) {
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
        for (int i = 0; i < 1000; i++) {
          if (isTouching(b)) {
            move();
            b.move();
          }
        }
      }
    }
  }
  
  
  
  void mouseReleased() {
    setX(mouseX);
    setY(mouseY);
  }
}