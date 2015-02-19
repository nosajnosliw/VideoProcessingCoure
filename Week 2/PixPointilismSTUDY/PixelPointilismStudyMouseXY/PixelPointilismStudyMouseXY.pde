PImage img;

void setup()  {
  size(1000, 900);
  img = loadImage("paris.jpg");
}

void draw()  {
  background(0);
  noStroke();
  
  int diff = (int) map(mouseX, 0, width, 5,50);
  int s = (int) map(mouseY, 0, height, 5,50);
  
  for(int i=0; i<img.width; i+=diff) {
    for (int j=0; j<img.height; j+=diff) {
      color c = img.get(i, j);
      fill(c);
      ellipse(i, j, s, s);
    }
  }
}

