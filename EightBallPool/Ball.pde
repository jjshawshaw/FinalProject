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
    x += speed * -sin(dir);
    y += speed * -cos(dir);
  }
}
