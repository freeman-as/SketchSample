size(640, 480);
background(255);
noStroke();

for(int i = 0; i < 20; i++){
  float x = (int)random(0, 7);
  float y = int(random(0, 5));
  float r = random(0, 256);
  float g = random(0, 256);
  float b = random(0, 256);
  
  fill(r, g, b);
  ellipse(x * 100, y * 100, 100, 100);
}