int tileNum;
int randomSeed = 0;
float noiseMult = 0.0001;
float time = 0;

void setup() {
  size(600, 600);
}

void draw() {
  noiseSeed(randomSeed);
  background(0);
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));
  noiseMult = pow(10, map(mouseY, 0, height, -1, -5));
  
  float tileSize = width / float(tileNum);
  
  time += 0.01;
  
  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * 0.5;
      float centerY = rectY + tileSize * 0.5;
      
      float speed = map(mouseY, 0, height, 1, 0.5);
      float noiseVal = noise(centerX * noiseMult, centerY * noiseMult, time);
      
      noFill();
      stroke(255);
      circle(centerX, centerY, tileSize);
      
      pushMatrix();
      translate(centerX, centerY);
      rotate(radians(360 * noiseVal * speed));
      line(0, 0, -tileSize * 0.5, 0);
      fill(255);
      noStroke();
      circle(-tileSize * 0.4, 0, tileSize * 0.2);
      popMatrix();
    }
  }
}

// 살랑살랑만들기 gpt 짱짱맨
