class Ball extends Thing implements Displayable, Moveable{
  float dir;
  float speed;
  float xv;
  float yv;
  Ball(float x, float y, float direction, float speed){
    this.x = x;
    this.y = y;
    this.dir = direction;
    xv = speed * cos(dir);
    yv = speed * -sin(dir);
    this.speed = speed;
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
          dir = (PI - dir) % TWO_PI;
          yv *= -1;
          move();
        }
        else {
          dir = (TWO_PI - dir) % TWO_PI;
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
