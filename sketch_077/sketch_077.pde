int _maxColor;

void setup() {
    size(500, 500);
    _maxColor = width;
    colorMode(HSB, _maxColor);
    background(_maxColor - 1);
    noStroke();
    frameRate(10);
}

void draw() {
    fill(mouseX, _maxColor * 0.5 , _maxColor);
    ellipse(mouseX, mouseY, mouseX/2, mouseY/2);
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