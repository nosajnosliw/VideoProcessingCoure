String[] shaders = new String[] { 
  "blobby.glsl", "drip.glsl", "electro.glsl", "eye.glsl", "noisybg.glsl", 
  "shady.glsl", "sinewaves.glsl", "sinewaves2.glsl", "waterNoise.glsl", "heroku_example.glsl"
};
PShader myShader;
int idx;

void setup() {
  size(1200, 800, P2D);
  idx = 0;
  setupShader(idx);
}

void draw() 
{
  setShaderParameters();
  rect(0, 0, width, height);
}

void setupShader(int idx) {
  myShader = loadShader(shaders[idx]);
  myShader.set("resolution", float(width), float(height));
  shader(myShader);
}

void setShaderParameters() {
  myShader.set("time", (float)(millis() / 1000.0));

  // drip
  if (idx == 1) {  
    myShader.set("intense", 0.5);
    myShader.set("speed", 3.0);
    myShader.set("c", 0.5, 1.0);
  }

  // electro
  else if (idx == 2) {  
    myShader.set("mouse", (float)mouseX, (float)mouseY);  
    myShader.set("center", 0.5, 0.5);
  }

  // eye
  else if (idx == 3) {    
    myShader.set("mouse", (float)mouseX, (float)mouseY);
  }

  // noisybg
  else if (idx == 4) {
    myShader.set("noiseFactor", 4.1, 9.2, 8.3);        
    myShader.set("col", 0.5, 0.4, 0.01);
  }

  // shady
  else if (idx == 5) {
    myShader.set("noiseFactor", 40.01);
  }

  // sinewaves1
  else if (idx == 6) {
    myShader.set("bright", 0.7);   
    myShader.set("brightFloor", 0.3);
  }

  // sinewaves2
  else if (idx == 7) {
    myShader.set("m", 0.1, 0.01, 0.01);
  }

  // heroku example (nebula)
  else if (idx == 9) {
    myShader.set("mouse", (float)mouseX, (float)mouseY);
  }
}

void keyPressed() {
  if      (keyCode==LEFT)   idx = (shaders.length + idx - 1) % shaders.length;
  else if (keyCode==RIGHT)  idx = (idx + 1) % shaders.length;
  setupShader(idx);
}

