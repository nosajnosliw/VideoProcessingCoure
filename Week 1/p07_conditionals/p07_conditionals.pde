size(300, 300);

float a = random(8);  // random number 0-8
float b = random(3);  // random number 0-3


// red if b is between 1 and 2, otherwise green
if (b > 1.0 && b < 2.0) {
  fill(255, 0, 0);
}
else {
  fill(0, 255, 0);
}



if (a < 2.0) {
  ellipse(50, 50, 50, 50);
}
else if (a < 5.0) {
  ellipse(100, 100, 50, 50);
} 
else {
  ellipse(150, 150, 50, 50);
}

println("a = " + a);
println("b = " + b);
