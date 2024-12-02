/*
 * 👋 Hello! This is an ml5.js example made and shared with ❤️.
 * Learn more about the ml5.js project: https://ml5js.org/
 * ml5.js license and Code of Conduct: https://github.com/ml5js/ml5-next-gen/blob/main/LICENSE.md
 *
 * This example demonstrates face tracking on live video through ml5.faceMesh.
 */

let faceMesh;
let video;
// 여러 얼굴을 인식할 수도 있게 만들기 위해서 어레이로 변수를 생성했다.
let faces = [];
// object, faceMash에게 넣어주는 옵션들의 값이 들어가 있다.
let options = { maxFaces: 1, refineLandmarks: false, flipHorizontal: false };

// preload = p5.js의 문법. 웹은 비동기화 되어 있는 환경이다. 모든 것이 다 로딩이 된 후 화면에 보여주게 끔 하는 것이다.
// 로드 될 내용이 큰 경우에는 미리 로드 될 수 있도록 하는 것이다.
function preload() {
  // Load the faceMesh model
  faceMesh = ml5.faceMesh(options);
}

// setup
function setup() {
  createCanvas(640, 480);
  // Create the webcam video and hide it
  video = createCapture(VIDEO);
  video.size(640, 480);
  // hide를 넣지 않으면 createCapture로 보이는 video도 같이 보인다.
  video.hide();
  // Start detecting faces from the webcam video
  // 만약에 다 끝나면 gotFaces 함수를 찾아서 실행해달라.
  // 현재의 코드 : 1개의 얼굴을 분석하는 것이 끝났다면, 함수 실행
  faceMesh.detectStart(video, gotFaces);
}

function draw() {
  // Draw the webcam video
  image(video, 0, 0, width, height);

  // Draw all the tracked face points
  for (let i = 0; i < faces.length; i++) {
    let face = faces[i];
    // for (let j = 0; j < face.keypoints.length; j++) {
    //   let keypoint = face.keypoints[j];
    //   fill(0, 255, 0);
    //   noStroke();
    //   circle(keypoint.x, keypoint.y, 5);
    // }
    let leftEye = face.leftEye;
    for (let n = 0; n < leftEye.keypoints.length; n++) {
      let keypoint = leftEye.keypoints[n];
      fill(255, 0, 0);
      noStroke();
      circle(keypoint.x, keypoint.y, 5);
    }
  }
}

// Callback function for when faceMesh outputs data
function gotFaces(results) {
  // Save the output to the faces variable
  faces = results;
}

function keyPressed() {
  if (key === 'o' || key === 'O') {
    console.log(faces);
  }
}
