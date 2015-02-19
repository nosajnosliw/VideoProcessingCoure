import processing.video.*;

String[] shaders = new String[]{"wrap.glsl", "deform.glsl", "modcolor.glsl",
  "noiseoff.glsl", "vert1.glsl", "vert2.glsl", "brcosa.glsl" };
PImage img;
Movie mov;
PGraphics pg;
PShader shade;
int idxSource;
int idxShader;

void setup() {
  size(1024, 768, P2D);
  idxSource = 0;
  idxShader = 0;
  
  img = loadImage("IMG_0569.JPG");
  mov = new Movie(this, "/Users/Gene/Movies/german_train_grid.mov");
  mov.loop();
  
  pg = createGraphics(width, height, P2D);
  pg.beginDraw();
  pg.rectMode(CENTER);
  pg.background(0);
  pg.endDraw();

  setupShader(idxShader);  
}

void draw() {
  setShaderParameters();
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

void setShaderParameters() {
  // wrap
  if (idxShader == 0) {
    // no additional parameters
  }
  // deform
  else if (idxShader == 1) {
    float mx = width * noise(0.001*frameCount);
    float my = height * noise(0.001*frameCount+5);
    float cx = map(mouseX, 0, width, 0, 25);
    float cy = map(mouseY, 0, height, 0, 25);
    shade.set("mouse", mx, my);
    shade.set("time", (float)millis()/1000.0);
    shade.set("c", cx, cy);
  }
  // modcolor
  else if (idxShader == 2) {
    float m1 = 0.6 * noise(0.01*frameCount);
    float m2 = 0.6 * noise(0.01*frameCount+5);
    float m3 = 0.6 * noise(0.01*frameCount+10);
    float m4 = 0.6 * noise(0.01*frameCount+15);
    shade.set("time", (float)millis()/1000.0);
    shade.set("m", m1, m2, m3, m4);
  }
  // noiseoff
  else if (idxShader == 3) {
    float m1 = 10 * noise(0.01*frameCount);
    float m2 = 2 * noise(0.01*frameCount+5);
    float m3 = 2 * noise(0.01*frameCount+10);
    float m4 = 3 * noise(0.01*frameCount+15);
    shade.set("time", (float)millis()/1000.0);
    shade.set("m", m1, m2, m3, m4);
  }
  // vert1
  else if (idxShader == 4) {
    float m1 = 0.6 * noise(0.01*frameCount);
    float m2 = 0.6 * noise(0.01*frameCount+5);
    float m3 = 0.6 * noise(0.01*frameCount+10);
    float m4 = 0.6 * noise(0.01*frameCount+15);
    shade.set("time", (float)millis()/1000.0);
    shade.set("m", m1, m2, m3, m4);
  }
  // vert2
  else if (idxShader == 5) {
    float m1 = 0.6 * noise(0.001*frameCount);
    float m2 = 0.6 * noise(0.001*frameCount+5);
    float m3 = 0.6 * noise(0.001*frameCount+10);
    shade.set("time", (float)millis()/1000.0);
    shade.set("m", m1, m2, m3);
  }

  // brcosa
  else if (idxShader == 6) {
    float m1 = map(noise(0.01*frameCount), 0, 1, 0.9, 1.2);
    //float m2 = map(noise(0.01*frameCount+5), 0, 1, -4, 4);
    //float m3 = map(noise(0.01*frameCount+10), 0, 1, -4, 4);
    float m2 = map(mouseX, 0, width, -5, 5);
    float m3 = map(mouseY, 0, height, -5, 5);
    shade.set("brightness", m1);
    shade.set("contrast", m2);
    shade.set("saturation", m3);
  }
 
}

void setupShader(int idx) {
  idxShader = idx;
  shade = loadShader(shaders[idxShader]);
  shade.set("resolution", float(width), float(height));
  shader(shade);
}

void movieEvent(Movie m) {
  m.read();
}

void keyPressed() {
  if (key=='1')       idxSource = 0;
  else if (key=='2')  idxSource = 1;
  else if (key=='3')  idxSource = 2;
  else if (key=='q')  setupShader(0);
  else if (key=='w')  setupShader(1);
  else if (key=='e')  setupShader(2);
  else if (key=='r')  setupShader(3);
  else if (key=='t')  setupShader(4);
  else if (key=='y')  setupShader(5);
  else if (key=='u')  setupShader(6);
  
}
