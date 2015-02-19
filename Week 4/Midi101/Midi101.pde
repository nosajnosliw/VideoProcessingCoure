import promidi.*;

MidiIO midiIO;

void setup() {
  size(500, 500);
  
  midiIO = MidiIO.getInstance(this);
  midiIO.openInput(0,0);
}

void draw() {
}

void noteOn(Note note, int device, int channel){
  int vel = note.getVelocity();
  int pit = note.getPitch();
  println(vel + " " + pit);
}

void noteOff(Note note, int device, int channel){
}

void controllerIn(Controller controller, int device, int channel){
  int num = controller.getNumber();
  int val = controller.getValue();
  println(num + " " + val);
}

