void setup() {
  size(500, 500);
  
  // no return type for makeCircle
  makeCircle(100, 100, 60, 200);
  makeCircle(350, 120, 150, 25);
  makeCircle(300, 300, 120, 170);
  makeCircle(450, 34, 90, 10);
  
  // return an integer;
  int z = squaredPlusFive(9);
  text("9 squared + 5 is " + z, 50, 450);
}

// this method returns no information to the main method
void makeCircle(int x, int y, int rad, int gray) {
  fill(gray);
  ellipse(x, y, rad, rad);
  rect(x+5, y+5, rad/2, rad/2);
}

// this method is returning an integer to the main method
int squaredPlusFive(int x) {
  int y = x * x + 5;
  return y;
}
