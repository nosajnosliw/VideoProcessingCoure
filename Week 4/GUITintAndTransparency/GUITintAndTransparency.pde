import controlP5.*;

ControlP5 gui;

PImage img1, img2;
float a;
boolean isFiltered = false;

void setup() {
  size(1020, 900);
  imageMode(CENTER);

  gui = new ControlP5(this);  
  gui.addSlider("a").setPosition(50,50).setRange(0, 255);
  
  gui.addToggle("isFiltered")
   .setPosition(170, 50)
   .setSize(40,20);

  img1 = loadImage("fruit-stand.jpg");
  img2 = loadImage("hummingbird.jpg");
}

void draw() {
  background(0);

  
  tint(255, a);
  image(img1, width/2, height/2);
  tint(255, 255-a);
  image(img2, width/2, height/2);
  
  if (isFiltered == true) {
    filter(THRESHOLD);
  } else {
  }
}

void keyPressed() {
  if (key=='s')  gui.show();
  else if (key=='h')  gui.hide();
}
