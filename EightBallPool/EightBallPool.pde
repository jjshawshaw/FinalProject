ArrayList<Displayable> Displayables;
ArrayList<Moveable> Moveables;
ArrayList<Wall> Walls;
ArrayList<Ball> Balls;
static float fU = 1 + 5 * pow(10, -3);

void setup(){
  size(500,500);
  background(255);
  Displayables = new ArrayList<Displayable>();
  Moveables = new ArrayList<Moveable>();
  Balls = new ArrayList<Ball>();
  Ball b1 = new Ball(300, 250, 0, 0);
  Displayables.add(b1);
  Moveables.add(b1);
  Balls.add(b1);
  Ball b2 = new Ball(320, 265, 0, 0);
  Displayables.add(b2);
  Moveables.add(b2);
  Balls.add(b2);
  Ball b3 = new Ball(320, 235, 0, 0);
  Displayables.add(b3);
  Moveables.add(b3);
  Balls.add(b3);
  Ball c = new Ball(200, 250, 5, 0);
  Displayables.add(c);
  Moveables.add(c);
  Balls.add(c);
  Walls = new ArrayList<Wall>();
  Wall w1 = new Wall(100, 100, 330, 0);
  Walls.add(w1);
  Displayables.add(w1);
  Wall w2 = new Wall(100, 100, 300, 1);
  Walls.add(w2);
  Displayables.add(w2);
  Wall w3 = new Wall(100, 400, 300, 0);
  Walls.add(w3);
  Displayables.add(w3);
  Wall w4 = new Wall(400, 100, 330, 1);
  Walls.add(w4);
  Displayables.add(w4);
}

void draw(){
  background(255);
  for (Displayable d : Displayables){
    d.display();
  }
  for (Moveable m : Moveables){
    m.move();
  }
  for (Ball b : Balls){
    b.collide();
  }
}
