const Engine = Matter.Engine,
  Composites = Matter.Composites,
  MouseConstraint = Matter.MouseConstraint,
  Mouse = Matter.Mouse,
  Composite = Matter.Composite,
  Bodies = Matter.Bodies;

// create engine
const engine = Engine.create(),
  world = engine.world;

// add bodies
// 처음 생성될 때 겹치지 않고 줄 맞춰 생성되도록 하는 코드
// 어레이 상태로 생성된 것들을 stack이 가지고 있고 월드에 넣어주는 것이다.
const stack = Composites.stack(
  200,
  606 - 25.25 - 5 * 40,
  10,
  5,
  0,
  0,
  // 콜백 함수
  function (x, y) {
    return Bodies.rectangle(x, y, 40, 40);
  }
);
Composite.add(world, [stack]);

//walls를 분리해서 넣어준다.
let walls = [
  Bodies.rectangle(400, 0, 800, 50, { isStatic: true }),
  Bodies.rectangle(800, 300, 50, 600, { isStatic: true }),
  Bodies.rectangle(0, 300, 50, 600, { isStatic: true }),
  Bodies.rectangle(400, 606, 800, 50.5, { isStatic: true }),
];

// 벽에 사용된 것 까지 총 54개의 ractangle이 생성되는 것이다.

Composite.add(world, walls);

// add mouse control
// 마우스와의 상호작용
// 마우스도 물리적인 하나의 개체로서 들어가야 한다. 마우스를 생성 하고 월드에 넣어야 한다는 것
// const mouse = Mouse.create(render.canvas),
//   mouseConstraint = MouseConstraint.create(engine, {
//     mouse: mouse,
//     constraint: {
//       stiffness: 0.2,
//       render: {
//         visible: false,
//       },
//     },
//   });

// Composite.add(world, mouseConstraint);

function setup() {
  createCanvas(800, 600);
  background(255);
  console.log(stack);
}

function draw() {
  background(255);

  stack.bodies.forEach((aBody) => {
    beginShape();
    aBody.vertices.forEach((aVertex) => {
      vertex(aVertex.x, aVertex.y);
    });
    endShape(CLOSE);
  });

  walls.forEach((eachWall) => {
    beginShape();
    eachWall.vertices.forEach((eachVertex) => {
      vertex(eachVertex.x, eachVertex.y);
    });
    endShape(CLOSE);
  });
}
