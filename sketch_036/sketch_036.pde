void setup() {
    size(640, 640);
    colorMode(HSB, 50);
    background(49);
    
    int grad_count = 0;
    boolean grad_change = false;
    
    for(int x = 0; x < width; x++){
        if(grad_change){
            grad_count--;
        } else {
            grad_count++;
        }
        stroke(30, grad_count, 49);
        line(x, 0, x, height);
        if(grad_count % 50 == 0){
            grad_change = !grad_change;
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