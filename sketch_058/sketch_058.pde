int diam = 10;
float centX, centY;

void setup() {
    size(500, 300);
    background(180);
    strokeWeight(4);
    strokeCap(SQUARE);
    
    for(int h = 10; h <= (height - 15); h += 10){
        //if(h > 255) break;
        stroke(0, 255 - h);
        line(10, h, width - 20, h);
        stroke(255, h);
        line(10, h + 4, width - 20, h + 4);
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

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}