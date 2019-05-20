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
    fill(0);
  }
  void move(){
    x += xv;
    y += yv;
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
      //if (b != this && b.isTouching(this)) speed = 0;
    } 
  }
}
