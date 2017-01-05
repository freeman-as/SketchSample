void setup() {
    size(640, 640);
    colorMode(RGB, 10);
    background(8, 0, 0);
    noStroke();
    int num = 5;
    
    fill(0, 0, 0, 4);
    for(int i = 0; i < num; i++){
        rect(0, height/(num*4) + i * height/num, width, height/(num*2));
        rect(width/(num*4) + i * width/num,0,  width/(num*2), height);
    }

    fill(9, 9, 9, 3);
    for(int i = 0; i < num; i++){
        rect(0, height/(num*3) + i * height/num, width, height/(num*20));
        rect(width/(num*3) + i * width/num,0,  width/(num*20), height);
        rect(0, height/(num*1.6) + i * height/num, width, height/(num*20));
        rect(width/(num*1.6) + i * width/num,0,  width/(num*20), height);
    }
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}