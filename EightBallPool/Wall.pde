class Wall extends Thing implements Displayable{
  int dir;
  float len;
  float dir2;
  Wall(float x, float y, float len, int dir, int dir2){
    this.x = x;
    this.y = y;
    this.dir = dir;
    this.len = len;
    this.dir2 = dir2;
  }
  void display(){
    fill(50);
    if (dir == 0){
        rect(x, y, len, 30);
        fill(100, 150, 100);
        if (dir2 == 0){
          rect(x, y, len, 10);
        } else {
          rect(x, y + 20, len, 10);
        }
    } else {
        rect(x, y, 30, len);
        fill(100, 150, 100);
        fill(100, 150, 100);
        if (dir2 == 0){
          rect(x, y, 10, len);
        } else {
          rect(x + 20, y, 10, len);
        }
    }
  }
  void display(String file){
    fill(255);
    if (dir == 0){
        rect(x, y, len, 30);
        ellipse(x, y, 10, 10);
    } else {
        ellipse(x, y, 10, 10);
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