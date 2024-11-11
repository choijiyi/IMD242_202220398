let capture;
let width = 100;
let height = 100;

function setup() {
  createCanvas(width, height);
  capture = createCapture(VIDEO);
  capture.size(200, 200);
  capture.hide();
}

function draw() {
  background(220);
  image(capture, 0, 0, width, height);
}
