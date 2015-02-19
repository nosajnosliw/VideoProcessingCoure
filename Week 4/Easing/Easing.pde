PImage img;

float diff, s;
float diff2, s2;

void setup() {
  size(1000, 900);  
  img = loadImage("paris.jpg");
  
  diff = 5;
  s = 5;
  
  diff2 = diff;
  s2 = s;
}

void draw() {
  diff = lerp(diff, diff2, 0.05);
  s = lerp(s, s2, 0.05);
  
  background(0);
  noStroke();
  
  for (int i=0; i<img.width; i+=diff) {
    for (int j=0; j<img.height; j+=diff) {
      color c = img.get(i, j);
      fill(c);
      ellipse(i, j, s, s);
    }
  }
}

void keyPressed() {
  if (key==' ') {
    diff2 = random(5, 50);
    s2 = random(5, 50);
  }
}
