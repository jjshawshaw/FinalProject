class Stick extends Thing implements Displayable, Moveable{
  float dir;
  public Stick(float x, float y){
    this.x = x;
    this.y = y;
  }
  void move(){
    x = mouseX; 
    y = mouseY;
  }
  void display(){
    fill(160, 42, 42);
    rect(x,y, 7, 200);
    fill(255);
    rect(x,y, 7, 7);
  }
}
