import processing.video.*;

Movie movie;
PGraphics pg1, pg2;

void setup() {
  size(1200, 900);
  movie = new Movie(this, "/Users/Gene/Desktop/Media/german_train.mov");
  movie.loop();
  
  pg1 = createGraphics(650, 400);
  pg2 = createGraphics(650, 400);
}

void draw() {
  background(0);

  pg1.beginDraw();
  pg1.image(movie, 0, 0, 650, 400);
  pg1.filter(POSTERIZE, 3);
  pg1.endDraw();

  pg2.beginDraw();
  pg2.image(movie, 0, 0, 650, 400);
  pg2.filter(INVERT);
  pg2.endDraw();
  
  image(pg1, 10, 10);
  image(pg2, 10, 420);

}

void movieEvent(Movie m) {
  m.read();  
}
