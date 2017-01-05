String[] _message = {
    "Processing is",
    "an open source programming language",
    "and environment",
    "for people who want to",
    "program images, animation, and, sound."
};

PFont _font;

void setup() {
    size(500, 500);
    colorMode(HSB, 100);
    background(99);
    frameRate(10);
    
    _font = loadFont("sample.vlw");
    textFont(_font);
    textAlign(CENTER);
}

void draw() {
    fadeToWhite();
    
    fill(random(100), 80);
    String message = _message[int(random(_message.length))]; 

    float _cx = width/2;
    float _cy = height/2;
    float _x = random(width);
    float _y = random(height);
    float dist = dist(_x, _y, _cx, _cy); // 中心からの距離

    text(message, _x, _y);
    //if(dist < 200) text(message, _x, _y); // 中心からの距離が200以内の時に描画（円形）
}

void fadeToWhite() {
    noStroke();
    //fill(LENGTH- 1, LENGTH * 0.3);
    fill(99, 10);
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