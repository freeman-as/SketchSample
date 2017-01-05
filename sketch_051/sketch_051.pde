float FRICTION = 0.97;

float X, Y;
float Spx, Spy;
float Acx, Acy;

void setup() {
    size(640, 640);
    colorMode(HSB, 100);
    background(99);
    frameRate(15);
    
    X = Y = 0;
    Spx = Spy = 10;
}

void draw() {
    fadeToWhite();
    
    Spx *= FRICTION;
    Spy *= FRICTION;
    X += Spx;
    Y += Spy;

    noStroke();
    fill(0);
    rectMode(CENTER);
    rect(X, Y, 30, 30);
}

void fadeToWhite(){
    noStroke();
    fill(99, 30);
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