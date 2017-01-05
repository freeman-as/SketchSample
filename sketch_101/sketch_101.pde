void setup() {
  size(750, 350);
  noFill();
  strokeWeight(5);
  rectMode(CENTER);
}

void draw() {
  background(0);

  // 左半分
  if (mouseX <= width/2) {
    // 上半分
    if (mouseY <= height/2) {
      stroke(220, 90, 20);
      ellipse(mouseX, mouseY, 50, 50);
    }
    // 下半分
    else {
      stroke(50, 110, 150);
      line(mouseX-25, mouseY-25, mouseX+25, mouseY+25);
      line(mouseX+25, mouseY-25, mouseX-25, mouseY+25);
    }
  }
  // 右半分
  else {
    // 上半分
    if (mouseY <= height/2) {
      stroke(230, 175, 150);
      rect(mouseX, mouseY, 50, 50);
    }
    // 下半分
    else {
      stroke(65, 180, 110);
      triangle(mouseX-25, mouseY+25, mouseX, mouseY-25, mouseX+25, mouseY+25);
    }
  }
}

void fadeToWhite() {
    noStroke();
    //fill(LENGTH- 1, LENGTH * 0.3);
    fill(99, 30);
    rectMode(CORNER);
    rect(0, 0, width, height);
}

color randomRGBColor(int r, int g, int b) {
    color c = color(random(r), random(g), random(b), 80);
    return c;
}
color randomRGBColor(int r, int g, int b, int a) {
    color c = color(random(r), random(g), random(b), random(a));
    return c;
}

void keyPressed(){
    if(keyCode == ENTER) save("screen.png");
}
void keyTyped(){
    if(key == 's' || key == 'S') saveFrame("screen_##.png");
}