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
  boolean isTouching(Ball other){
    if ((y > other.y && y - other.y <= 10 || y < other.y &&  other.y - y <= 20) 
    && (x > other.x && x - other.x <= 10 || x < other.x && other.x - x <= 40)){
      fill(255, 0, 0);
      ellipse(x,y, 20, 20);
      return true;
    }
    return false;
  }
  
}
