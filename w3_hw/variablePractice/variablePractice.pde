float size = random(100, 200);
float rotation = random(degrees(0), degrees(360));
float r = random(255);
float g = random(255);
float b = random(255);

void setup() {
  size(800, 800);
  background(0);
  strokeWeight(1);
}

void draw() {
  size = random(100, 200);
  rotation = random(degrees(0), degrees(360));
  r = random(200, 255);
  g = random(200, 255);
  b = random(200, 255);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotation);
  ellipseMode(CORNER);
  noFill();
  stroke(r, g, b);
  circle(0, 0, size);
  popMatrix();
}
