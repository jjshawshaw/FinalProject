class CueBall extends Ball{
  CueBall(float x, float y, float xv, float yv, int num){
    super(x, y, xv, yv, num);
  }
    void display(){
    fill(255,255,255);
    ellipse(x, y, 20, 20);
    fill(0, 0, 0);
    text(id+"", x-4, y+5);
  }
}