class Banner {
  PVector location, velocity, acceleration, planeLocation;
  float wid, hight;
  PImage img;

  public Banner(float x, float y, float wid, float hight) {
    this.location = new PVector(x, y); 
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.planeLocation = new PVector(0,0);
    this.wid = wid;
    this.hight = hight;
    img = loadImage("OhHeckYeaBanner.png");
  }

  public void update(float x, float y) {
    if (location.x > x) {
      velocity.x = -2;
    } else if (location.x < x) {
      location.x = x+100;
      location.y = y;
    }
    if (location.y > y) {
      acceleration.y = -.1;
    } else if (location.y < y) {
      acceleration.y = .1;
    }
    velocity.add(acceleration);
    location.add(velocity);
    planeLocation.x = x;
    planeLocation.y = y;
  }

  public void display() {
    pushMatrix();
    translate(location.x, location.y);
    fill(255, 0, 0);
    image(img, 0, 0, wid, wid);
    popMatrix();
    line(location.x, location.y+wid/2, planeLocation.x, planeLocation.y);
    line(location.x, location.y-wid/2, planeLocation.x, planeLocation.y);
  }
}

