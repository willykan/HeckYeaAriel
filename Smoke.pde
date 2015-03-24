class Smoke {
  PVector loc;
  PVector vel;
  float lifespan;
  PImage img;

  Smoke(PVector l, PImage img_) {
    float y = -2;
    vel = new PVector(0, y);
    loc = l.get();
    lifespan = 100.0;
    img = img_;
  }

  // Method to update location
  void update() {
    loc.add(vel);
    lifespan -= 2.5;
  }

  // Method to display
  void display() {
    imageMode(CENTER);
    tint(255, lifespan);
    image(img, loc.x+50, loc.y, 50, 50);
    noTint();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

