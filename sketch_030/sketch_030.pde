void setup() {
    size(640, 640);
    colorMode(HSB, 300);
    background(299);
    noFill();
    smooth();
    rectMode(CENTER);
    
    int angle = 24;
    int x = 10;
    
    translate(width/2, height/2);
    
    for(int i = 0; i < 30; i++){

        stroke(i*10, 299, 299);
        
        pushMatrix();
        rotate(radians(angle * i));
        translate(x * i, 0);
        rect(0, 0, 30, 30);
        popMatrix();
    }
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}