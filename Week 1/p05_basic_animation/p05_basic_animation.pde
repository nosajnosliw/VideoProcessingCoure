// always a "setup" and "draw" method in any animated program
// we will discuss random in more detail in a later sketch

void setup() {
  size(500, 500);
}

void draw() {
  fill(random(255), random(255), random(255));
  ellipse(random(500), random(500), 100, 100);
}
