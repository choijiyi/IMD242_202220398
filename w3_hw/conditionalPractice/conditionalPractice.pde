void setup() {
  size(700, 380);
  background(0);
  ellipseMode(CORNER);
}

void draw() {
  background(0);
  
  stroke(255);
  strokeWeight(4);
  if(mouseY < 90) {
    line(297.11, 18.21, 404.67, 71.42);
  } else if(mouseY < 190) {
    fill(#FF7676);
    square(320, 112.5, 60);
  } else if(mouseY > 285) {
    fill(#C2FF86);
    circle(321.02, 302.5, 60);
  } else {
    fill(#FFB876);
    rect(285, 217.5, 130, 40, 20);
  }
  
  stroke(#939393);
  strokeWeight(2);
  line(0,95, 700,95);
  line(0,190, 700,190);
  line(0,285, 700,285);
}
