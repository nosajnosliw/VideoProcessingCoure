String[] shaders = new String[] {
  "deform.glsl", "modcolor.glsl", "noiseoff.glsl", 
  "vert1.glsl", "vert2.glsl", "wrap.glsl" };
PGraphics pg;
PImage img;
PShader myShader;
int idx;
boolean isImage = true;

void setup() {
  size(828, 648, P2D);
  textureWrap(REPEAT);
  
  idx = 0;
  setupShader(idx);

  // load image  
  img = loadImage("IMG_0569.JPG");
  
  // create pgraphics
  pg = createGraphics(width, height, P2D);
  pg.beginDraw();
  pg.background(0, 255, 0);
  for (int i=0; i<100; i++) {
    pg.fill(random(255), random(255), random(255));
    pg.ellipse(random(pg.width), random(pg.height), 100, 100);
  }
  pg.endDraw();
}

void draw() {
  setShaderParameters();
  if (isImage) image(img, 0, 0, width, height);
  else         image(pg, 0, 0, width, height);
}

void setupShader(int idx) {
  myShader = loadShader(shaders[idx]);
  myShader.set("resolution", float(width), float(height));
  shader(myShader);   
}

void setShaderParameters() {
  myShader.set("time", millis()/1000.0);
  
  // deform
  if (idx==0) {
    myShader.set("mouse", float(mouseX), float(mouseY));
  }
  
  // modcolor
  else if (idx==1) {
    myShader.set("m", 0.2, 0.1, 0.3, 0.2);
  }

  // noiseoff
  else if (idx==2) {
    myShader.set("m", 0.2, 0.1, 0.3, 0.2);
  }

  // vert1
  else if (idx==3) {
    myShader.set("m", 0.2, 0.1, 0.3, 0.2);
  }

  // vert2
  else if (idx==4) {
    myShader.set("m", 0.2, 0.1, 0.3);
  }
  
  // wrap
  else if (idx==5) {
    myShader.set("mouse", float(mouseX), float(mouseY));
  }
}

void keyPressed() {
  if      (keyCode==LEFT)   idx = (shaders.length + idx - 1) % shaders.length;
  else if (keyCode==RIGHT)  idx = (idx + 1) % shaders.length;
  setupShader(idx);
}
