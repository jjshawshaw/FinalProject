ArrayList<Displayable> Displayables;
ArrayList<Wall> Walls;

void setup(){
  size(500,500);
  background(255);
  Displayables = new ArrayList<Displayable>();
  for (int i = 0; i < 5; i++){
    Ball b = new Ball(random(width), random(height));
    Displayables.add(b);
  }
  Walls = new ArrayList<Wall>();
  Wall w1 = new Wall(200, 200, 100, 0);
  Walls.add(w1);
  Displayables.add(w1);
  Wall w2 = new Wall(200, 200, 50, 1);
  Walls.add(w2);
  Displayables.add(w2);
  Wall w3 = new Wall(200, 200, 150, 2);
  Walls.add(w3);
  Displayables.add(w3);
}

void draw(){
  for (Displayable d : Displayables){
    d.display();
  }
}