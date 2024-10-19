int randomSeed = int(random(10000));

void setup() {
  size(800, 800);
}

void mousePressed() {
  randomSeed = int(random(10000));
}

void draw() {
  randomSeed(randomSeed);
  background(#99ccff);
  noStroke();
  fill(#669900);
  rect(0, height * 0.8, width, height);

  for (int n = 0; n < random(5, 10); n++) {
    house(random(10, 680), 40, -100,
      random(200, 255), random(200, 255), random(200, 255));
  }
}

void house(float x, float houseW, float houseH,
  float r, float g, float b) {
  pushMatrix();
  translate(0, height * 0.8);
  fill(r, g, b);
  stroke(0);
  strokeWeight(1);
  rect(x, 0, houseW, houseH);
  float sHouseW = houseW * 0.3;
  float sHouseH = houseH * 0.3;
  fill(r - 100, g - 100, b -100);
  rect(x + houseW * 0.1, 0, sHouseW, sHouseH);
  fill(r - 150, g - 80, b -10);
  rect(x + houseW * 0.1, houseH + 4, sHouseW, sHouseW);
  rect(x + houseW * 0.1, houseH + sHouseW + 12, sHouseW, sHouseW);
  rect(x + houseW * 0.1, houseH + sHouseW + sHouseW + 22, sHouseW, sHouseW);
  rect(x + houseW * 0.6, houseH + 4, sHouseW, sHouseW);
  rect(x + houseW * 0.6, houseH + sHouseW + 12, sHouseW, sHouseW);
  rect(x + houseW * 0.6, houseH + sHouseW + sHouseW + 22, sHouseW, sHouseW);
  popMatrix();
}
