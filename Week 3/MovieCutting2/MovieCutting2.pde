import processing.video.*;

Movie movie;
PImage img;

void setup() {
  size(1300, 800);
  imageMode(CENTER);
  movie = new Movie(this, "/Users/Gene/Desktop/Media/flames.mov");
  movie.loop();
  
  img = createImage(800, 600, RGB);
}

void movieEvent(Movie m) {
  m.read();  
}

void draw() {
  background(0);
  
//  for (int i=0; i<10; i++) {
    img.copy(movie, (int)random(movie.width-200), (int)random(movie.height-200), 200, 200,
              (int)random(img.width), (int)random(img.height), (int)random(300), (int)random(300));
//  }
  image(img, width/2, height/2);
}


