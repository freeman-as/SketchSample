float SCALE = 0.0005;
float FRICTION = 0.98;

float _x, _y;
float _spx, _spy; // 速度
float _acx, _acy; // 加速度
int _radius = 30;

void setup() {
    size(500, 500);
    colorMode(HSB, 100);
    background(99);
    frameRate(10);
    
    // 位置、速度、加速度を初期化
    _x = random(width);
    _y = random(height);
    _spx = random(-3, 3);
    _spy = random(-3, 3);
    _acx = _acy = 0;
}

void draw() {
    fadeToWhite();
    
    float diam;
    diam = _radius*2;
    float cx = width/2;
    float cy = height/2;
    
    // 中心点（引力の中心）
    noStroke();
    fill(0);
    ellipse(cx, cy, 6, 6);
    
    // 引力の計算
    attraction(cx, cy);

    ellipse(_x, _y, diam, diam);
}

void attraction(float targetX, float targetY){
    float distX = _x - targetX;
    float distY = _y - targetY;
    _acx = SCALE * sq(distX);
    if(_x > targetX) _acx = -_acx;
    _acy = SCALE * sq(distY);
    if(_y > targetY) _acy = -_acy;
    
    _spx += _acx;
    //_spx *= FRICTION; // いずれ停止
    _x += _spx;

    _spy += _acy;
    //_spy *= FRICTION; // いずれ停止
    _y += _spy;
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