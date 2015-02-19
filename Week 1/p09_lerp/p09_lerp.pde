size(500, 500);

float x1 = 50;
float y1 = 50;
float x2 = 450;
float y2 = 450;

line(x1, y1, x2, y2);

for (int i=0; i<10; i++) {
  float x = lerp(x1, x2, i/10.0);
  float y = lerp(y1, y2, i/10.0);
  ellipse(x, y, 10, 10);
}
