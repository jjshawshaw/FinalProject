class Ball extends Thing implements Displayable{
  Ball(float x, float y){
    this.x = x;
    this.y = y;
  }
  void display(){
    fill(0);
    ellipse(x, y, 20, 20);
  }
}