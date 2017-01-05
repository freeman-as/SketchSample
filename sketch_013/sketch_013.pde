void setup(){
    size(640, 480);
    background(0);
    strokeWeight(3);
    strokeCap(SQUARE); // 線の端を角のままに
}

void draw(){
}

void mousePressed(){
    stroke(255);
    line(random(width), random(height), mouseX, mouseY);
}