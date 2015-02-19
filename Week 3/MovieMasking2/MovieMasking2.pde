import processing.video.*;

Movie movie1, movie2;

void setup() {
  size(1300, 800);
  movie1 = new Movie(this, "/Users/Gene/Movies/flames.mov");
  movie1.loop();
  movie2 = new Movie(this, "/Users/Gene/Movies/flames.mov");
  movie2.loop();
}

//void movieEvent(Movie m) {
//  m.read();  
//}

void draw() {
  if (movie1.available()) {
    movie1.read();
    movie2.read();
    background(0,50, 0);
    movie2.filter(POSTERIZE, 3);
    movie1.mask(movie2);
    movie1.filter(THRESHOLD, 0.5);
    image(movie2, 10, 10);
    image(movie1, 10, 10);
  }
}


