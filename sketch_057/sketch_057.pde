int diam = 10;
float centX, centY;

void setup() {
    size(500, 300);
    frameRate(24);

    smooth();
    background(180);
    centX = width/2;
    centY = height/2;
    stroke(0);
    strokeWeight(1);
    //noFill(); // 同心円
    fill(255, 50); // 半透明エフェクト
}

void draw() {
    if(diam <= 400){
        //background(180); // 再描画
        ellipse(centX, centY, diam, diam);
        diam += 10;
    }
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