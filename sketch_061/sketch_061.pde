//int step = 10; //  変化させてみる
int step = 1; //  変化させてみる
float lastx = -999;
float lasty = -999;
float ynoise = random(10);
float y;

void setup() {
    size(500, 100);
    background(255);
    strokeWeight(5);
    smooth();
    
    stroke(255, 0, 0, 100);
    line(0, height/2, width, height/2);

    for(int x = 20; x <= 480; x += step){
        y = 10 + noise(ynoise) * 80;
        if(lastx > -999){
            stroke(20, 50, 70);
            line(x, y, lastx, lasty);
        }
        lastx = x;
        lasty = y;
        //ynoise += 0.1; //  変化させてみる
        ynoise += 0.03; //  変化させてみる
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