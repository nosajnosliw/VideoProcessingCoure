PGraphics pg;

void setup() {
  size(800, 800);
  
  // PGraphics is the pixel buffer we draw graphics onto
  // the entire canvas is an instance of the PGraphics class
  // all of the graphical commands available to us, e.g. fill, ellipse,
  // line, background, etc, are functions of the pgraphics class
  // adding graphics must always be preceded by beginDraw() and 
  // ended with endDraw() 
  
  pg = createGraphics(500, 500);
  
  pg.beginDraw();
  pg.background(255, 0, 0);
  pg.fill(0, 255, 0);
  pg.ellipse(250, 250, 300, 300);
  pg.endDraw();
  
}

void draw() { 
  background(0);
  image(pg, 50, 50);
  image(pg, 400, 400);
}
