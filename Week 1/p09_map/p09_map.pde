size(500, 500);

// convert fahrenheit to celcius

float f = 98.6;
float c = map(f, 32, 212, 0, 100);

println("fahrenheit = " + f);
println("celcius = " + c);
