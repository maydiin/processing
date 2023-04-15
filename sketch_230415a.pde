

float angle=0;
float beta=0;
boolean recording = true;
ArrayList<PVector> vectors= new ArrayList<PVector>();

void setup() {
  size(1920, 1080, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2);

  float r = 100*(0.8 + 1.6 * sin(6 * beta));
  float theta= 2 * beta;
  float phi = 0.6 * PI * sin(12 * beta);
  float x = r * cos(phi) * cos(theta);
  float y = r * cos(phi) * sin(theta);
  float z = r * sin(phi);
  stroke(100-x, y, 100+z);

  vectors.add(new PVector(x, y, z));
  beta+= 0.001;

  noFill();

  strokeWeight(4);
  beginShape();
  for (PVector v : vectors) {
    vertex(v.x, v.y, v.z);
    angle = atan2(v.y-height/2, v.x-width/2);

    rotateX(angle/25);
    rotateY(angle/25);
  }
  endShape();
  if (recording) {
    saveFrame("creat/v_####.png");
  }
}

void keyPressed() {
  if (key=='q'|| key=='Q') {
    recording=! recording;
  }
}
