import processing.video.*;

Movie movie;
PImage[][] img;
int m, n;
int w, h;
float nx, ny;
color tintColor;

void setup() {
  size(1300, 840);
  movie = new Movie(this, "/Users/Gene/Movies/german_train.mov");
  movie.loop();
  
  m = 3;
  n = 3;

  reInitialize();  
}

void reInitialize() {
  w = (int) (0.9 * width / m);
  h = (int) (0.9 * height / n);
  
  img = new PImage[m][n];
  for (int i=0; i<m; i++) {
    for (int j=0; j<n; j++) {
      img[i][j] = createImage(w, h, RGB);
    }
  }
  
  nx = random(0.02);
  ny = random(0.02);

  tintColor = color(random(255), random(255), random(255));
}

void movieEvent(Movie m) {
  m.read();  
}

void draw() {
  background(0);
  
  for (int i=0; i<m; i++) {
    for (int j=0; j<n; j++) {
      int sx = (int) map(noise(i*j, nx*frameCount), 0, 1, 0, width);
      int sy = (int) map(noise(i*j+5, ny*frameCount), 0, 1, 0, height);
      int sw = w;
      int sh = h;
      int dx = 0;
      int dy = 0;
      int dw = w;
      int dh = h;
      img[i][j].copy(movie, sx, sy, sw, sh, dx, dy, dw, dh);
      
      float x = map(i, 0, m, 0, width);
      float y = map(j, 0, n, 0, height);
      image(img[i][j], x, y);      
    }
  }
  
  tint(tintColor);
  
}

void keyPressed() {
  if (key==' ') {
    m = (int) random(2, 8);
    n = (int) random(2, 8);
    reInitialize();
  }
}
