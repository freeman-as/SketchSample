void setup() {
    size(640, 640);
    colorMode(HSB, 100);
    background(0);
    noFill();
    
    int range_color = 10;
    int range_y = 4;
    float fluc_color = 50;
    float fluc_y ;

    for(int y = 0; y < height; y+=10){
        fluc_color += random(-range_color, range_color);
        stroke(fluc_color, 60, 99, 30);
        
        fluc_y = 0;
        
        beginShape();
        for(int x = 0; x <= width; x +=3){
            fluc_y += random(-range_y, range_y);
            vertex(x, y + fluc_y );
        }
        endShape();
    }
}

void draw() {
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}