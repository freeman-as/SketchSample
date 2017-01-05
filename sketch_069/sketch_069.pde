// line描画用のx,y座標
float x, y;
float lastx = -999;
float lasty = -999;
float radius = 100; // 半径
float radiusNoise = random(10); // 半径用ノイズ初期シード
color c;
float diameter;
float cdiameter;


void setup() {
    size(500, 500);
    background(255);
    strokeWeight(5);
    smooth();
        
    int centx = width/2;
    int centy = height/2;
    float diam = radius *2;
    
    // 体系的な円
    stroke(0, 30);
    noFill();
    ellipse(centx, centy, diam, diam);
    
    c = randomRGBColor(20, 50, 70);
    stroke(c);
    
    for(float ang = 0; ang <= 360; ang+=5){
        //radiusNoise += 0.05;
        //radius += 0.5;
        //float noise = noise(radiusNoise);
        //float thisNoise = (noise * 200) -100;
        //float thisRadius = radius + thisNoise;
        float rad = radians(ang);
        //x = centx + (thisRadius * cos(rad));
        //y = centy + (thisRadius * sin(rad));
        x = centx + (radius * cos(rad));
        y = centy + (radius * sin(rad));
        if(lastx > -999){
            line(x, y, lastx, lasty);
        }
        lastx = x;
        lasty = y;
    }
}

void draw() {
    fill(255, 100);
    rect(0, 0, width, height);
    noFill();
    
    noStroke();
    fill(randomRGBColor(0, 0, 0, 256));
    diameter = sin(radians(frameCount *3)) * width /2;
    cdiameter = cos(radians(frameCount *3)) * width /2;
    ellipse(width/2 + cdiameter, height/2 + diameter, diameter, cdiameter);
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
    if(key == 's' || key == 'S') saveFrame("screen-##.png");
}