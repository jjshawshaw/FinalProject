class Wall extends Thing implements Displayable{
  int dir;
  float len;
  Wall(float x, float y, float len, int dir){
    this.x = x;
    this.y = y;
    this.dir = dir;
    this.len = len;
  }
  void display(){
    fill(255);
    if (dir == 0){
        rect(x, y, len, 30);
    } else {
        rect(x, y, 30, len);
    }
  }
  boolean isTouching(Ball other){
    if (dir == 0){
        if ((x > other.x && x - other.x <= 10 || x < other.x &&  other.x - x <= len) 
        && (y > other.y && y - other.y <= 10 || y < other.y && other.y - y <= 40)){
          fill(255, 0, 0);
          rect(x, y, len, 30);
          return true;
        }
        return false;
    }
    if ((y > other.y && y - other.y <= 10 || y < other.y &&  other.y - y <= len) 
    && (x > other.x && x - other.x <= 10 || x < other.x && other.x - x <= 40)){
      fill(255, 0, 0);
      rect(x, y, 30, len);
      return true;
    }
    return false;
  }
  
}
