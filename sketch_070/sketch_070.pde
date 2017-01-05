void setup() {
    size(500, 500);
    background(255);
    strokeWeight(5);
    smooth();
    
    float x, y; // line描画用のx,y座標
    float radius = 100; // 半径
    color c;
    float noiseval = random(10); // ランダムな開始点
    float radVariance, thisRadius;

    int centx = width/2;
    int centy = height/2;
    float diam = radius *2;
    
    // 体系的な円
    stroke(0, 30);
    noFill();
    ellipse(centx, centy, diam, diam);
    
    c = randomRGBColor(20, 50, 70);
    stroke(c);
    strokeWeight(1);
    
    beginShape();
    fill(20, 50, 70, 50);
    for(float ang = 0; ang <= 360; ang+=1){
        
        float rad = radians(ang);
        noiseval += 0.1;
        radVariance = 30 * customNoise(noiseval);
        thisRadius = radius + radVariance;

        x = centx + (thisRadius * cos(rad));
        y = centy + (thisRadius * sin(rad));
        curveVertex(x, y);
    }
    endShape(CLOSE);
}

void draw() {
}

//float customNoise(float value){
//    float retValue = pow(sin(value), 3);
//    return retValue;
//}
float customNoise(float value){
    int count = int(value % 12);
    float retValue = pow(sin(value), count);
    return retValue;
}

float customRandom(){
    float retValue = 1 - pow(random(1), 1);
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