// 파티클 클래스 

class Particle {
  // 버블의 위치와 속도 array로 생성
  float[] pos;
  float[] speed;
  
  // 파티클 생성자
  Particle(float x, float y, float speedX, float speedY) {
    pos = new float[2];
    speed = new float[2];
    pos[0] = x;
    pos[1] = y;
    speed[0] = speedX;
    speed[1] = speedY;
  }
  
  // 파티클의 위치를 업데이트 
  void update() {
    pos[0] += speed[0];
    pos[1] += speed[1];
    
    speed[0] += random(-5, 5);
    speed[1] += random(-5, 5);
  }
  
  // 파티클 그리기 
  void display() {
    fill(0xFFFF4545);
    noStroke();
    circle(pos[0], pos[1], width * 0.02);
  }
  
  // (gpt 도움) 파티클이 화면의 바깥으로 나갔는지 판별 
  boolean isOutOfCanvas() {
    return pos[0] < 0 || pos[0] > width || pos[1] < 0 || pos[1] > height;
  }
}
