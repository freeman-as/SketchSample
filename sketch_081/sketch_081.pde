int _count = 0;
boolean isDraw = false;

PFont Font;

void setup() {
    size(500, 500);
    colorMode(HSB, 100);
    background(100);
    frameRate(10);
    
    Font = loadFont("sample.vlw");
    textFont(Font);
    textAlign(CENTER);
}

void draw() {
    fadeToWhite();
    
    if(isDraw){
        fill(random(100), 99, 99, 80);
        text(_count, random(width), random(height));
        _count++;
    }
}

void fadeToWhite() {
    noStroke();
    //fill(_maxColor - 1, _maxColor * 0.05);
    fill(99, 30);
    rectMode(CORNER);
    rect(0, 0, width, height);
}

void keyPressed(){
    isDraw = true;
}

void keyReleased(){
    _count = 0;
    isDraw = false;
}

color randomRGBColor(int r, int g, int b) {
    color c = color(random(r), random(g), random(b), 80);
    return c;
}
color randomRGBColor(int r, int g, int b, int a) {
    color c = color(random(r), random(g), random(b), a);
    return c;
}

//void keyPressed(){
//    if(keyCode == ENTER) save("screen.png");
//}
void keyTyped(){
    if(key == 's' || key == 'S') saveFrame("screen.png");
}