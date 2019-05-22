public class CueBall extends Ball{
  CueBall(float x, float y, float xv, float yv){
    super(x, y, xv, yv);
  }
    void display(){
    fill(255);
    ellipse(x, y, 20, 20);
  }
}
