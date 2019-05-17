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
    fill(0);
    switch(dir){
      case 0:
        rect(x, y, len, 30);
        break;
      case 1:
        rect(x, y, 30, len);
        break;
      case 2:
        rect(x, y, -len, 30);
        break;
      case 3:
        rect(x, y, 30, -len);
    }
  }
}