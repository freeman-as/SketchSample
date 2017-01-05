float xstep = 1;
float lastx = -999;
float lasty = -999;
float angle = 0;
float y;

void setup() {
    size(500, 100);
    background(255);
    strokeWeight(4);
    smooth();
    
    stroke(255, 0, 0, 100);
    line(0, height/2, width, height/2);

    for(int x = 20; x <= 480; x += xstep){
        float rad  = radians(angle);
        y = height/2 + (sin(rad)*40);
        //y = height/2 + (cos(rad)*40);
        if(lastx > -999){
            stroke(20, 50, 70);
            line(x, y, lastx, lasty);
        }
        lastx = x;
        lasty = y;
        angle++;
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