float _angNoise, _radiusNoise;
float _xnoise, _ynoise;
float _radius;
float _angle = -PI/2;
float _strokeCol = 256;
int _strokeChange = -1;


void setup() {
    size(500, 500);
    background(255);
    noFill();
    smooth();
    frameRate(30);
    
    _angNoise = random(10);
    _radiusNoise = random(10);
    _xnoise = random(10);
    _ynoise = random(10);
}

void draw() {
    float centx = width/2;
    float centy = height/2;
    
    _radiusNoise += 0.005;
    _radius = (noise(_radiusNoise) * 550) + 1;
    
    _angNoise += 0.005;
    _angle += (noise(_angNoise) * 6) - 3;
    if(_angle > 360) _angle -= 360;
    if(_angle < 0) _angle += 360;
    
    _xnoise += 0.01;
    _ynoise += 0.01;
    centx = centx + (noise(_xnoise) * 100) - 50;
    centy = centy + (noise(_ynoise) * 100) - 50;
    
    float rad = radians(_angle);
    float x1= centx + (_radius * cos(rad));
    float y1= centy + (_radius * sin(rad));

    float opprad = rad + PI;
    float x2= centx + (_radius * cos(opprad));
    float y2= centy + (_radius * sin(opprad));
    
    _strokeCol += _strokeChange;
    if(_strokeCol > 256) _strokeChange = -_strokeChange;
    if(_strokeCol < 0) _strokeChange = -_strokeChange;
    
    stroke(_strokeCol, 60);
    strokeWeight(1);
    line(x1, y1, x2, y2);
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