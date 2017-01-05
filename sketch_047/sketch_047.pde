void setup() {
    size(640, 640);
    colorMode(RGB, 256);
    background(255);
    frameRate(30);
}

void draw() {
    stroke(randomRGBColor());
    int x = int(random(width));
    int y = int(random(height));
    rectLines(x, y, width/10, height/10);
}

void rectLines(int x, int y, int w, int h){
    line(x, y, x + w, y);
    line(x, y, x, y+h);
    line(x + w, y, x + w, y + h);
    line(x, y + h, x + w, y + h);
} 

color randomRGBColor(){
    color c = color(random(256), random(256), random(256), 60);
    return c;
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}