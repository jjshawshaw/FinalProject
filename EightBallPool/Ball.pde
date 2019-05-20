class Ball extends Thing implements Displayable, Moveable, Collideable{
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
  boolean isTouching(Thing other){
    return (dist(x, y, other.x, other.y) <= 20);
}
