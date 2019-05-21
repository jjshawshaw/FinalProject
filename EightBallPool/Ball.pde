class Ball extends Thing implements Displayable, Moveable{
  float xv;
  float yv;
  Ball(float x, float y, float xv, float yv){
    this.x = x;
    this.y = y;
    this.xv = xv
    this.yv = xv;
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
      float tempx = xv;
      float tempy = yv;
      if (b != this && b.isTouching(this)){
        xv = b.xv;
        b.xv = tempx;
        yv = b.yv;
        b.yv = tempy;
        move();
        b.move();
        xv /= 1.5;
        yv /= 1.5;
      }
    } 
  }
}