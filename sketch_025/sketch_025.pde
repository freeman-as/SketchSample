void setup() {
    size(640, 640);
    colorMode(HSB, 100);
    background(99);
    noStroke();
    
    for(int y = 0; y < 10; y++){
        println("y = " + y);
        for(int x = 0; x < 10; x++){
            println("x = " + x);
            fill(x * 10, y * 10 + 10, 99 );
            //rect(x * 20, y * 20, 10,10);
            rect(x * width/10, y * height/10, width/10, width/10);
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