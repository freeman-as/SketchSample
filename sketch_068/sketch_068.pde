//float x, y;
//float radius = 10;
//float radiusNoise = random(10);
//float rand = radiusNoise;
color c;


void setup() {
    size(500, 500);
    background(255);
    strokeWeight(0.5);
    smooth();
    
    
    int centx = width/2;
    int centy = height/2;
    
    for(int i = 0; i < 100; i++){
        float x, y;
        float lastx = -999;
        float lasty = -999;

        float radius = 10; // 半径
        float radiusNoise = random(10); // 半径用ノイズ初期シード
        //float rand = radiusNoise;
        
        c = randomRGBColor(20, 50, 70);
        stroke(c);
        
        int startangle = int(random(360));
        int endangle = 1440 + int(random(1440));
        int anglestep = 5 + int(random(3));
        for(float ang = startangle; ang <= endangle; ang+=anglestep){
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

color randomRGBColor(int r, int g, int b) {
    color c = color(random(256), random(256), random(256), 80);
    return c;
}

void keyPressed(){
    if(keyCode == ENTER) save("screen.png");
}
void keyTyped(){
    if(key == 's' || key == 'S') saveFrame("screen-##.png");
}