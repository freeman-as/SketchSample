float FRICTION = 0.98;
boolean isOnDrag = false;
boolean isOnMouse = false;

float _x, _y;
float _spx, _spy;
float _radius;

void setup() {
    size(500, 500);
    colorMode(HSB, 100);
    background(99);
    strokeWeight(1);
    frameRate(10);
    
    _x = width/2;
    _y = height/2;
    _spx = _spy = 0;
    _radius = 40;
}

void draw() {
    if(isOnDrag) fadeToWhite();
    //fadeToWhite();
    
    if(isOnDrag){
        _x = mouseX;
        _y = mouseY;
        _spx = mouseX - pmouseX;
        _spy = mouseY - pmouseY;
    } else {
        _spx *= FRICTION;
        _spy *= FRICTION;
        _x += _spx;
        _y += _spy;
        bounce();
    }
    
    checkOnMouse();

    float diam = _radius * 2;
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
        if(abs(_spy) < 1) _spy = 0;
        if(_y < bounceMinY) _y = bounceMinY - (_y - bounceMinY);
        if(_y > bounceMaxY) _y = bounceMaxY - (_y - bounceMaxY);
    }
}

void checkOnMouse(){
    noFill();
    stroke(90, 60, 99);

    float dist = dist(mouseX, mouseY, _x, _y);
    if(dist < _radius){
        isOnMouse = true;
        fill(90, 99, 99, 30);
    } else {
        isOnMouse = false;
        fill(90, 0, 99, 30);
    }
}

void mousePressed(){
    if(isOnMouse) isOnDrag = true;
}

void mouseReleased(){
    isOnDrag = false;
}

void fadeToWhite() {
    noStroke();
    //fill(LENGTH- 1, LENGTH * 0.3);
    fill(99, 20);
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