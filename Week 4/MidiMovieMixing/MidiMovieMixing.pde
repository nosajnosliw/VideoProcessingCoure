import processing.video.*;
import promidi.*;

MidiIO midiIO;
Movie movie1, movie2;

float alph;

void setup() {
  size(1200, 800);
  movie1 = new Movie(this, "/Users/Gene/Movies/german_train.mov");
  movie2 = new Movie(this, "/Users/Gene/Movies/flames.mov");
  movie1.loop();
  movie2.loop();
  
  midiIO = MidiIO.getInstance(this);
  midiIO.openInput(0,0);
  
  alph = 0;
}

void draw() {
  background(0);
  
  
  tint(255, alph);
  image(movie1, 10, 10);
  tint(255, 255-alph);
  image(movie2, 10, 10);
  
  fill(255);
  textSize(255);
  text(frameRate, width-50, 20);
}

void controllerIn(Controller controller, int device, int channel){
  int num = controller.getNumber();
  int val = controller.getValue();
  
  if (num==1) {
    alph = map(val, 0, 127, 0, 255);
  }
}

void movieEvent(Movie m) {
  m.read();  
}
