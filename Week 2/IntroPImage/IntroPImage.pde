PImage img;

void setup() {
  size(1000, 900);  
  img = loadImage("paris.jpg");
}

void draw() {
  background(0);
  image(img, 50, 50);
}
