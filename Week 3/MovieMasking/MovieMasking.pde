import processing.video.*;

Movie movie, movie2;
PGraphics mask;

void setup() {
  size(1300, 800);
  movie = new Movie(this, "/Users/Gene/Desktop/Media/german_train.mov");
  movie2 = new Movie(this, "/Users/Gene/Desktop/Media/flames.mov");
  movie.loop();
  movie2.loop();
  movie.read();
  
  mask = createGraphics(movie.width, movie.height);
}

//void movieEvent(Movie m) {
//  m.read();  
//}

void draw() {
  mask.beginDraw();
  mask.background(0);
  mask.noStroke();
  for (int i=0; i<16; i++) {
    float x = map(sin(0.001*i*frameCount+i), -1, 1, 0, mask.width);
    float w = map(sin(0.0008*i*frameCount+5*i), -1, 1, -80, 80);
    mask.fill(255, 100);
    mask.rect(x, 0, w, mask.height);
  }
  for (int i=0; i<16; i++) {
    float y = map(sin(0.0007*i*frameCount+i), -1, 1, 0, mask.height);
    float h = map(sin(0.0006*i*frameCount+5*i), -1, 1, -60, 60);
    mask.fill(255, 100);
    mask.rect(0, y, mask.width, h);
  }
  mask.endDraw();
  
  if (movie.available()) {
    movie.read();
    movie2.read();
    movie.mask(mask);
    background(0, 100, 0);
    image(movie2, 10, 10, movie.width, movie.height);
    image(movie, 10, 10);
  }
}


