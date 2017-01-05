void setup() {
    size(640, 640);
    colorMode(HSB, 100);
    background(99);
    noStroke();
    
    float x = 0, y = 0;
    while(y < height){
        x = random(width);
        y +=  random(5);
        
        fill(random(100),  y, 99, 30);
        rect(x, y, 50, 50);
    } 
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}