PShader shade;

void setup() {
  size(800, 800, P2D);
  shade = loadShader("sinewaves.glsl");
  shade.set("resolution", float(width), float(height));
  shade.set("brightFloor", 0.0);
  shade.set("bright", 0.8);
  shader(shade);
}

void draw() {
  background(0);
  shade.set("time", millis()/1000);
  rect(0, 0, width, height);
}
