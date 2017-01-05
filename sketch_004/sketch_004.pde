void setup (){
  size(640, 480);
  background(255);
  noStroke();
}

void draw(){
}

void mouseDragged(){
    if (mouseButton == LEFT){
      fill(255, 255, 0, 30);
    } else {
      fill(255, 30);
    }
    ellipse(mouseX, mouseY, 70, 70);
}

//void mouseMoved(){
//    if (mouseButton == LEFT){
//      fill(255, 0, 0, 30);
//    } else {
//      fill(255, 30);
//    }
//    ellipse(mouseX, mouseY, 70, 70);
//}

void keyTyped(){
  if(key == 's' || key == 'S'){
    save("screen.jpg");
    //saveFrame();
  }
}