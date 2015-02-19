size(500, 500);

// draw multiple circles inside a loop

for (int i=0; i<10; i++) {
  ellipse(40*i, 40*i, 50, 50);
}


// going through an array using a loop

float[] h = new float[3];
h[0] = 1.0;
h[1] = 3.4;
h[2] = 2.5;

for (int i=0; i<3; i++) {
  println(h[i]);
}

// or you can do it this way

for (float h0 : h) {
  println(h0);
}
 
