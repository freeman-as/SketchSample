PImage _sample;


void setup() {
    size(640, 480);
    colorMode(RGB, 100);
    background(99);
    frameRate(120);
    
    _sample = loadImage("bg3.jpg");
    _sample.loadPixels();
}

void draw() {
    loadPixels();
    for(int i = 0; i < 100; i++){
        int x = int(random(_sample.width));
        int y = int(random(_sample.height));
        int pos = (y * _sample.width) + x;
        pixels[pos] = _sample.pixels[pos];
    }
    
    updatePixels();
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