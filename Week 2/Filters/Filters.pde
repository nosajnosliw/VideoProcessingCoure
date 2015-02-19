PImage img;
int indexFilter = 0;

void setup() {
  size(1000, 900);  
  img = loadImage("hummingbird.jpg");
}

void draw() {
  background(0);
  image(img, 50, 50);

  if (indexFilter==0) { 
    filter(GRAY);
  } else if (indexFilter==1) {  
    float thresh = map(mouseX, 0, width, 0, 1);
    filter(THRESHOLD, thresh);
  } else if (indexFilter==2) {  
    int blurRadius = (int) map(mouseX, 0, width, 2, 20);
    filter(BLUR, blurRadius);
  } else if (indexFilter==3) {  
    filter(ERODE);
  } else if (indexFilter==4) {  
    filter(DILATE);
  } else if (indexFilter==5) {  
    int posterAmt = (int) map(mouseX, 0, width, 2, 20);
    filter(POSTERIZE, posterAmt);
  } else if (indexFilter==6) {
    filter(INVERT);
  }
}

void keyPressed() {
  if (keyCode==LEFT) indexFilter = (indexFilter-1);
  else if (keyCode==RIGHT) indexFilter = (indexFilter+1);
  
  if (indexFilter < 0)  indexFilter = 6;
  else if (indexFilter > 6)  indexFilter = 0;
}
