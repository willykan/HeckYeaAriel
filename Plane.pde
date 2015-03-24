class Plane {
  PVector location, velocity, acceleration;
  PImage smokeImg = loadImage("texture.png");
  Banner banner;
  PImage plane;
  ArrayList<Smoke> smokeArray;
  int globalcount=0;

  public Plane() {
    size(600, 600);
    imageMode(CENTER);
    location = new PVector(width+20, height/2);
    velocity = new PVector(-2, 0);
    acceleration = new PVector(0, .2);
    banner = new Banner(location.x+100, location.y, 100, 20);
    plane = loadImage("plane.jpeg");
    smokeArray = new ArrayList<Smoke>();
  }

  void draw() {
    update();
    display();
  }

  void update() {
    //Move the plane
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

    //Call banner update function
    banner.update(location);

    //Update each smoke object in the smoke array
    for (int i=0; i < smokeArray.size (); i++) {
      smokeArray.get(i).update();
    }
    //Delete old smoke objects that are marked “dead”
    for (int i=0; i < smokeArray.size (); i++) {
      if (smokeArray.get(i).isDead()) {
        smokeArray.remove(i);
        i--;
      }
    }

    //Every 5 frames puff out some smoke
    globalcount++;
    if (globalcount%5 == 0) {
      smokeArray.add(new Smoke(location, smokeImg));
    }
  }

  void display() {
    background(255, 255, 255);
    pushMatrix();
    translate(location.x, location.y);
    fill(255, 200, 200);
    image(plane, 0, 0, 100, 80);
    popMatrix();
    for (int i=0; i < smokeArray.size (); i++) {
      smokeArray.get(i).display();
    }
    banner.display();
  }
}

