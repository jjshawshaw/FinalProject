class Ball extends Thing implements Displayable, Moveable{
  float dir;
  float speed;
  Ball(float x, float y, float direction, float speed){
    this.x = x;
    this.y = y;
    this.dir = direction;
    this.speed = speed;
  }
  void display(){
    fill(255, 0, 0);
    ellipse(x, y, 20, 20);
  }
  void move(){
    x += speed * cos(dir);
    y += speed * -sin(dir);
  }
  boolean isTouching(Ball other){
    return (dist(x, y, other.x, other.y) <= 20);
  }
  void collide(){
    for (Wall w : Walls){
      if (w.isTouching(this)){
        if (w.dir == 0){
          dir = (PI - dir);
        }
        else {
          dir = 2 * PI - dir;
        }
      }
    } 
    for (Ball b : Balls){
      //if (b != this && b.isTouching(this)) speed = 0;
    } 
  }
}
