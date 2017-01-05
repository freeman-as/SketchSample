void setup() {
    size(640, 640);
    colorMode(RGB, 100);
    background(99);
    
    for(int i = 0; i < 100; i++){
        stroke(random(100), random(100), random(100));
        line(random(width), random(height), random(width), random(height));
        //line(width/2, height/2, random(width), random(height));
    }
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}