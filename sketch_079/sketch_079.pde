int _maxColor;
int _currentColor = 0;

void setup() {
    size(500, 500);
    _maxColor = 100;
    colorMode(HSB, _maxColor);
    background(_maxColor - 1);
    noStroke();
    frameRate(10);
}

void draw() {
    fadeToWhite();
    
    stroke(_currentColor, _maxColor -1, _maxColor -1);
    line(mouseX, 0, pmouseX, height);
}

void fadeToWhite() {
    noStroke();
    fill(_maxColor - 1, _maxColor * 0.05);
    //fill(99, 30);
    rectMode(CORNER);
    rect(0, 0, width, height);
}

void mousePressed(){
    if(mouseButton == LEFT){
        if(_currentColor < _maxColor) _currentColor += 10;
        else _currentColor = 0;
    } else {
        if(_currentColor > 0) _currentColor -= 10;
        else _currentColor  = _maxColor - 10;
    }
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