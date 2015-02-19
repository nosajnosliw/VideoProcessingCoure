PImage img;

void setup() {
  size(1000, 900);  
  img = loadImage("paris.jpg");
}

void draw() {
  background(0);
  noStroke();
  
  int diff = (int) map(mouseX, 0, width, 5, 50);
  int maxSize = (int) map(mouseY, 0, height, 5, 50); 

  for (int i=0; i<img.width; i+=diff) {
    for (int j=0; j<img.height; j+=diff) {
      color c = img.get(i, j);
      fill(255, 50);
      float s = map(brightness(c), 0, 255, 0, maxSize);
      ellipse(i, j, s, s);
    }
  }
}
