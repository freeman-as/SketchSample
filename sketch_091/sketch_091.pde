int _maxColor;

float _x, _y;
float _speed;
float _angle;
float MAX_SPEED = 10;

void setup() {
    size(500, 500);
    _maxColor = width;
    colorMode(HSB, _maxColor);
    background(_maxColor);
    rectMode(CENTER);
    frameRate(10);
    
    _x = width/2;
    _y = height/2;
    _speed = 0;
    _angle = 0;
}

void draw() {
    float acc = (mouseY - (height/2));
    _speed += acc * 0.01;
    if(_speed < -MAX_SPEED) _speed = -MAX_SPEED;
    if(_speed > MAX_SPEED) _speed = MAX_SPEED;
    
    float angle = ((width/2) - mouseX);
    _angle += angle * 0.05;
    
    _x += _speed * sin(radians(_angle));
    _y += _speed * cos(radians(_angle));
    loopWorld();
    
    fill(abs(_angle)*2, abs(acc)*2, _maxColor);
    rect(_x, _y, 20, 20);
}

void loopWorld(){
    if(_x < 0) _x = width + _x;
    if(_x > width) _x = _x - width;
    if(_y < 0) _x = height + _y;
    if(_y > height) _y = _y - height;
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