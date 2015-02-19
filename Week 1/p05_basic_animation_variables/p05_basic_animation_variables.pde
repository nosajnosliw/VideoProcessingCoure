int x;
int y;

void setup() {
  size(500, 500);
  frameRate(2);
  x = 50;
  y = 50;
}

void draw() {
  ellipse(x, y, 100, 100);
  x += 5;   // this is equivalent to the statement x = x + 5, i.e. incrementing the x variable by 5
  y += 3;
}
