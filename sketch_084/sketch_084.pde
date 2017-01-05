float GRAVITY = 3;
float FRICTION = 0.8;
int LENGTH = 50;

float[] _x = new float[LENGTH];
float[] _y = new float[LENGTH];
float[] _spx = new float[LENGTH];
float[] _spy = new float[LENGTH];
float[] _radius = new float[LENGTH];
float[] _diam = new float[LENGTH];

void setup() {
    size(500, 500);
    colorMode(HSB, LENGTH);
    background(LENGTH - 1);
    frameRate(20);
    
    for(int i = 0; i < LENGTH; i++){
        _x[i] = width/2;
        _y[i] = 10;
        _spx[i] = random(-20, 20);
        _spy[i] = random(-30, 0);
        _radius[i] = random(5, 20);
    }
}

void draw() {
    fadeToWhite();

    float[] diam = new float[LENGTH];
    
    moveBalls();
    
    for(int i = 0; i < LENGTH; i++){
        diam[i] = _radius[i] * 2;
        noStroke();
        fill(i, LENGTH * 0.6, LENGTH - 1);
        ellipse(_x[i], _y[i], diam[i], diam[i]);
    }
    
}

void moveBalls(){
    for(int i = 0; i < LENGTH; i++){
        _spy[i] += GRAVITY;
        _x[i] += _spx[i];
        _y[i] += _spy[i];
        
        bounce(i);
    }
}

void bounce(int i){
    float bounceMinX = _radius[i];
    float bounceMaxX = width - _radius[i];
    float bounceMinY = _radius[i];
    float bounceMaxY = height - _radius[i];
    
    if(_x[i] < bounceMinX || _x[i] > bounceMaxX){
        _spx[i] = -_spx[i] * FRICTION;
        if(abs(_spx[i]) < 1) _spx[i] = 0;
        if(_x[i] < bounceMinX) _x[i] = bounceMinX - (_x[i] - bounceMinX); 
        if(_x[i] > bounceMaxX) _x[i] = bounceMaxX - (_x[i] - bounceMaxX);
    }

    if(_y[i] < bounceMinY || _y[i] > bounceMaxY){
        _spy[i] = -_spy[i] * FRICTION;
        if(abs(_spy[i]) < GRAVITY) _spy[i] = 0;
        if(_y[i] < bounceMinY) _y[i] = bounceMinY - (_y[i] - bounceMinY); 
        if(_y[i] > bounceMaxY) _y[i] = bounceMaxY - (_y[i] - bounceMaxY);
    }
}

void fadeToWhite() {
    noStroke();
    fill(LENGTH- 1, LENGTH * 0.3);
    //fill(99, 30);
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