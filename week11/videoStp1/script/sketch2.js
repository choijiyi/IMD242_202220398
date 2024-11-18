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
  capture.size(captureWidth, captureHeight);
  capture.hide();
}

function draw() {
  background('cornflowerblue');

  capture.loadPixels();
  // for (let idx = 0; idx < capture.pixels.length; idx++) {
  for (let idx = 0; idx < capture.pixels.length / 4; idx++) {
    // let colour = capture.pixels[idx];
    let r = capture.pixels[4 * idx];
    let g = capture.pixels[4 * idx + 1];
    let b = capture.pixels[4 * idx + 2];
    let a = capture.pixels[4 * idx + 3];

    let bright = brightness([r, g, b]);
    let diameter = map(bright, 0, 255, 0, 20);

    let x = idx % captureWidth;
    let y = floor(idx / captureWidth);
    fill(255);
    noStroke();
    circle(x * 10 + 5, y * 10 + 5, diameter);
  }
}
