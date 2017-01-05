void setup() {
    size(640, 640);
    colorMode(HSB, 100);
    background(0);
    
    //PFont font = loadFont("font.vlw");
    //textFont(font);
    textAlign(CENTER);
    int count = 0;
    
    while(count < 400){
        float x = width/2- random(width);
        println(x);
        float y = height/2 - random(height);
        println(y);
        float distance = sqrt(x*x + y*y);
        //float distance = sqrt(pow(x, 2) + pow(y, 2));
        //float distance = dist(x, y, 0, 0);

        if(distance < 280){
            textSize(random(5, 30));
            fill(random(50, 60), 99, 99, 80);
            text("CIRCLE", width/2 + x, height/2 + y);
            count++;
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