import processing.video.*;

Movie movie;

void setup() {
  size(1200, 800);
  movie = new Movie(this, "/Users/Gene/Desktop/Media/german_train.mov");
  movie.play();
}

void draw() {
  background(0);
  image(movie, 0, 0);
}

void keyPressed() {
  if (key==' ') {
    float t = movie.duration() * 0.5;
    movie.jump(t);
  }
}

void movieEvent(Movie m) {
  m.read();  
}
