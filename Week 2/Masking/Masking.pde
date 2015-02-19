PImage img;
PGraphics mask;

void setup() {
  size(1000, 900);
  img = loadImage("paris.jpg");
  
  mask = createGraphics(img.width, img.height);
  mask.beginDraw();
  mask.background(0);
  for (int i=0; i<50; i++) {
    mask.fill(255,random(255));
    mask.rect(random(mask.width), random(mask.height), random(100, 200), random(100,200));
  }
  mask.endDraw();
  
  img.mask(mask);
}

void draw() {
  background(255, 0, 0);
  image(img, 20, 20);
}
