let capture;
let canvasWidth, canvasHeight;
let scale;
let captureWidth, captureHeight;

function setup() {
  canvasWidth = 640;
  canvasHeight = 480;
  createCanvas(canvasWidth, canvasHeight);

  scale = 0.1;
  captureWidth = canvasWidth * scale;
  captureHeight = canvasHeight * scale;

  capture = createCapture(VIDEO);
  // 1 block당 10개의 px 공간을 차지
  capture.size(captureWidth, captureHeight);
  capture.hide();
}

function draw() {
  background(0);
  // image(capture, 0, 0, width, height);
  // ellipseMode(CORNER);

  // 숫자를 가로로 세기 위해서 y의 for문을 먼저 작성한 것이다.
  for (let y = 0; y < captureHeight; y++) {
    for (let x = 0; x < captureWidth; x++) {
      let colour = capture.get(x, y);
      let b = brightness(colour);
      let diameter = map(b, 0, 255, 0, 40);
      fill(255);
      noStroke();
      circle(x * 10 + 5, y * 10 + 5, diameter);
      // fill(colour[0], colour[1], colour[2]);
      // noStroke();
      // circle(x * 10, y * 10, 10);
    }
  }
}

// RGB에서 밝기를 추출하는 방법
// (R + G + B) / 3 = 0 ~ 255 사이의 값이 나온다. 숫자가 높을 수록 밝음
// 이를 해주는 함수가 brightness()이다.

// processing에서 사용하던 map함수
// 아이패드 w11파일 참고
