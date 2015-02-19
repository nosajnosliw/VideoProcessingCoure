PImage img;
PShader shade;

void setup() {
  size(1024, 768, P2D);
  img = loadImage("IMG_0569.JPG");
  shade = loadShader("wrap.glsl");
  shade.set("resolution", float(width), float(height));
  shader(shade);
}

void draw() {
  image(img, 0, 0);
}
