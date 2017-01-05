float K = 0.02; // バネの強さ
float FRICTION = 0.98; // 摩擦力、減衰率

float _springLength; // バネの自然長

float _x, _y;
float _spx, _spy; // 速度
float _acx, _acy; // 加速度
int _radius = 30;

void setup() {
    size(500, 500);
    colorMode(HSB, 100);
    background(99);
    frameRate(10);
    
    _springLength = height/2;
    
    // 位置と速度を初期化
    _x = width/2;
    _y = 0;
    _spx =  _spy = 0;
    _acx = _acy = 0;
}

void draw() {
    fadeToWhite();
    
    // バネの動き
    spring();
    
    float diam;
    diam = _radius*2;

    noStroke();
    fill(0);
    ellipse(_x, _y, diam, diam);

}

void spring(){
    float distY = _y - _springLength;
    _acy = -K * distY;
    _spy = FRICTION * (_spy + _acy);
    
    _x += _spx;
    _y += _spy;
    
    stroke(0, 99, min(abs(_acy) * 50, 99));
    line(width/2, _y, width/2, height);
}

void fadeToWhite() {
    noStroke();
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
    if(key == 's' || key == 'S') saveFrame("screen-##.png");
}