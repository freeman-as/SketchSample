void setup() {
    size(640, 640);
    colorMode(RGB, 100);
    background(99);
    noStroke();
    
    for(int i = 0; i < 600; i++){
        float c1 = random(0,50);
        float c2 = random(50, 100);
        fill(c1, c2, c2, 60);
        float x = random(width);
        float y = random(height);
        rect(x, y, 20, 20);
    }
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}