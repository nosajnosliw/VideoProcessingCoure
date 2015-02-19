// color representation
// a color channel is on an integer scale between 0 (min) and 255 (max)
// 4 numbers: red, green, blue, alpha (transparency)
// 3 numbers: red, green, blue (alpha is automatically set to 255, which means no transparency)
// 2 numbers: grayscale, alpha (automatically red=green=blue)
// 1 number : grayscale (red=green=blue, no transparency)

size(500, 500);

background(255, 0, 0);

fill(120, 50, 190);
stroke(0, 255, 0);
strokeWeight(15);
ellipse(250, 250, 200, 200);
fill(50, 90, 200, 100);
rect(250, 250, 150, 200);

textSize(50);
text("hello world", 40, 40);
