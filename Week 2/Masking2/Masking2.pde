PImage img;
PGraphics mask;

void setup() {
  size(1000, 900);
  img = loadImage("paris.jpg");
  mask = createGraphics(img.width, img.height);
}

void draw() {
  mask.beginDraw();
  mask.background(0);
  mask.noStroke();
  for (int i=0; i<100; i++) {
    mask.fill(255, 50);
    float x = map(noise(0.01*frameCount, i+5), 0, 1, 0, mask.width);
    float y = map(noise(0.01*frameCount+5, i+10), 0, 1, 0, mask.height);
    float w = map(noise(0.01*frameCount+10, i+15), 0, 1, 20, 250);
    float h = map(noise(0.01*frameCount+15, i+20), 0, 1, 20, 250);
    mask.rect(x, y, w, h);
  }
  mask.endDraw();
  
  img.mask(mask);
  
  background(255, 0, 0);
  image(img, 20, 20);
}
