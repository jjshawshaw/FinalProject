class Hole extends Thing {
  Hole(float x, float y) {
    this.x = x;
    this.y = y;
  }
  boolean isTouching(Thing other) {
    return (dist(x, y, other.x, other.y) <= 30);
  }
}