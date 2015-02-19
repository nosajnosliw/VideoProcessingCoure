PImage img;

void setup() {
  size (1020, 900);
  imageMode(CENTER);
  img = loadImage("fruit-stand.jpg");
}

void draw() {
  background(0);
  fill(255,0,0);
  ellipse(width/4, height/2, 300, 300);
  fill(0,255,0);
  ellipse(2*width/4, height/2, 300, 300);
  fill(0,0,255);
  ellipse(3*width/4, height/2, 300, 300);
  
  tint(255, 100);
  image(img, width/2, height/2);
}
  
