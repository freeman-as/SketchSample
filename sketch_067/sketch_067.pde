float radius = 10;
float x, y;
float lastx = -999;
float lasty = -999;
float radiusNoise = random(10);
float rand = radiusNoise;

void setup() {
    size(500, 500);
    background(255);
    strokeWeight(4);
    smooth();
    
    int centx = width/2;
    int centy = height/2;
    
    stroke(20, 50, 70);
    for(float ang = 0; ang <= 1440; ang+=5){
        radiusNoise += 0.05;
        radius += 0.5;
        float noise = noise(radiusNoise);
        float thisNoise = (noise * 200) -100;
        float thisRadius = radius + thisNoise;
        float rad = radians(ang);
        x = centx + (thisRadius * cos(rad));
        y = centy + (thisRadius * sin(rad));
        if(lastx > -999){
            line(x, y, lastx, lasty);
        }
        lastx = x;
        lasty = y;
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