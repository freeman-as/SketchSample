void setup(){
  size(640, 480);
  noStroke();
}

void draw(){
  background(255);
  
  int h = 100;
  int num = mouseY / h;
  
  switch (num){
    case 0:
      fill(255, 0, 0);
      break;
    case 1:
      fill(0, 255, 0);
      break;
    case 2:
      fill(0, 0, 255);
      break;
   default:
     fill(0);
     break;
  }
  
  rect(0, h * num, width, h);
}