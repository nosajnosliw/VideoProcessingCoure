PImage img;
PGraphics pg;

void setup() {
  size(1400, 900);  
  img = loadImage("hummingbird.jpg");
}

void draw() {
  background(0);
  for (int i=0; i<4; i++) {
    image(img, 10 + 310*i, 50, 300, 200);
    int amt = (int) map(i, 0, 4, 2, 20);
    filter(POSTERIZE, amt);
  }

}

