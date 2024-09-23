void setup() {
  //창 사이즈 설정
  size(1000, 1000);
}

void draw() {
  //배경색 설정
  background(255, 197, 197);
  //원 그리기 설정
  ellipseMode(CORNER);
  noStroke();
  //고양이 귀
  fill(200);
  //고양이 귀 회색 사각(왼)
  quad(463.08, 380.81, 505.35, 380.81, 502.91, 470.25, 418.22, 470.25);
  //고양이 귀 회색 사각(오)
  quad(537.77, 380.81, 580.05, 380.81, 591.78, 480, 492.91, 470.25);
  //고양이 귀 회색 타원(왼)
  pushMatrix();
  translate (474.63, 355.66);
  rotate(radians(25.94));
  ellipse(0, 0, 43.26, 47.13);
  popMatrix();
  //고양이 귀 회색 타원(오)
  pushMatrix();
  translate (549.16, 357.11);
  rotate(radians(25.94));
  ellipse(0, 0, 43.26, 47.13);
  popMatrix();
  //고양이 귀 핑크 사각(왼)
  fill(255, 175, 175);
  quad(469.78, 395.69, 499.58, 395.69, 497.87, 458.74, 438.16, 458.74);
  //고양이 귀 핑크 사각(오)
  quad(547.05, 402.4, 575.92, 402.5, 583.94, 470.25, 516.41, 463.58);
  //고양이 얼굴
  fill(200);
  ellipse(400, 425, 200, 150);
  //고양이 귀 핑크 타원(왼)
  fill(255, 175, 175);
  pushMatrix();
  translate (477.93, 377.96);
  rotate(radians(25.94));
  ellipse(0, 0, 30.5, 33.22);
  popMatrix();
  //고양이 귀 핑크 타원(오)
  pushMatrix();
  translate (555, 385.18);
  rotate(radians(25.94));
  ellipse(0, 0, 30.5, 33.22);
  popMatrix();
  //고양이 눈 흰자
  fill(255);
  //왼쪽 흰자
  circle(445, 455, 50);
  //오른쪽 흰자
  circle(505, 455, 50);
  //고양이 눈 동공
  fill(0);
  //왼쪽 동공
  //circle(455, 465, 30);
  var mx = constrain(mouseX, 455-7, 455+7);
  float my = constrain(mouseY, 465-7, 465+7);
  circle(mx, my, 30);
  //오른쪽 동공
  //circle(515, 465, 30);
  float mx1 = constrain(mouseX, 515-7, 515+7);
  float my1 = constrain(mouseY, 465-7, 465+7);
  circle(mx1, my1, 30);
  //고양이 눈 하이라이트
  fill(255);
  //왼쪽 하이라이트
  //circle(469.5, 468.14, 10);
  float mx2 = constrain(mouseX, 469.5-7, 469.5+7);
  float my2 = constrain(mouseY, 468.14-7, 468.14+7);
  circle(mx2, my2, 10);
  //오른쪽 하이라이트
  //circle(530.5, 468.14, 10);
  float mx3 = constrain(mouseX, 530.5-7, 530.5+7);
  float my3 = constrain(mouseY, 468.14-7, 468.14+7);
  circle(mx3, my3, 10);
  //고양이 코
  fill(0);
  triangle(490.52, 497.74, 509.48, 497.74, 500, 505.97);
  //고양이 수염
  strokeWeight(2);
  stroke(0);
  //고양이 수염 (왼위)
  float my4 = constrain(mouseY, 490.06-17, 490.06+17);
  line(381.07, my4, 438.01, 498.61);
  //고양이 수염 (왼아래)
  float my5 = constrain(mouseY, 516.07-17, 516.07+17);
  line(381.38, my5, 438.32, 506.96);
  //고양이 수염 (오위)
  float my6 = constrain(mouseY, 477.23-17, 477.23+17);
  line(566.1, 499.09, 613.68, my6);
  //고양이 수염 (오아래)
  float my7 = constrain(mouseY, 504.01-17, 504.01+17);
  line(566.5, 504.97, 621.64, my7);
}

//https://ko.khanacademy.org/computer-programming/constrainvalue-min-max/5870136103796736
//https://processing.org/reference/constrain_.html
