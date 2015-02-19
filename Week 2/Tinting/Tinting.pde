PImage img;
color c1, c2;

void setup() {
  size(1020, 900);
  colorMode(HSB);
  img = loadImage("hummingbird.jpg");
  c1 = color(20, 240, 130);
  c2 = color(240, 215, 190);
}

void draw() {
  background(0);
  float t = map(sin(0.01*frameCount), -1, 1, 0, 1);
  color c3 = lerpColor(c1, c2, t);
  tint(c1);
  image(img, 0, 10, width/3, 400);
  tint(c2);
  image(img, width/3, 10, width/3, 400);
  tint(c3);
  image(img, 2*width/3, 10, width/3, 400);
}
