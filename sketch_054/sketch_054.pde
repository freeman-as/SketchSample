void setup() {
    size(1000, 1000, P3D);
    background(150);
    stroke(0, 50);
    fill(255, 200);
    
    float xstart = random(5);
    float ynoise = random(5);
    
    translate(width/2, height/2, 0);
    for(float y = -(height/8); y <= (height/8); y += 3){
        ynoise += 0.02;
        float xnoise = xstart;
        for(float x = -(width/8); x <= (width/8); x +=3){
            xnoise += 0.02;
            drawPoint(x, y, noise(xnoise, ynoise));
        }
    }
}

void draw() {
}

void drawPoint(float x, float y, float noiseFactor){
    pushMatrix();
    translate(x * noiseFactor * 4, y * noiseFactor * 4, -y);
    float edgeSize = noiseFactor *26;
    ellipse(0, 0, edgeSize, edgeSize);
    popMatrix();
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