void setup(){
  size(640, 480);
  background(0);
}

void draw(){
  blendMode(ADD);
  float x = frameCount;
  float y = height/2 + sin(radians(frameCount)) * 240;
  //float y = height/2 * (sin(radians(frameCount)) + 1);
  println(sin(radians(frameCount)));
  
  fill(10);
  ellipse(x, y, 50, 50);  
}