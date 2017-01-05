String str = "Hit any key ...";

void setup(){
  size(640, 480);
  textSize(30);
}

void draw(){
  background(0);
  
  text(str, 30, 30, width - 30 * 2, height);
}

void keyTyped(){
  println(key);
  str += key;
}