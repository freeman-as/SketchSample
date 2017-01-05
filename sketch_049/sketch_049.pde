void setup() {
    size(640, 640);
    colorMode(RGB, 256);
    background(255);
    frameRate(15);
}

void draw() {
    fadeToWhite();

    int x = int(random(width));
    int y = int(random(height));
    int sz = int(random(width/2));

    noStroke();
    fill(randomRGBColor());
    ellipse(x, y, sz, sz);
}

void fadeToWhite(){
    noStroke();
    fill(255, 30);
    rectMode(CORNER);
    rect(0, 0, width, height);
}

color randomRGBColor(){
    color c = color(random(256), random(256), random(256));
    return c;
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}