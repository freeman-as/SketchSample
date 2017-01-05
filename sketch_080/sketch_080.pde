boolean isDraw = false;
float _size;

void setup() {
    size(500, 500);
    colorMode(HSB, 100);
    background(99);
    frameRate(10);
}

void draw() {
    fadeToWhite();
    
    if(isDraw){
        fill(random(30, 60), 99, 99, 60);
        float x = mouseX + random(-50, 50);
        float y = mouseY + random(-50, 50);
        ellipse(x, y, _size, _size);
        
        isDraw = false;
    }
}

void fadeToWhite() {
    noStroke();
    //fill(_maxColor - 1, _maxColor * 0.05);
    fill(99, 10);
    rectMode(CORNER);
    rect(0, 0, width, height);
}

void mouseMoved(){
    isDraw = true;
    _size = random(10, 20);
}

void mouseDragged(){
    isDraw = true;
    _size = random(60, 80);
}

color randomRGBColor(int r, int g, int b) {
    color c = color(random(r), random(g), random(b), 80);
    return c;
}
color randomRGBColor(int r, int g, int b, int a) {
    color c = color(random(r), random(g), random(b), a);
    return c;
}

void keyPressed(){
    if(keyCode == ENTER) save("screen.png");
}
void keyTyped(){
    if(key == 's' || key == 'S') saveFrame("screen-##.png");
}