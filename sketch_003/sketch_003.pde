void setup (){
  size(640, 480);
  background(255);
}

void draw(){
  if(mousePressed){
    strokeWeight(20);
    if(mouseButton == LEFT){
      stroke(0);
    } else {
      stroke(255);
    }
  
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void keyTyped(){
  if(key == 's' || key == 'S'){
    save("screen.jpg");
    //saveFrame();
  }
}