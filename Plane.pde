class Plane {
  PVector location, velocity, acceleration;
  Banner banner;
  PImage plane;

  public Plane() {
    size(600, 600);
    rectMode(CENTER);
    imageMode(CENTER);
    location = new PVector(width+20, height/2);
    velocity = new PVector(-2, 0);
    acceleration = new PVector(0, .2);
    banner = new Banner(location.x+100, location.y, 100, 20);
    plane = loadImage("plane.jpeg");
  }

  void draw() {
    update();
    display();
  }

  void update() {
    if (location.x < -19) {
      location.x = width + 20;
      location.y = height/2;
    }
    if (velocity.y < -2) {
      acceleration.y = .2;
    } else if (velocity.y>2) {
      acceleration.y = -.2;
    }
    velocity.add(acceleration);
    location.add(velocity);
    banner.update(location.x, location.y);
  }

  void display() {
    background(255, 255, 255);
    pushMatrix();
    translate(location.x, location.y);
    fill(255, 200, 200);
    image(plane, 0, 0, 100, 80);
    popMatrix();
    banner.display();
  }
}

