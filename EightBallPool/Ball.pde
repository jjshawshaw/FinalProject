class Ball extends Thing implements Displayable, Moveable{
  float xv;
  float yv;
  Ball(float x, float y, float xv, float yv){
    this.x = x;
    this.y = y;
    this.xv = xv;
    this.yv = yv;
  }
  void display(){
    fill(255, 0, 0);
    ellipse(x, y, 20, 20);
  }
  void move(){
    x += xv;
    y += yv;
    xv /= fU;
    yv /= fU;
    if (abs(xv) < 0.1) xv = 0;
    if (abs(yv) < 0.1) yv = 0;
  }
  boolean isTouching(Ball other){
    return (dist(x, y, other.x, other.y) <= 20);
  }
  void collide(){
    for (Wall w : Walls){
      if (w.isTouching(this)){
        if (w.dir == 0){
          yv *= -1;
          move();
        }
        else {
          xv *= -1;
          move();
        }
      }
    } 
    for (Ball b : Balls){
      if (b != this && b.isTouching(this)){
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
         v1np.mult(v1n);
         PVector v2tp = new PVector(ut.x, ut.y);
         v1tp.mult(v2t);
         v1np.add(v1tp);
         v2np.add(v2tp);
         xv = v1np.x;
         yv = v1np.y;
         b.xv = v2np.x;
         b.yv = v2np.y;
         move();
         b.move();
      }
    } 
  }
}
