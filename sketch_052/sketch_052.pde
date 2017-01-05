float X, Y;
float Cx, Cy;
float Angle;
float R;

void setup() {
    size(640, 640);
    colorMode(HSB, 100);
    background(99);
    frameRate(15);
    
    Cx = width/2;
    Cy = height/2;
    Angle = 0;
    R = width/3;
}

void draw() {
    fadeToWhite();
    
    Angle += 10;
    X = Cx + (R * cos(radians(Angle)));
    Y = Cy + (R * sin(radians(Angle)));
    
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