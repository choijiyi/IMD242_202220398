// 화면의 상단에 위치할 Bubble들 
Bubble[] bubbles;
// 날릴 예정인 버블 
Bubble shotBubble;
// 파티클의 어레이 리스트 
ArrayList<Particle> particles;
// (gpt도움) 나중에 파티클이 생성되면 기존에 있던 원들을 지우기 위해서 만든 boolean 파티클이 생성되면 화면에 기존에 있던 원을 지우고, 파티클이 생성되기 전에는 11개의 원이 보인다.
boolean ifParticleMake = false;

void setup() {
  fullScreen();
  //size(800, 800);
  background(255);

  // 버블들의 크기에 사용할 변수, 어떤 크기의 화면에서도 원의 갯수를 동일하게 유지하기 위해서 width의 비율로 설정 circleSize => circleS
  float circleS = width * 0.1;

  // 윗줄에 생성할 원의 갯수 
  int numCircles = 10;

  // (gpt도움) bubbles 배열에 Bubble 저장하기 위한 상자를 numCircles만큼 생성하기 
  bubbles = new Bubble[numCircles];
  // particle 객체 저장할 어레이 리스트
  particles = new ArrayList<Particle> ();

  // 상단 원을 생성하는 for문 
  for (int idx = 0; idx < numCircles; idx++) {
    float x = idx * circleS + circleS / 2;
    float y = circleS - circleS / 2;
    bubbles[idx] = new Bubble(x, y, circleS);
  }

  // 날아가는 원의 x, y좌표 변수 
  float shotBubbleX = width * 0.5;
  float shotBubbleY = height;

  // 날아가는 원 생성 
  shotBubble = new Bubble(shotBubbleX, shotBubbleY, circleS);
}

void draw() {
  background(255);
  // 버블의 크기 변수, 사실 setup하고 draw에서 둘 다 사용되는 변수라서 지역변수가 아니라 전역변수로 밖에 놓고 쓰고 싶은데, width 때문인지 setup위에 두면 작동을 안한다...
  float circleS = width * 0.1;

  // (gpt 도움) 파티클이 생성되지 않았을 때, 버블들을 화면에 표시 
  if (!ifParticleMake) {
    for (int idx = 0; idx < bubbles.length; idx++) {
      bubbles[idx].display();
    }
    shotBubble.display();
  }

  // 마우스를 누르고 있는 동안 날아가는 버블은 y 좌표가 circleS + circleS / 2 -20 보다 작은 동안 -10씩 좌표가 이동한다.
  if (mousePressed) {
    //(gpt 도움) 마우스의 x좌표에 따라 슛버블의 방향이 바뀜 
    if (shotBubble.x < mouseX) {
      shotBubble.x += 5; 
    } else if (shotBubble.x > mouseX) {
      shotBubble.x -= 5;
    }
    
    if (shotBubble.y > circleS + circleS / 2 -20) {
      shotBubble.y -= 10;
    }
    
    // (gpt 도움) 날아가는 버블의 좌표가 조건과 같거나 작으면 파티클이 생성되고, 그 후에는 더 이상 파티클이 생성되지 않도록 한다.
    if (shotBubble.y <= circleS + circleS / 2 - 20 && !ifParticleMake) {
      createParticles();
      ifParticleMake = true;
    }
  }
  
  // (gpt 도움) 파티클의 위치 데이터를 업데이트하고, 화면에 그리고 화면 바깥으로 나갔다는 판정이 되면 배열에서 particle을 삭제한다.
  for (int idx = particles.size() - 1; idx >= 0; idx--) {
    Particle p = particles.get(idx);
    p.update();
    p.display();

    if (p.isOutOfCanvas()) {
      particles.remove(idx);
      //println(particles);
    }
  }

  // ArrayList의 크기를 화면에 표시해 주는 text 
  fill(0);
  textSize(32);
  textAlign(LEFT, TOP);
  text("Particles: " + particles.size(), 10, 10); // 좌측 상단에 출력
  
  //(gpt 도움) 파티클의 갯수가 0이 되면 화면을 리셋한다.
  if (ifParticleMake && particles.size() == 0) {
    reset();
  }
}

// 각 버블 당 생성할 파티클의 갯수를 저장한 변수 
int particleNum = 100;

// 파티클 생성 함수 
void createParticles() {
  
  // (gpt 도움) 버블의 갯수만큼 반복 
  for (int idx = 0; idx < bubbles.length; idx++) {
    Bubble b = bubbles[idx];
    // 파티클 생성 
    for (int idx2 = 0; idx2 < particleNum; idx2++) {
      float x = b.x;
      float y = b.y;
      particles.add(new Particle(x, y, random(-5, 5), random(-5, 5)));
    }
  }
}

// 리셋 함수 (gpt 도움)
void reset() {
  // 아래에서 circleS 변수가 사용되므로 한 번 더 선언 (지역변수)
  float circleS = width * 0.1;
  
  // 파티클이 다시 생성될 준비가 되도록
  ifParticleMake = false;

  // 이동해서 좌표값이 바뀐 슛버블을 다시 생성할 위치 변수 
  float shotBubbleX = width * 0.5;
  float shotBubbleY = height;
  
  // 슛 버블 생성 
  shotBubble = new Bubble(shotBubbleX, shotBubbleY, circleS);
  
  // 상단 버블은 이동하지 않고 다시 그 자리에 생성되면 되므로 별도의 리셋이 필요 없지만 슛 버블은 이동했기 때문에 리셋에서 위치를 다시 정의해줄 필요가 있음을 알게 됨 
}
