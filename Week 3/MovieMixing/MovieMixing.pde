import processing.video.*;

Movie movie1, movie2;

void setup() {
  size(1200, 800);
  movie1 = new Movie(this, "/Users/Gene/Movies/german_train.mov");
  movie2 = new Movie(this, "/Users/Gene/Movies/flames.mov");
  movie1.loop();
  movie2.loop();
}

void draw() {
  background(0);
  float alph = map(mouseX, 0, width, 0, 255);
  tint(255, alph);
  image(movie1, 10, 10);
  tint(255, 255-alph);
  image(movie2, 10, 10);
  fill(255);
  textSize(255);
  text(frameRate, width-50, 20);
}

void movieEvent(Movie m) {
  m.read();  
}
