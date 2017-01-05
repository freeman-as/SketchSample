void setup(){
  size(640, 480);
  background(0);
  strokeWeight(3);
  strokeCap(SQUARE); // 線の端を角のままに
}

void draw(){
  if(mousePressed){
    if(mouseButton == LEFT){
      blendMode(ADD);
    } else {
      blendMode(MULTIPLY);
      stroke(0);
    }
    
    for(int angle = 0; angle < 360; angle += 360 / 10){
        pushMatrix();
        
        translate(width/2, height/2);
        rotate(radians(angle));
        translate(-width/2, -height/2);
        
        line(pmouseX, pmouseY, mouseX, mouseY);
        
        popMatrix();
    }
  }
}

void mousePressed(){
    stroke(random(256), random(256), random(256));
}