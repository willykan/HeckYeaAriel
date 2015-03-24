class Banner {
  PVector location, velocity, acceleration, planeLocation;
  float wid, hight;
  PFont f;
  PImage img;

  public Banner(float x, float y, float wid, float hight) {
    this.location = new PVector(x, y); 
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.planeLocation = new PVector(0,0);
    this.wid = wid;
    this.hight = hight;
    f = createFont("Arial", 16, true);
    img = loadImage("OhHeckYeaBanner.png");
  }

  public void update(PVector pLocation) {
    planeLocation = pLocation;
    if (location.x > planeLocation.x) {
      velocity.x = -2;
    } else if (location.x < planeLocation.x) {
      location.x = planeLocation.x+150;
      location.y = planeLocation.y;
    }
    if (location.y > planeLocation.y) {
      acceleration.y = -.1;
    } else if (location.y < planeLocation.y) {
      acceleration.y = .1;
    }
    velocity.add(acceleration);
    location.add(velocity);
  }

  public void display() {
    pushMatrix();
    translate(location.x, location.y);
    fill(255, 0, 0);
    //image(img, 0, 0, wid, wid);
    rect(0, 0, wid, hight);
    popMatrix();
    textFont(f);
    fill(0);
    text("Congrats Grads", location.x-wid/2, location.y+hight/3);
    line(location.x-wid/2, location.y+hight/2, planeLocation.x, planeLocation.y);
    line(location.x-wid/2, location.y-hight/2, planeLocation.x, planeLocation.y);
  }
}

