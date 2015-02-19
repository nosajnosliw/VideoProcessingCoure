import processing.video.*;

Movie movie;
PImage img;

void setup() {
  size(1300, 800);
  movie = new Movie(this, "/Users/Gene/Desktop/Media/flames.mov");
  movie.loop();  
  img = createImage(300, 300, RGB);
}

void movieEvent(Movie m) {
  m.read();  
}

void draw() {
  image(movie, 10, 10);
  img.copy(movie, mouseX, mouseY, 300, 0, 0, 300, 300);  
  image(img, width-350, 10);
}


