float x;

void setup() {
  size(500, 500);
  x = 50;
}

void draw() {
  background(0);
  x = lerp(x, 450, 0.05);
  ellipse(x, 250, 100, 100);
}
