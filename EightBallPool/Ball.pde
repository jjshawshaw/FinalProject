class Ball extends Thing implements Displayable, Moveable{
  float xv;
  float yv;
  int id;
  int a,b,c;
  Ball(float x, float y, float xv, float yv, int num){
    this.x = x;
    this.y = y;
    this.xv = xv;
    this.yv = yv;
    this.id = num;
    setColor();
  }
  void setColor(){
    if (id == 1){
      a = 250;
      b = 250;
      c = 0;
    }
    else if (id == 2){
      a = 4;
      b = 127;
      c = 249;
    }
    else if (id == 3){
      a = 250;
      b = 25;
      c = 4;
    }
    else if (id == 4){
      a = 138;
      b = 12;
      c = 181;
    }
    else if (id == 5){
      a = 255;
      b = 100;
      c = 17;
    }
    else if (id == 6){
      a = 43;
      b = 229;
      c = 36;
    }
    else if (id == 7){
      a = 102;
      b = 74;
      c = 22;
    }
    else if (id == 8){
      a = 0;
      b = 0;
      c = 0;
    }
    else{
      a = 255;
      b = 255;
      c = 255;
    }
  }
  void display(){
    fill(a,b,c);
    ellipse(x, y, 20, 20);
    fill(255, 255, 255);
    stroke(255,255,255);
    ellipse(x, y, 10, 10);
    fill(0, 0, 0);
    stroke(0,0,0);
    textSize(10);
    text(id+"", x-3, y+4);
  }
  void display(String file){
    //image(ball1, x, y, 20, 20);
    fill(255,255,255);
    ellipse(x, y, 20, 20);
    fill(255, 0, 0);
    text(file, x-4, y+5);
  }
  void move(){
    x += xv;
    y += yv;
    xv /= fU;
    yv /= fU;
    if (abs(xv) < 0.1) xv = 0;
    if (abs(yv) < 0.1) yv = 0;
  }
  boolean isTouching(Ball other){
    return (dist(x, y, other.x, other.y) <= 20);
  }
  void collide(){
    for (Wall w : Walls){
      if (w.isTouching(this)){
        if (w.dir == 0){
          yv *= -1;
          move();
        }
        else {
          xv *= -1;
          move();
        }
        xv /= 1.1;
        yv /= 1.1;
      }
    } 
    for (Ball b : Balls){
      if (b != this && b.isTouching(this)){
         PVector un = new PVector(b.x - x, b.y - y);
         un.normalize();
         PVector ut = new PVector(-un.y, un.x);
         PVector v1 = new PVector(xv, yv);
         PVector v2 = new PVector(b.xv, b.yv);
         float v1n = v1.dot(un);
         float v1t = v1.dot(ut);
         float v2n = v2.dot(un);
         float v2t = v2.dot(ut);
         PVector v1np = new PVector(un.x, un.y);
         v1np.mult(v2n);
         PVector v1tp = new PVector(ut.x, ut.y);
         v1tp.mult(v1t);
         PVector v2np = new PVector(un.x, un.y);
         v2np.mult(v1n);
         PVector v2tp = new PVector(ut.x, ut.y);
         v2tp.mult(v2t);
         v1np.add(v1tp);
         v2np.add(v2tp);
         xv = v1np.x / 1.1;
         yv = v1np.y / 1.1;
         b.xv = v2np.x / 1.1;
         b.yv = v2np.y / 1.1;
         move();
         b.move();
      }
    } 
  }
}
