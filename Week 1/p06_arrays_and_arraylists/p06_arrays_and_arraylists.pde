// a group of four floats
float x1 = 3.4;
float x2 = 4.5;
float x3 = 1.6;
float x4 = 2.9;

float[] x = new float[4];

x[0] = 3.4;
x[1] = 4.5;
x[2] = 1.6;
x[3] = 2.9;

println("the value of the second element is " + x[1]);

ArrayList y = new ArrayList();

y.add(3.6);
y.add(4.5);
y.add(1.9);

println("the value of the the first element is " + y.get(0));

// inserts string "hello world" into second element in arraylist, displacing subsequent elements
y.add(1, "hello world");

println(y);


// you can declare that the arraylist will contain only one type of data
ArrayList<Float> z = new ArrayList<Float>();

z.add(5.0);
z.add(2.5);
z.add(1.6);

float z0 = z.get(1);
println(z0);
