import peasy.*;

PeasyCam cam;
float rx, ry, rz;
float dx, dy, dz;
float SZ = 250;
int COUNT = 100;
ArrayList<Binary> list = new ArrayList<Binary>();
PFont f;
boolean video;

void setup() {
  size(640, 360, P3D);
  cam = new PeasyCam(this, 500);
  rand();
  for (int i = 0; i < COUNT; i++) {
    list.add(new Binary());
  }
  f = createFont("Fixed", 30);
  textFont(f);
}

void rand() {
  rx = random(TWO_PI);
  ry = random(TWO_PI);
  rz = random(TWO_PI);
  dx = random(-.02, .02);
  dy = random(-.02, .02);
  dz = random(-.02, .02);
}

void draw() {
  background(0);
  rx += dx;
  ry += dy;
  rz += dz;
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  for (Binary b : list) {
    b.draw();
  }
  
  if (video) {
    saveFrame("frame#####.png");
    if (frameCount > 500) {
      exit();
    }
  }
}

class Binary {
  String s = "";
  float x, y, z;
  float rx, ry, rz;
  color c;

  Binary() {
    for (int i = 0; i < 8; i++) {
      s = s + (int)random(0, 2);
    }
    x = random(-SZ, SZ);
    y = random(-SZ, SZ);
    z = random(-SZ, SZ);
    switch((int)random(3)) {
    case 0:
      rx = HALF_PI * (int)random(4);
      break;
    case 1:
      ry = HALF_PI * (int)random(4);
      break;
    case 2:
      rz = HALF_PI * (int)random(4);
      break;
    }
    c = color(random(0), random(128, 256), random(0));
  }

  void draw() {
    pushMatrix();
    fill(c);
    stroke(c);
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    text(s, x, y, z);
    popMatrix();
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("snapshot####.png");
  }
  if (key == 'r') {
    rand();
  }
}