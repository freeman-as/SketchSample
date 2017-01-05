float xstep = 10;
float ystep  = 10;
float lastx = 20;
float lasty = 50;
float y = 50;

void setup() {
    size(500, 100);
    background(255);
    strokeWeight(4);
    smooth();
    
    stroke(255, 0, 0, 100);
    line(0, height/2, width, height/2);

    for(int x = 20; x <= 480; x += xstep){
        ystep = random(20) - 10; // range -10 to 10
        y += ystep;
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