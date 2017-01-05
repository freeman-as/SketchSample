int hue = 0;

void setup() {
    size(640, 480);
    background(255);
    colorMode(HSB, 360, 100, 100, 100);
    noStroke();
}

void draw() {
    hue = (hue + 1) % 361;
    fill(hue, 80, 60, 20);
    ellipse(mouseX, mouseY, 40, 40);
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
    color c = color(random(r), random(g), random(b), random(a));
    return c;
}

void keyPressed(){
    if(keyCode == ENTER) save("screen.png");
}
void keyTyped(){
    if(key == 's' || key == 'S') saveFrame("screen_##.png");
}