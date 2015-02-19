PImage img;

void setup()  {
  size(1000, 900);
  img = loadImage("paris.jpg");
}

void draw()  {
  background(0);
  noStroke();
  
  for(int i=0; i<img.width; i+=20) {
    for (int j=0; j<img.height; j+=20) {
      color c = img.get(i, j);
      fill(c);
      ellipse(i, j, 20, 20);
    }
  }
}

