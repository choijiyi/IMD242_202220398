//float h = hour();
//float m = minute();
//float s = second();
float rad;
float rectA;
float rectB;
float rectC;
float rectD;
float hAngle;
float mAngle;
float sAngle;

void setup() {
  size(800, 800);
  background(0);
  rad = 300;
  rectA = 4;
  rectB = 30;
  rectC = 1;
  rectD = 13;
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  circle(width * 0.5, height * 0.5, rad * 2);

  for (float a = 0; a < 360; a++) {
    pushMatrix();
    translate(width * 0.5, height * 0.5);
    rotate(radians(a * 30));
    fill(0);
    rect(0, -rad, rectA, rectB);
    popMatrix();
  }

  for (float a = 0; a < 360; a++) {
    pushMatrix();
    translate(width * 0.5, height * 0.5);
    rotate(radians(a * 6));
    fill(0);
    rect(0, -rad, rectC, rectD);
    popMatrix();
  }

  float h = hour() % 12;
  hAngle = map(h, 0, 11, 0, radians(360));
  pushMatrix();
  translate(width * 0.5, height * 0.5);
  rotate(hAngle);
  strokeWeight(6);
  stroke(0);
  line(0, 0, 0, -rad * 0.6);
  popMatrix();
  
  float m = minute();
  mAngle = map(m, 0, 59, 0, radians(360));
  pushMatrix();
  translate(width * 0.5, height * 0.5);
  rotate(mAngle);
  strokeWeight(5);
  stroke(0, 0, 255);
  line(0, 0, 0, -rad * 0.8);
  popMatrix();
  
  float s = second();
  sAngle = map(s, 0, 59, 0, radians(360));
  pushMatrix();
  translate(width * 0.5, height * 0.5);
  rotate(sAngle);
  strokeWeight(3);
  stroke(255, 0, 0);
  line(0, 40, 0, -rad);
  popMatrix();

  pushMatrix();
  translate(width * 0.5, height * 0.5);
  fill(255, 0, 0);
  noStroke();
  circle(0, 0, 25);
  popMatrix();
}
