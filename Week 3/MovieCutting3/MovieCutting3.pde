import processing.video.*;

Movie movie;
PImage[][] img;

void setup() {
  size(1300, 840);
  movie = new Movie(this, "/Users/Gene/Desktop/Media/german_train.mov");
  movie.loop();
  
  img = new PImage[5][5];
  for (int i=0; i<5; i++) {
    for (int j=0; j<5; j++) {
      img[i][j] = createImage(250, 160, RGB);
    }
  }
}

void movieEvent(Movie m) {
  m.read();  
}

void draw() {
  background(0);
  
  for (int i=0; i<5; i++) {
    for (int j=0; j<5; j++) {
      int sx = (int) map(noise(i*j, 0.01*frameCount), 0, 1, 0, width);
      int sy = (int) map(noise(i*j+5, 0.01*frameCount), 0, 1, 0, height);
      int sw = 250;
      int sh = 160;
      int dx = 0;
      int dy = 0;
      int dw = 250;
      int dh = 160;
      img[i][j].copy(movie, sx, sy, sw, sh, dx, dy, dw, dh);
      
      float x = map(i, 0, 5, 0, width);
      float y = map(j, 0, 5, 0, height);
      image(img[i][j], x, y);      
    }
  }
  
}


