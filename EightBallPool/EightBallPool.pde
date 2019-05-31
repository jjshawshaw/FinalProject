ArrayList<Displayable> Displayables;
ArrayList<Moveable> Moveables;
ArrayList<Wall> Walls;
ArrayList<Ball> Balls;
ArrayList<Hole> hole;
ArrayList<Ball> removedSolid;
ArrayList<Ball> removedStripe;
int turn;
float vel;
boolean gaming;
static float fU = 1 + 8 * pow(10, -3);

void setup() {
  gaming = true;
  size(900, 600);
  background(255);
  Displayables = new ArrayList<Displayable>();
  Moveables = new ArrayList<Moveable>();
  Balls = new ArrayList<Ball>();
  removedSolid = new ArrayList<Ball>();
  removedStripe = new ArrayList<Ball>();
  turn = 1;

  Ball b1 = new Ball(600, 350, 0, 0, 1);
  Displayables.add(b1);
  Moveables.add(b1);
  Balls.add(b1);

  Ball b2 = new Ball(615, 365, 0, 0, 2);
  Displayables.add(b2);
  Moveables.add(b2);
  Balls.add(b2);

  Ball b3 = new Ball(615, 335, 0, 0, 3);
  Displayables.add(b3);
  Moveables.add(b3);
  Balls.add(b3);

  Ball b4 = new Ball(630, 380, 0, 0, 4);
  Displayables.add(b4);
  Moveables.add(b4);
  Balls.add(b4);

  Ball b5 = new Ball(630, 350, 0, 0, 5);
  Displayables.add(b5);
  Moveables.add(b5);
  Balls.add(b5);

  Ball b6 = new Ball(630, 320, 0, 0, 6);
  Displayables.add(b6);
  Moveables.add(b6);
  Balls.add(b6);

  Ball b7 = new Ball(645, 335, 0, 0, 7);
  Displayables.add(b7);
  Moveables.add(b7);
  Balls.add(b7);

  Ball b8 = new Ball(645, 365, 0, 0, 8);
  Displayables.add(b8);
  Moveables.add(b8);
  Balls.add(b8);

  Ball b9 = new Ball(645, 395, 0, 0, 9);
  Displayables.add(b9);
  Moveables.add(b9);
  Balls.add(b9);

  Ball b10 = new Ball(645, 305, 0, 0, 10);
  Displayables.add(b10);
  Moveables.add(b10);
  Balls.add(b10);

  Ball b11 = new Ball(660, 350, 0, 0, 11);
  Displayables.add(b11);
  Moveables.add(b11);
  Balls.add(b11);

  Ball b12 = new Ball(660, 320, 0, 0, 12);
  Displayables.add(b12);
  Moveables.add(b12);
  Balls.add(b12);

  Ball b13 = new Ball(660, 380, 0, 0, 13);
  Displayables.add(b13);
  Moveables.add(b13);
  Balls.add(b13);

  Ball b14 = new Ball(660, 410, 0, 0, 14);
  Displayables.add(b14);
  Moveables.add(b14);
  Balls.add(b14);

  Ball b15 = new Ball(660, 290, 0, 0, 15);
  Displayables.add(b15);
  Moveables.add(b15);
  Balls.add(b15);

  CueBall c = new CueBall(250, 350, 0, 0, 0);
  Displayables.add(c);
  Moveables.add(c);
  Balls.add(c);

  Walls = new ArrayList<Wall>();
  Wall w1 = new Wall(100, 150, 705, 0, 1);
  Walls.add(w1);
  //Displayables.add(w1);
  Wall w3 = new Wall(100, 520, 705, 0, 0);
  Walls.add(w3);
  //Displayables.add(w3);
  Wall w2 = new Wall(50, 200, 300, 1, 1);
  Walls.add(w2);
  //Displayables.add(w2);
  Wall w4 = new Wall(825, 200, 300, 1, 0);
  Walls.add(w4);
  //Displayables.add(w4);

  hole = new ArrayList<Hole>();
  Hole h1 = new Hole(70, 170);
  hole.add(h1);

  Hole h2 = new Hole(70, 529);
  hole.add(h2);

  Hole h3 = new Hole(452, 165);
  hole.add(h3);

  Hole h4 = new Hole(452, 534);
  hole.add(h4);

  Hole h5 = new Hole(834, 170);
  hole.add(h5);

  Hole h6 = new Hole(834, 529);
  hole.add(h6);

  vel = 0;
  Stick s = new Stick(c);
  Moveables.add(s);
  Displayables.add(s);
  Prediction p = new Prediction(s);
  Displayables.add(p);
}

void draw() {
  if (gaming) {

    background(255);
    fill(100, 150, 100);
    stroke(0);
    rect(50, 150, 805, 400);

    for (Wall w : Walls) {
      w.display();
    }

    // display pockets
    fill(100, 150, 100);
    stroke(0);
    rect(437.5, 150, 30, 30);
    rect(437.5, 520, 30, 30);
    noStroke();
    rect(437.5, 150, 30, 31);
    rect(437.5, 520, 30, 31);
    stroke(0);
    fill(0);
    ellipse(65, 165, 30, 30);
    ellipse(65, 534, 30, 30);
    ellipse(452.5, 165, 30, 30);
    ellipse(452.5, 534, 30, 30);
    ellipse(839, 165, 30, 30);
    ellipse(839, 534, 30, 30);
    //display velocity 
    rect(49, 99, 102, 27);
    for (int i = 1; i <= 255; i++) {
      stroke(255, i, 0);
      line(50 + (i * 100.0 / 255), 100, 50 + (i * 100.0 / 255), 125);
    }
    fill(255);
    stroke(0);
    rect(50 + (vel / 50 * 95), 100, 5, 25);

    for (Displayable d : Displayables) {
      d.display();
    }
    for (Moveable m : Moveables) {
      m.move();
    }

    for (int i = Balls.size()-1; i >= 0; i--) {
      Balls.get(i).collide();
    }
  } else {
    textSize(100);
    text("GAME OVER", 100, 300);
  }
}
