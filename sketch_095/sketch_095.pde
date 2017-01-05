int LENGTH = 100;
BounceBall[] balls = new BounceBall[LENGTH];

void setup() {
    size(500, 500);
    colorMode(HSB, LENGTH);
    background(LENGTH - 1);
    frameRate(10);
    
    for(int i = 0; i < LENGTH; i++){
        balls[i] = new BounceBall (
            width/2, 10,
            random(-20, 20), random(-30, 30),
            random(5, 20),
            color(random(LENGTH), LENGTH * 0.6, LENGTH - 1)
        );
    }
}

void draw() {
    fadeToWhite();
    
    for(int i = 0; i < LENGTH; i++){
        balls[i].move();
        balls[i].draw();
    }
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