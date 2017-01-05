void setup(){
  size(640, 480);
  background(0);
}

void draw(){
  blendMode(ADD);

  float x = width/2 + cos(radians(frameCount)) * 240;
  float y = height/2 + sin(radians(frameCount)) * 240;
  println(sin(radians(frameCount)));
  
  fill(10);
  ellipse(x, y, 50, 50);  
  
  fill(255, 0, 0);
  ellipse(x, frameCount, 10, 10);
  fill(0, 0, 255);
  ellipse(frameCount, y, 10, 10);
}