void setup() {
    size(640, 640);
    colorMode(HSB, 100);
    background(99);
    noStroke();
    rectMode(CENTER);
    
    int range = 10;
    int num = 10;

    for(int y = 0; y < num; y++){
        for(int x = 0; x < num; x++){
            fill(random(20, 40), 60, 99);
            rect(
                10 + x*width/num + random(-range, range),
                10 + y*height/num + random(-range, range),
                width/num/2, height/num/2
                );
        }
    }
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}