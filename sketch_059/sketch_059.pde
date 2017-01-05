int step =10;
float lastx = -999;
float lasty = -999;
float y = 50;
int borderx = 20;
int bordery = 10;

void setup() {
    size(500, 100);
    background(255);
    strokeWeight(4);
    smooth();
    
    stroke(255, 0, 0, 100);
    line(0, height/2, width, height/2);
    for(int x = borderx; x <= width - borderx; x += step){
        y = bordery + random(height - 2*bordery);
        if(lastx > -999){
            stroke(0);
            line(x, y, lastx, lasty);
        }
        lastx = x;
        lasty = y;
    }
}

void draw() {
}

void fadeToWhite() {
    noStroke();
    fill(99, 30);
    rectMode(CORNER);
    rect(0, 0, width, height);
}

color randomRGBColor() {
    color c = color(random(256), random(256), random(256));
    return c;
}

void keyPressed(){
    if(keyCode == ENTER) save("screen.png");
}