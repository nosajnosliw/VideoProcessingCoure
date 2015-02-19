import controlP5.*;

ControlP5 gui;

Slider2D s;
boolean ellipseIsRed = false;

void setup() {
  size(500, 500);
  gui = new ControlP5(this);  
  
  s = gui.addSlider2D("wave")
       .setPosition(350,40)
       .setSize(100,100)
       .setMinX(0)
       .setMinY(0)
       .setMaxX(width)
       .setMaxY(height)
       .setArrayValue(new float[] {50, 50});
       
  gui.addToggle("ellipseIsRed")
   .setPosition(40,100)
   .setSize(50,20);

}

void draw() {
  background(0);
  
  if (ellipseIsRed==true) {
    fill(255, 0, 0);
  } else {
    fill(0, 255, 0);
  }
  
  ellipse(s.arrayValue()[0], s.arrayValue()[1], 50, 50);
}

