let tileNumX = 16;
let tileNumY = 12;

function setup() {
  createCanvas(640, 480);
}

function draw() {
  background('aquamarine');
  noStroke();
  fill('slateblue');
  // for (let col = 0; col < width; col += 40) {
  //   for (let row = 0; row < height; row += 40) {
  //     let x = 20 + col;
  //     let y = 20 + row;
  //     let diameter = 30;
  //     circle(x, y, diameter);
  //   }
  // }

  for (let row = 0; row < tileNumY; row++) {
    for (let col = 0; col < tileNumX; col++) {
      let tileW = width / tileNumX;
      let tileH = height / tileNumY;
      let x = tileW * 0.5 + col * tileW;
      let y = tileH * 0.5 + row * tileH;
      ellipse(x, y, tileW, tileH);
    }
  }
}
