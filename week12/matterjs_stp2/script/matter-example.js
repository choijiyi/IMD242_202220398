// // module aliases
// var Engine = Matter.Engine,
//   Render = Matter.Render,
//   Runner = Matter.Runner,
//   Bodies = Matter.Bodies,
//   Composite = Matter.Composite;
//짧게 쓰기 위한 변수 처리
//Object Destructuring을 사용하면 5개 변수를 한 번에 만들 수 있고, Matter.Engine이 있다는 가정하에 사용해야 한다는 점을 유의해야 한다.
const { Engine, Render, Runner, Bodies, Composite } = Matter;
//만약 같은 이름의 변수가 있다면 ex) Composite: mComposite로 작성해주면 된다.

// // create an engine
// var engine = Engine.create();
// 물리 시뮬레이션을 위한 Engine 생성 (필수) class의 constructor같은 부분이라 생각하면 된다.
const anyEngine = Engine.create();

// // create a renderer
// // 여기에서 사용하는 괄호의 구조가 js에서 많이 사용되는 구조이다.
// var render = Render.create({
//   // 웹 페이지의 어디에 matter를 넣고 싶은지 위치를 지정하는 것이다.
//   element: document.body,
//   // 앞쪽의 엔진은 필드이다. 그럼 우리가 작성한 코드에서는 engine: anyEngine으로 작성되어야 하는 것이다.
//   engine: engine,
// });
// 화면에 그리기 위한 렌더러 생성 (만약 p5에서 그릴 것이라면 필수사항은 아니다.)
const anyRender = Render.create({
  element: document.body,
  engine: anyEngine,
  options: { width: 600, height: 800 },
});

// // create two boxes and a ground
// // 박스를 만들고, 땅바닥도 만들기
// // isStatic: true를 넣으면 힘이 가해져도 움직이지 않거나 뚫리지 않도록 만드는 옵션이다. 게임의 벽 같은...
// var boxA = Bodies.rectangle(400, 200, 80, 80);
// var boxB = Bodies.rectangle(450, 50, 80, 80);
// var ground = Bodies.rectangle(400, 610, 810, 60, { isStatic: true });
//월드에 집어넣을 바디를 생성
//두개는 박스, 하나는 같은 박스지만, 스태틱 처리가되어 바닥으로 역할을 한다.
// Matter.Bodies.rectangle(x, y, width, height, [options])
// options는 넣어도 되고 안 넣어도 된다.
// rectangle의 좌표가 CENTER로 설정되어 있다. 이는 각각의 프로그램 마다 다를 수 있는 사항이다.
let boxA = Bodies.rectangle(400, 200, 80, 80);
let boxB = Bodies.rectangle(450, 50, 80, 80);
let circle = Bodies.circle(200, 100, 40, 40);
let ground = Bodies.rectangle(400, 610, 810, 60, { isStatic: true });

// // add all of the bodies to the world
// // 월드에 만든 바디(개체)들을 집어넣는다.
// // 집어넣기 위해서 composite를 사용한다.
// Composite.add(engine.world, [boxA, boxB, ground]);
// 개체 여러개를 한 번에 넣기 위해서 []를 이용해 array의 형식으로 작성한다.
// array 형식으로 작성하지 않는 경우, 같은 구문을 필요한 횟수만큼 작성한다는 방법도 있다.
Composite.add(anyEngine.world, [boxA, boxB, ground]);
Composite.add(anyEngine.world, circle);

// // run the renderer
// Render.run(render);
// 정해진 시간에 맞춰 렌더를 돌린다.
// 렌더 모듈에게 만든 렌더 객체 넣어서 굴리라고 말하기
Render.run(anyRender);

// // create runner
// var runner = Runner.create();
// 계속 실행을 보장하는 러너 생성
const anyRunner = Runner.create();

// // run the engine
// Runner.run(runner, engine);
// 무한 실행을 담당하는 부분
// 러너 모듈에게 생성된 러너와 생성된 엔진을 집어넣고 시동 걸기(무한 실행 보장)
Runner.run(anyRunner, anyEngine);
