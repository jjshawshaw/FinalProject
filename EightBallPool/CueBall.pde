class CueBall extends Ball {
  CueBall(float x, float y, float xv, float yv, int num) {
    super(x, y, xv, yv, num);
  }
  void display() {
    fill(255, 255, 255);
    ellipse(x, y, 20, 20);
  }
  boolean isTouching(Prediction other) {
    return false;
  }
}