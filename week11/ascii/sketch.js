let gradientText = ' .:-=+*#%@';
let canvasSize = [640, 480];
let scale = 0.1;
let captureSize = [canvasSize[0] * scale, canvasSize[1] * scale];
let tileWidth = canvasSize[0] / captureSize[0];

let capture;

function setup() {
  createCanvas(canvasSize[0], canvasSize[1]);
  capture = createCapture(VIDEO, { flipped: true });
  capture.size(captureSize[0], captureSize[1]);
  capture.hide();
}

function draw() {
  background(0);
  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  // text(gradientText.charAt(3), 20, 20);

  // 새로워진 픽셀 정보를 로드하기 위해서는 capture.loadPixels();를 꼭 넣어야 한다.
  capture.loadPixels();
  for (let idx = 0; idx < capture.pixels.length / 4; idx++) {
    let r = capture.pixels[4 * idx + 0];
    let g = capture.pixels[4 * idx + 1];
    let b = capture.pixels[4 * idx + 2];
    let a = capture.pixels[4 * idx + 3];

    let bright = brightness([r, g, b]);
    let gradientIdx = map(bright, 0, 255, 0, gradientText.length - 1);
    gradientIdx = floor(gradientIdx);

    let asciiText = gradientText.charAt(gradientIdx);

    // 항상 width 너비로 계산해야 함을 잊지 말고 실수하지 말자
    let column = idx % captureSize[0];
    let row = floor(idx / captureSize[0]);

    let x = column * tileWidth + tileWidth * 0.5;
    let y = row * tileWidth + tileWidth * 0.5;

    text(asciiText, x, y);
  }
}

// 글자가 하나 있으면 문자
// 여러개 있으면 문자열이다. (가로로)
//gradientText.charAt
// char = character => 한글자
