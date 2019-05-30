class Hole extends Thing {
  Hole(float x, float y) {
    this.x = x;
    this.y = y;
  }
  boolean isTouching(Ball other) {
    return (dist(x, y, other.x, other.y) <= 30);
  }
  boolean isTouching(float xCor, float yCor) {
    return (dist(x, y, xCor, yCor) <= 30);
  }
}
