class Hole extends Thing implements Displayable{
  Hole(float x, float y){
    this.x = x;
    this.y = y;
  }
  void display(){
    fill(255, 255,255);
    ellipse(x, y, 20, 20);
  }
  void display(String file){

  }
  boolean isTouching(Ball other) {
    return (dist(x, y, other.x, other.y) <= 30);
  }
  
}
