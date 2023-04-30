ArrayList<PVector> vectors= new ArrayList<PVector>();

float anglex=0;
float angley=0;
float anglez=0;
boolean drawing=false;
float x;
float y;
float betax;
float betay;
float betaz;
int p=0;
void setup() {
  size(800, 800, P3D);
  
    
}
void draw() {
  if (drawing ==true) {
    background(50);
    translate(width/2+width*random(0.01),height/2+height*random(0.01));
    x= (width/10)*cos(PI*angley)+betax;
    y= (height/10)*sin(PI*angley)+betay;
    float z = sin(PI*anglez)+betaz*pow(-1,p);
    rotateX(PI*anglex);
    rotateY(PI*angley);
    vectors.add(new PVector(x, y, z));
    strokeWeight(2);
    beginShape();
    for (PVector v:vectors){
      stroke(p/random(1000),0,0);
        point(v.x/2,v.y/2,v.z);
    }
    endShape();
    
    betax+=random(-3,3);
    betay+=random(-3,3);
    betaz+=random(0.05);
    anglex+=random(0.03);
    angley+=random(0.03);
    anglez+=random(0.03);
    p++;
    saveFrame("creat3/v_######.png");
  }
}

void mousePressed() {
 
    drawing = !drawing;
  
}
