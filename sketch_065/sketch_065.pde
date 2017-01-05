float radius;
int centx;
int centy;
float x, y;
float lastx = -999;
float lasty = -999;

void setup() {
    size(500, 500);
    background(255);
    strokeWeight(4);
    smooth();
    
    radius = width/3;
    centx = width/2;
    centy = height/2;
    float diam = radius*2;
    
    stroke(0, 30);
    noFill();
    ellipse(centx, centy, diam, diam);
    
    stroke(20, 50, 70);
    strokeWeight(8);
    for(float ang = 0; ang <= 360; ang+=5){
        float rad = radians(ang);
        x = centx + (radius* sin(rad));
        y = centy + (radius * cos(rad));
        point(x, y);
    }
}

void draw() {
}

float customRandom(){
    float retValue = 1 - pow(random(1), 5);
    return retValue;
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
void keyTyped(){
    if(key == 's' || key == 'S') saveFrame("screen-##.png");
}