PImage img;
PImage[] img2;

void setup() {
  size(1000, 900);  
  img = loadImage("paris.jpg");
  img2 = new PImage[5];
  for (int i=0; i<5; i++) {
    float brightThresh = i * 40;
    img2[i] = createImage(img.width, img.height, ARGB);
    img2[i].loadPixels();
    for (int j=0; j<img.width*img.height; j++) {
      color c = img.pixels[j];
      if (brightness(c) > brightThresh) {
        img2[i].pixels[j] = color(0, 0, 255, 40);
      } else {
        img2[i].pixels[j] = img.pixels[j];
      }
    }    
    img2[i].updatePixels();
  }
}

void draw() {
  background(0);
  for (int i=0; i<5; i++) {
    image(img2[i], 50*i, 50*i);
  }
}
