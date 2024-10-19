int[] monsterHP;
String[] monsterNames = {
  "Stone Talus",
  "Igneo Talus Titan",
  "Hinox",
  "Stalnox",
  "Molduga",
  "Moldking",
  "Calamity Ganon",
  "Coop"
};

void setup() {
  size(1280, 720);
  monsterHP = new int[monsterNames.length];
  for (int n = 0; n < monsterNames.length; n++) {
    if (n != 7) {
      monsterHP[n] = int(random(30, 800));
    } else {
      monsterHP[n] = 1000;
    }
  }
}

float barGap = 160;
float barWidth = 24;
float x = 80;

void draw() {
  background(0);

  for (int n = 0; n < monsterNames.length; n++) {
    strokeCap(SQUARE);
    textAlign(CENTER);
    
    strokeWeight(barWidth * 1.7);
    stroke(#66ff33);
    line(x + barGap * n, height * 0.7 + 8,
      x + barGap * n, height * 0.7 - monsterHP[n] * 0.4 - 8);
    
    strokeWeight(barWidth * 1.5);
    stroke(0);
    line(x + barGap * n, height * 0.7 + 6,
      x + barGap * n, height * 0.7 - monsterHP[n] * 0.4 - 6);
    
    strokeWeight(barWidth);
    stroke(#66FF33);
    textSize(18);
    fill(#66FF33);
    line(x + barGap * n, height * 0.7,
      x + barGap * n, height * 0.7 - monsterHP[n] * 0.4);
    text(monsterNames[n],
      x + barGap * n, height * 0.7 + 40);
    text(monsterHP[n] * 10,
      x + barGap * n, height * 0.7 - monsterHP[n] * 0.4 - 20);
  }
  
  float total = 0;
  for(int n = 0; n < monsterNames.length; n++) {
    total += monsterHP[n];
    //println(total);
  }
  fill(#66ff33);
  textSize(24);
  text("Total : ", width * 0.46, height * 0.5 + 250);
  text(total, width * 0.53, height * 0.5 + 250);
  
  float average = total / monsterNames.length;
  text("Average : ", width * 0.46, height * 0.5 + 300);
  text(average, width * 0.53, height * 0.5 + 300);
}
