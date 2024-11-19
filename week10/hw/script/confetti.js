class Confetti {
  constructor(x, y, w, h, colour, force, angForce) {
    this.pos = [];
    this.vel = [];
    this.size = [];

    this.init(x, y, w, h, colour, force, angForce);
  }

  init(x, y, w, h, colour, force, angForce) {
    this.pos[0] = x;
    this.pos[1] = y;

    this.size[0] = w;
    this.size[1] = h;

    this.colour = colour;

    let randomDir = radians(random(360));
    this.vel[0] = force * cos(randomDir);
    this.vel[1] = force * sin(randomDir);

    this.ang = radians(random(360));
    this.angVel = radians(angForce);
  }

  update(force, friction) {
    for (let idx = 0; idx < 2; idx++) {
      this.vel[idx] += force[idx];
      this.pos[idx] += this.vel[idx];
      this.vel[idx] *= friction;
    }

    this.ang += this.angVel;
    this.angVel *= friction;
  }

  display() {
    push();
    rectMode(CENTER);
    translate(this.pos[0], this.pos[1]);
    rotate(this.ang);
    noStroke();
    fill(this.colour);
    rect(0, 0, this.size[0], this.size[1]);
    pop();
  }

  getDiagonal() {
    let sumSquare = pow(this.size[0] * 0.5, 2) + pow(this.size[1] * 0.5, 2);
    return sqrt(sumSquare);
  }

  isOutOfScreen() {
    return (
      this.pos[0] < -this.getDiagonal() ||
      this.pos[0] > width + this.getDiagonal() ||
      this.pos[1] < -this.getDiagonal() ||
      this.pos[1] > height + this.getDiagonal()
    );
  }
}
