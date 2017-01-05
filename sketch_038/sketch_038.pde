void setup() {
    size(640, 480);
    colorMode(HSB, 100);
    background(99);
    
    PImage neko = loadImage("neko.png");
    imageMode(CENTER);
    
    for(int i = 0; i < 100; i++){
        int size = int(random(neko.width/2, neko.width));
        tint(random(100), 60, 99, 80);
        image(neko, random(width), random(height), size, size);
    }

}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}