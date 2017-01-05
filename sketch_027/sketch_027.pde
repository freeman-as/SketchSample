void setup() {
    size(640, 640);
    colorMode(HSB, 100);
    background(99);
    
    for(int x = 0; x < width; x++){
        float c1 = random(100);
        stroke(c1, 60, 100);
        line(x, 0, x, height);
    }
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}