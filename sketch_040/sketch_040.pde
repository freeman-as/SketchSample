void setup() {
    size(640, 640);
    colorMode(RGB, 10);
    background(9);
    noStroke();
    
    fill(4, 4, 9);
    boolean offset = false;
    int loopNum = 10;
    
    for(int y = 0; y <= loopNum; y++){
        for(int x = 0; x <= loopNum; x++){
            if(offset){
                ellipse(x * width/loopNum, y * height/loopNum, 20, 20);
            } else {
                ellipse(x * width/loopNum + (width/loopNum)/2,  y * height/loopNum, 20, 20);
            }
        }
        offset = !offset;
    }
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}