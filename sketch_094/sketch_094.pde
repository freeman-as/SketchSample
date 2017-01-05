int LENGTH = 1000;

float[] _x = new float[LENGTH];
float[] _y = new float[LENGTH];
float[] _z = new float[LENGTH];
float[] _weight = new float[LENGTH];
color[] _c = new color[LENGTH];

void setup() {
    size(500, 500, P3D);
    colorMode(HSB, 100);
    background(0);
    stroke(100);
    frameRate(30);
    blendMode(ADD);
    
    for(int i = 0; i < LENGTH; i++){
        _x[i] = random(width);
        _y[i] = random(height);
        _z[i] = i * -10;
        _weight[i] = random(1, 3);
        _c[i] = color(random(256), random(256), random(256));
    }
}

void draw() {
    background(0);

    for(int i = 0; i < LENGTH; i++){
        strokeCap(ROUND);
        strokeWeight(_weight[i]);
        stroke(_c[i]);
        line(_x[i], _y[i], _z[i], _x[i], _y[i], _z[i]-100);
        _z[i] += 20;
        
        if(_z[i] > 0){
            _x[i] = random(width);
            _y[i] = random(height);
            _z[i] = -1000;
            _weight[i] = random(1, 5);
            _c[i] = color(random(256), random(256), random(256));
        }
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