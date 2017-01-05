float GRAVITY = 3;
float FRICTION = 0.6;

float _x, _y;
float _spx, _spy;
int _radius = 30;

void setup() {
    size(500, 500);
    colorMode(RGB, 100);
    background(99);
    frameRate(15);
    
    // 位置と速度を初期化
    _x = width/2;
    _y = 10;
    _spx = random(-5, 5);
    _spy = -10;
}

void draw() {
    fadeToWhite();
    
    _spy += GRAVITY;
    _x += _spx;
    _y += _spy;
    float diam;
    diam = _radius*2;
    
    // 衝突判定
    bounce();

    noStroke();
    fill(0);
    ellipse(_x, _y, diam, diam);
}

void bounce(){
    float bounceMinX = _radius;
    float bounceMaxX = width - _radius;
    float bounceMinY = _radius;
    float bounceMaxY = height - _radius;
    
    if(_x < bounceMinX || _x > bounceMaxX){
        _spx = -_spx * FRICTION;
        if(abs(_spx) < 1) _spx = 0;
        if(_x < bounceMinX) _x = bounceMinX - (_x - bounceMinX); 
        if(_x > bounceMaxX) _x = bounceMaxX - (_x - bounceMaxX);
    }

    if(_y < bounceMinY || _y > bounceMaxY){
        _spy = -_spy * FRICTION;
        if(abs(_spy) < GRAVITY) _spy = 0;
        if(_y < bounceMinY) _y = bounceMinY - (_y - bounceMinY); 
        if(_y > bounceMaxY) _y = bounceMaxY - (_y - bounceMaxY);
    }
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