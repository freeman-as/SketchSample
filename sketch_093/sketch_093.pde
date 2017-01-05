PImage _source, _neko;


void setup() {
    size(640, 480);
    colorMode(RGB, 256);
    background(255);
    smooth();
    
    _source= loadImage("bg3.jpg");
    _source.loadPixels();
    
    _neko = loadImage("neko.png"); 
}

void draw() {
    int x = int(random(_source.width));
    int y = int(random(_source.height));
    int pos = (y * _source.width) + x;
    color c = _source.pixels[pos];
    
    tint(red(c), green(c), blue(c), 200);
    float size = mouseX/2 + random(5, 10);
    image(_neko, x*2, y*2, size, size);
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