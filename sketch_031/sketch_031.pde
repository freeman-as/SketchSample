void setup() {
    size(640, 640);
    colorMode(HSB, 100);
    background(0);
    noStroke();
    
    translate(width/2, height/2);
    int r = 360/12;

    //pushMatrix();
    //rotate(radians(r));
    //translate(150, 0);
    //for(int i = 10; i > 0; i--){
    //    fill(30, 120 - (i*10) , 99);
    //    rect(0, 0, 10*i, 10*i);
    //}
    //popMatrix();

    for(int j = 0; j <12; j++){
        
        pushMatrix();
        rotate(radians(r * j));
        translate(100, 0);
        for(int i = 10; i > 0; i--){
            fill(30, 120 - (i*10) , 99);
            rect(0, 0, 10*i, 10*i);
        }
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