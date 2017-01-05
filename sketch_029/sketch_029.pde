void setup() {
    size(640, 640);
    colorMode(HSB, 120);
    background(119);
    //rectMode(CENTER);
    noStroke();
    
    int angle = 30;
    int margin = 50;
    

    translate(width/2, height/2);

    for(int i = 0; i < 12; i++){

        fill(i * 10, 100, 119, 60);
        rect(0, 0, 50,50);

        stroke(110);
        strokeWeight(1);
        line(0, 0, width, 0);
        line(0, 0, 0, height);
        noStroke();


        rotate(radians(angle));
        translate(margin, 0);
    }
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}