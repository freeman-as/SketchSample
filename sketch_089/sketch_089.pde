int LENGTH = 100;

float[] _x = new float[LENGTH];
float[] _y = new float[LENGTH];
float[] _spx = new float[LENGTH];
float[] _spy = new float[LENGTH];
float[] _speedRate = new float[LENGTH];


void setup() {
    size(500, 500);
    colorMode(HSB, 100);
    background(99);
    frameRate(30);
    
    for(int i = 0; i < LENGTH; i++){
        _x[i] = random(width);
        _y[i] = random(height);
        _spx[i] = _spy[i] = 0;
        _speedRate[i] = random(0.001, 0.01);
    }
}

void draw() {
    background(99);

    for(int i = 0; i < LENGTH; i++){
        _spx[i] = (mouseX - _x[i]) * _speedRate[i];
        _spy[i] = (mouseY - _y[i]) * _speedRate[i];
        _x[i] += _spx[i];
        _y[i] += _spy[i];
        
        drawBug(i);
    }
}

void drawBug(int i){
    pushMatrix();

    translate(_x[i], _y[i]);
    rotate(atan2(mouseY - _y[i], mouseX - _x[i]));
    //rotate(atan2(mouseX - _x[i], mouseY - _y[i]));
    
    noStroke();
    rectMode(CENTER);
    fill(12, 50, 99);
    rect(0, 0, 10, 5);
    fill(20);
    rect(5, 0, 5, 5);

    popMatrix();
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