class Ball extends Thing implements Displayable, Moveable {
  float xv;
  float yv;
  int id;
  int a, b, c;
  Ball(float x, float y, float xv, float yv, int num) {
    this.x = x;
    this.y = y;
    this.xv = xv;
    this.yv = yv;
    this.id = num;
    setColor();
  }
  void setColor() {
    if (id == 1 || id == 9) {
      a = 250;
      b = 250;
      c = 0;
    } else if (id == 2 || id == 10) {
      a = 4;
      b = 127;
      c = 249;
    } else if (id == 3 || id == 11) {
      a = 250;
      b = 25;
      c = 4;
    } else if (id == 4 || id == 12) {
      a = 138;
      b = 12;
      c = 181;
    } else if (id == 5 || id == 13) {
      a = 255;
      b = 100;
      c = 17;
    } else if (id == 6 || id == 14) {
      a = 43;
      b = 229;
      c = 36;
    } else if (id == 7 || id == 15) {
      a = 102;
      b = 74;
      c = 22;
    } else if (id == 8) {
      a = 0;
      b = 0;
      c = 0;
    } else {
      a = 255;
      b = 255;
      c = 255;
    }
  }
  void display() {
    strokeWeight(2);
    fill(a, b, c);
    stroke(0);
    ellipse(x, y, 20, 20);
    fill(255, 255, 255);
    stroke(255, 255, 255);
    ellipse(x, y, 10, 10);
    if (id > 8) {
      fill(255);
      arc(x, y, 16, 16, 0, PI/2, CHORD);
      arc(x, y, 16, 16, PI, 1.5 * PI, CHORD);
    }
    fill(0, 0, 0);
    stroke(0, 0, 0);
    textSize(10);
    if (id <= 9) text(id+"", x-3, y+4);
    else text(id+"", x- 7, y+4);
  }
  void display(String file) {
    //image(ball1, x, y, 20, 20);
    fill(255, 255, 255);
    ellipse(x, y, 20, 20);
    fill(255, 0, 0);
    text(file, x-4, y+5);
  }
  void move() {
    for (int i = 0; i < 100; i++) {
      for (Ball b : Balls) { 
        if (b != this && b.isTouching(this)) { 
          break;
        }
      }
      for (Wall w : Walls) { 
        if (w.isTouching(this)) { 
          break;
        }
      }
      for (Hole h : hole) {
        if (h.isTouching(this)) {
          break;
        }
      }
      x += xv/100;
      y += yv/100;
    }
  }

  void moveAway(Ball other) {
    for (int i = 0; i < 100; i++) {
      for (Ball b : Balls) { 
        if (b != this && b != other && b.isTouching(this)) { 
          break;
        }
      }
      for (Hole h : hole) {
        if (h.isTouching(this)) {
          break;
        }
      }
      for (Wall w : Walls) { 
        if (w.isTouching(this)) { 
          break;
        }
      }
      x += xv/100;
      y += yv/100;
    }
  }

  boolean isTouching(Ball other) {
    return (dist(x, y, other.x, other.y) <= 20.5);
  }
  boolean isTouching(float xCor, float yCor) {
    return (dist(x, y, xCor, yCor) <= 20.5);
  }
  boolean isTouching(Prediction other) {
    return (dist(x, y, other.x, other.y) <= 20);
  }
  void collide() {
    for (Hole h : hole) {
      if (h.isTouching(this)) {
        if (!assigned) {
          assigned= true;
          solids = (id < 8);
        }
        Balls.remove(this);
        //Displayables.remove(this);
        Moveables.remove(this);
        int stripeN = removedStripe.size();
        int solidN = removedSolid.size();
        if (this.id <= 8) {
          if (this.id == 8) {
            over = true;
            gaming = false;
            if (solids) {
              if (solidN == 7) finalText = "Solids Wins!";
              else finalText = "Stripes Wins!";
            } else {
              if (stripeN == 7) finalText = "Stripes Wins!";
              else finalText = "Solids Wins!";
            } 
            if (!assigned) finalText = "";
          }
            
          removedSolid.add(this);
          setX(20 + id*30);
        } else {

          removedStripe.add(this);
          setX(300 + id*30);
        }
        setY(80);
      }
    }
    for (Wall w : Walls) {
      if (w.isTouching(this)) {
        if (w.dir == 0) {
          yv *= -1;
        } else {
          xv *= -1;
        }
        while (w.isTouching(this)) {
          move();
        }
        xv /= 1.2;
        yv /= 1.2;
      }
    }
    for (Ball b : Balls) {
      if (b != this && b.isTouching(this)) {
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
        xv = v1np.x;
        yv = v1np.y;
        b.xv = v2np.x;
        b.yv = v2np.y;
        for (int i = 0; i < 100; i++) {
          if (isTouching(b)) {
            moveAway(b);
            b.moveAway(this);
          }
        }
        for (int i = 0; i < 100; i++) {
        if (isTouching(b)) {
          x += xv;
          y += yv;
          b.x += b.xv;
          b.y += b.yv;
        }
        }
      }
    }
  }

  void setX(float locX) {
    this.x = locX;
  }

  void setY(float locY) {
    this.y = locY;
  }
}
