import controlP5.*;

ControlP5 gui;

float x;

void setup() {
  size(500, 500);
  gui = new ControlP5(this);  
  gui.addSlider("ellipsePosition").setPosition(300,50).setRange(0,100);
  x = width/2;
}

void draw() {
  background(0);
  
  fill(255, 0, 0);
  
  ellipse(x, height/2, 50, 50);
}

void ellipsePosition(float val) {
  x = val;
}
