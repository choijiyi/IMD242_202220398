// 모든 버블들의 설정 클래스 

class Bubble {
  // 버블의 위치와 지름 
  float x, y;
  float dia;
  
  // 버블 생성자 
  Bubble (float x, float y, float dia) {
    this.x = x;
    this.y = y;
    this.dia = dia;
  }
  
  // 버블을 그리는 설정 
  void display() {
    fill(0xFFFF4545);
    noStroke();
    circle(x, y, dia);
  }
}
