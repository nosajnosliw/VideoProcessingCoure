import processing.video.*;

PImage img;
Movie mov;
PGraphics pg;
PShader shade;
int idxSource;

void setup() {
  size(1024, 768, P2D);
  idxSource = 0;
  
  img = loadImage("IMG_0569.JPG");
  mov = new Movie(this, "/Users/Gene/Movies/german_train_grid.mov");
  mov.loop();
  
  pg = createGraphics(width, height, P2D);
  pg.beginDraw();
  pg.rectMode(CENTER);
  pg.background(0);
  pg.endDraw();
  
  shade = loadShader("wrap.glsl");
  shade.set("resolution", float(width), float(height));
  shader(shade);
}

void draw() {
  if (idxSource == 0) {
    image(img, 0, 0, width, height);
  }
  else if (idxSource == 1) {
    image(mov, 0, 0, width, height);
  }
  else if (idxSource == 2) {
    pg.beginDraw();
    pg.fill(random(100), random(100, 255), random(120), random(120));
    pg.rect(random(pg.width), random(pg.height), random(100, 200), random(100, 200));
    pg.endDraw();
    image(pg, 0, 0);
  }
}

void movieEvent(Movie m) {
  m.read();
}

void keyPressed() {
  if (key=='1')  idxSource = 0;
  else if (key=='2')  idxSource = 1;
  else if (key=='3')  idxSource = 2;
}
