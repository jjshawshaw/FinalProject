ArrayList<Displayable> Displayables;
ArrayList<Moveable> Moveables;
ArrayList<Wall> Walls;
ArrayList<Ball> Balls;
ArrayList<Hole> hole;
ArrayList<Ball> removed;
static float fU = 1 + 7 * pow(10, -3);

void setup(){
  size(900,600);
  background(255);
  Displayables = new ArrayList<Displayable>();
  Moveables = new ArrayList<Moveable>();
  Balls = new ArrayList<Ball>();
  removed = new ArrayList<Ball>();
  
  Ball b1 = new Ball(300, 350, 0, 0, 1);
  Displayables.add(b1);
  Moveables.add(b1);
  Balls.add(b1);
  
  Ball b2 = new Ball(320, 365, 0, 0, 2);
  Displayables.add(b2);
  Moveables.add(b2);
  Balls.add(b2);
  
  Ball b3 = new Ball(320, 335, 0, 0, 3);
  Displayables.add(b3);
  Moveables.add(b3);
  Balls.add(b3);
  
  Ball b4 = new Ball(340, 380, 0, 0, 4);
  Displayables.add(b4);
  Moveables.add(b4);
  Balls.add(b4);
  
  Ball b5 = new Ball(340, 355, 0, 0, 5);
  Displayables.add(b5);
  Moveables.add(b5);
  Balls.add(b5);
  
  Ball b6 = new Ball(340, 330, 0, 0, 6);
  Displayables.add(b6);
  Moveables.add(b6);
  Balls.add(b6);
  
  Ball b7 = new Ball(360, 400, 0, 0, 7);
  Displayables.add(b7);
  Moveables.add(b7);
  Balls.add(b7);
  
  Ball b8 = new Ball(360, 373, 0, 0, 8);
  Displayables.add(b8);
  Moveables.add(b8);
  Balls.add(b8);
  
  Ball b9 = new Ball(360, 453, 0, 0, 9);
  Displayables.add(b9);
  Moveables.add(b9);
  Balls.add(b9);
  
  Ball b10 = new Ball(360, 425, 0, 0, 10);
  Displayables.add(b10);
  Moveables.add(b10);
  Balls.add(b10);
  
  CueBall c = new CueBall(200, 350, 0, 0, 0);
  Displayables.add(c);
  Moveables.add(c);
  Balls.add(c);
  
  Walls = new ArrayList<Wall>();
  Wall w1 = new Wall(50, 150, 800, 0, 1);
  Walls.add(w1);
  Displayables.add(w1);
  Wall w3 = new Wall(50, 520, 800, 0, 0);
  Walls.add(w3);
  Displayables.add(w3);
  Wall w2 = new Wall(50, 150, 400, 1, 1);
  Walls.add(w2);
  Displayables.add(w2);
  Wall w4 = new Wall(825, 150, 400, 1, 0);
  Walls.add(w4);
  Displayables.add(w4);
  
  hole = new ArrayList<Hole>();
  Hole h1 = new Hole(90, 90);
  hole.add(h1);
  Displayables.add(h1);
  
  Stick s = new Stick(c);
  Moveables.add(s);
  Displayables.add(s);
}

void draw(){
  background(255);
  noStroke();
  fill(100, 150, 100);
  rect(50, 150, 800, 400);
  for (Displayable d : Displayables){
    d.display();
  }
  /*for (int i = 0; i < Displayables.size(); i++){
    Displayables.get(i).display("" + i);
  }*/
  for (Moveable m : Moveables){
    m.move();
  }
  /*for (Ball b : Balls){
    b.collide();
  }*/
  for (int i = Balls.size()-1; i >= 0 ; i--){
    Balls.get(i).collide();
  }
}
