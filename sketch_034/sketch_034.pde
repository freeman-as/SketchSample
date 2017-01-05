void setup() {
    size(640, 640);
    colorMode(HSB, 100);
    background(99);
    noFill();
    
    int h;
    int s;
    
    for(int i = 0; i < 1000; i++){
        float x = random(width);
        float y = random(height);
        
        if(x < width/2){
            h = 30;
        } else {
            h = 60;
        }
        if(y > height/2){
            h += 20;
        } else {
            h -= 20;
        }
        
        if(x > width/4  && x < width-width/4 && y > height/4 && y < height-height/4){
            s = 99;
        } else {
            s = 40;
        }
        
        stroke(h, s, 99);
        ellipse(x, y, 20, 20);
    }
    
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}