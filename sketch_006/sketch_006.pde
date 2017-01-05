void setup(){
  size(640, 480);
  background(0);
  //background(255);
}

void draw(){
  blendMode(ADD);
  //blendMode(SUBTRACT);
  //blendMode(BLEND);
  stroke(20, 20, 128);

  float x = random(width);
  float y = random(height);

  line(width/2, height/2, x, y);
  
  if(mousePressed){
    noStroke();
    for(int i = 0; i < 10; i++){
      fill(random(100), random(100), random(100));
      float r = random(1, 3);
      //ellipse(x, y, r * 10, r * 10);
      ellipse(mouseX + random(-20, 20), mouseY + random(-20, 20), r, r);
    }
  }
}