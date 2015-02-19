PImage img1, img2;

void setup() {
  size(1020, 900);
  imageMode(CENTER);
  img1 = loadImage("fruit-stand.jpg");
  img2 = loadImage("hummingbird.jpg");
}

void draw() {
  background(0);

  float a = map(mouseX, 0, width, 0, 255);
  
  tint(255, a);
  image(img1, width/2, height/2);
  tint(255, 255-a);
  image(img2, width/2, height/2);
}
