int LENGTH = 20;

float[] _x = new float[LENGTH];
float[] _y = new float[LENGTH];
float[] _ang = new float[LENGTH];
float[] _rot = new float[LENGTH];
float[] _c = new float[LENGTH];
float[] _radius = new float[LENGTH];

float _cx, _cy;
float _power = 0;
float MAX_POWER = 200;

void setup() {
    size(500, 500);
    colorMode(HSB, 100);
    background(99);
    frameRate(30);
}

void draw() {
    fadeToWhite();
    
    if(_power > 0){
        for(int i = 0; i < LENGTH; i++){
            _ang[i] += _rot[i] * (_power / 10);
            _x[i] = _cx + (_power * sin(radians(_ang[i])));
            _y[i] = _cy + (_power * cos(radians(_ang[i])));
            
            noStroke();
            fill(_c[i], 80, 100, min(_power, 80));
            ellipse(_x[i], _y[i], _radius[i], _radius[i]);
        }
    }
    
    if(mousePressed){
        _cx = mouseX;
        _cy = mouseY;
        if(_power < MAX_POWER) _power += 1;
    } else {
        if(_power > 1) _power *= 0.98;
        else _power = 0;
    }
}

void mousePressed(){
    _power = 0;
    for(int i = 0; i < LENGTH; i++){
        _radius[i] = random(10, 30);
        _c[i] = random(100);
        _rot[i] = random(-5, 5);
    }
}

void fadeToWhite() {
    noStroke();
    //fill(LENGTH- 1, LENGTH * 0.3);
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