import processing.video.*;

Movie movie;
int amtPosterize;

void setup() {
  size(1200, 900);
  //noCursor();
  movie = new Movie(this, "/Users/Gene/Desktop/Media/flames.mov");
  movie.loop();
  amtPosterize = 5;
}

void draw() {
  background(0);
  image(movie, 10, 10);
  filter(POSTERIZE, amtPosterize);
}

void movieEvent(Movie m) {
  m.read();  
}

void keyPressed() {
  if        (key=='1') {
    movie.jump(0.1*movie.duration());
  } else if (key=='2') {
    movie.jump(0.3*movie.duration());
  } else if (key=='3') {
    movie.jump(0.8*movie.duration());
  } else if (keyCode==LEFT) {
    amtPosterize -= 1;    
  } else if (keyCode==RIGHT) {
    amtPosterize += 1;
  } 
}

void mouseMoved() {
  filter(THRESHOLD, (float)mouseX/width);
}
