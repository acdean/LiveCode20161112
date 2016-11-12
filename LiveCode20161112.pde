import peasy.*;

PeasyCam cam;
float rx, ry, rz;
float dx, dy, dz;
float SZ = 200;
int COUNT = 50;
ArrayList<Binary> list = new ArrayList<Binary>();

void setup() {
  size(640, 360, P3D);
  cam = new PeasyCam(this, 500);
  rand();
  for (int i = 0 ; i < COUNT ; i++) {
    list.add(new Binary());
  }
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
}

class Binary {
  String s = "";
  float x, y, z;
  float rx, ry, rz;
  color c;
  
  Binary() {
    for (int i = 0 ; i < 8 ; i++) {
      s = s + (int)random(0, 2);
    }
    x = random(-SZ, SZ);
    y = random(-SZ, SZ);
    z = random(-SZ, SZ);
    c = color(random(128, 256), random(128, 256), random(128, 256));
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