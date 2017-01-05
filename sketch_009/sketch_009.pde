void setup(){
  size(640, 480);
  strokeWeight(10);
  noFill();
  rectMode(CENTER);
}

void draw(){
  background(255);

  // いまの位置、向き、大きさを保存
  pushMatrix();
  
  translate(mouseX, mouseY);
  stroke(0);
  rect(0, 0, 50, 50);
  
  pushMatrix();
  rotate(radians(frameCount));
  stroke(180);
  rect(0, 0, 100, 100);
  line(0, 0, 200, 0);
  popMatrix();
  
  translate(200, 0);
  stroke(255, 0, 0);
  rect(0, 0, 50, 50);
  
  popMatrix();
  
  //scale(1.5);
  translate(width/2, height/2);
  //scale(1.5);
  stroke(255, 0, 0);
  rect(0, 0, 50, 50);
  
  rotate(radians(-frameCount));
  stroke(0, 255, 0);
  rect(0, 0, 100, 100);
}