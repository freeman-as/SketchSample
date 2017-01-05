void setup() {
    size(640, 480);
    colorMode(RGB, 100);
    background(99);
    
    printArray(PFont.list());
    
    textFont(createFont("YuMin-Medium", 100));
    //textSize(60);
    
    textAlign(CENTER);
    fill(random(50, 100));
    text("processing", width/2, height/2);
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}