void setup() {
    size(640, 480);
    colorMode(HSB, 100);
    background(99);
    
    PImage img = loadImage("cat.jpg");
    tint(50);
    image(img, 0, 0, width/2, height/2);
    
    noTint();
    image(img, width/4, height/4, width/2, height/2);
    
    tint(45, 80, 80, 50);
    image(img, width/2, height/2, width/2, height/2);
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}