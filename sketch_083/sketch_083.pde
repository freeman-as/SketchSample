int LENGTH = 100;
int[] _x = new int[LENGTH];
int[] _y = new int[LENGTH];

PFont font;

void setup() {
    size(500, 500);
    colorMode(HSB, 100);
    background(99);
    frameRate(10);
    
    font = loadFont("sample.vlw");
    textFont(font, 20);
    
}

void draw() {
    background(99);
    
    for(int i = 0; i < LENGTH -1; i++){
        float weight = dist(_x[i], _y[i], _x[i+1], _y[i+1]) / 2;
        strokeWeight(weight);
        
        stroke(20, 100, 100, 100-i);
        line(_x[i], _y[i], _x[i+1], _y[i+1]);
        
        fill(80, 99, 99);
        text(i, _x[i], _y[i]);
    }
}

void mouseMoved(){
    for(int i = LENGTH - 1; i >= 1;  i--){
        _x[i] = _x[i-1];
        _y[i] = _y[i-1];
    }
    
    _x[0] = mouseX;
    _y[0] = mouseY;
}

void fadeToWhite() {
    noStroke();
    //fill(_maxColor - 1, _maxColor * 0.05);
    fill(99, 30);
    rectMode(CORNER);
    rect(0, 0, width, height);
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
    if(key == 's' || key == 'S') saveFrame("screen_##.png");
}