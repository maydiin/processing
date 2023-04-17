ArrayList<PVector> vectors= new ArrayList<PVector>();
float r=150;
float beta=0;
float angle=0;
boolean drawing=false;
float cr=255;
float cg=255;
float cb=255;
float x;
float y;
float R=50;
int count=0;

boolean recording = false;
void setup() {
  size(1920, 1080, P3D);
  background(50);
}

void draw() {
  if (drawing ==true){
    x= (width*8/15)+R*cos(PI*angle);
    y= (height*8/15)+R*sin(PI*angle);
    float z = beta * sin(PI*angle);
    vectors.add(new PVector(x, y, z));
    beta+=0.5;
    beginShape();
    for (PVector v : vectors) {
      if (count%2==0){
      rotateY(PI*angle);
  

    }else{
    rotateZ(PI*angle);rotateX(PI*angle);
    
      }
      if (dist(x, y,z, v.x, v.y, v.z )<2*r) {
        strokeWeight(0.1);
        stroke(cr,cg,cb);
        line(x, y,z,v.x, v.y,v.z);
      }
    }
    endShape();
    angle+=0.001;
    if (count%100==0){
      R+=2;
      cr-=1;
      cg-=3;
      cb-=5;
    }
    
    count++;
    saveFrame("creat2/v_######.png");
  }
  
}

void keyPressed() {
  if (key=='q'|| key=='Q') {
    drawing = !drawing;
  }
}
