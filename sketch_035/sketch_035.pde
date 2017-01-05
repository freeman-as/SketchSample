void setup() {
    size(640, 640);
    colorMode(HSB, 100);
    background(99);
    ellipseMode(CORNER);
    
    for(int y = 0; y < height; y += 10){
        for(int x = 0; x < width; x += 10){
            int fig = int(random(0, 4));

            switch(fig){
                case 0:
                    fill(0, 0 , 0);
                    rect(x, y, 8, 8);
                    break;
                case 1:
                    fill(30, 80, 99);
                    rect(x, y, 8, 8);
                    break;
                case 2:
                    fill(0, 0, 0);
                    ellipse(x, y, 8, 8);
                    break;
                default:
                    fill(60, 80, 99);
                    ellipse(x, y, 8, 8);
                    break;
            }  
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