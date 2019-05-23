ArrayList<Displayable> Displayables;
ArrayList<Moveable> Moveables;
ArrayList<Wall> Walls;
ArrayList<Ball> Balls;
ArrayList<Hole> hole;
ArrayList<Ball> removed;
static float fU = 1 + 7 * pow(10, -3);

void setup(){
  size(500,500);
  background(255);
  Displayables = new ArrayList<Displayable>();
  Moveables = new ArrayList<Moveable>();
  Balls = new ArrayList<Ball>();
  removed = new ArrayList<Ball>();
  
  Ball b1 = new Ball(300, 250, 0, 0, 1);
  Displayables.add(b1);
  Moveables.add(b1);
  Balls.add(b1);
  
  Ball b2 = new Ball(320, 265, 0, 0, 2);
  Displayables.add(b2);
  Moveables.add(b2);
  Balls.add(b2);
  
  Ball b3 = new Ball(320, 235, 0, 0, 3);
  Displayables.add(b3);
  Moveables.add(b3);
  Balls.add(b3);
  
  Ball b4 = new Ball(340, 280, 0, 0, 4);
  Displayables.add(b4);
  Moveables.add(b4);
  Balls.add(b4);
  
  Ball b5 = new Ball(340, 255, 0, 0, 5);
  Displayables.add(b5);
  Moveables.add(b5);
  Balls.add(b5);
  
  Ball b6 = new Ball(340, 230, 0, 0, 6);
  Displayables.add(b6);
  Moveables.add(b6);
  Balls.add(b6);
  
  Ball b7 = new Ball(360, 300, 0, 0, 7);
  Displayables.add(b7);
  Moveables.add(b7);
  Balls.add(b7);
  
  Ball b8 = new Ball(360, 273, 0, 0, 8);
  Displayables.add(b8);
  Moveables.add(b8);
  Balls.add(b8);
  
  CueBall c = new CueBall(200, 250, 0, 0, 0);
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
  
  hole = new ArrayList<Hole>();
  Hole h1 = new Hole(140, 140);
  hole.add(h1);
  Displayables.add(h1);
  
  Stick s = new Stick(c);
  Moveables.add(s);
  Displayables.add(s);
}

void draw(){
  background(255);
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
