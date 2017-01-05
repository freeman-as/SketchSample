float X, Y;
float Cx, Cy;
float Ang1, Ang2;
float R1, R2;
float Rot1,Rot2;

void setup() {
    size(640, 640);
    colorMode(HSB, 100);
    background(99);
    noStroke();
    rectMode(CENTER);
    frameRate(30);
    
    Cx = width/2;
    Cy = height/2;
    Ang1 = Ang2 = 0;
    R1= 200;
    R2 = 50;
    Rot1 = 3;
    Rot2 = 20;
}

void draw() {
    //fadeToWhite();
    
    Ang1 += Rot1;
    Ang2 += Rot2;
    
    float rx = Cx + (R1 * cos(radians(Ang1)));
    float ry = Cy + (R1 * sin(radians(Ang1)));
    //X = Cx + (R1 * cos(radians(Ang1)));
    //Y = Cy + (R1 * sin(radians(Ang1)));
    X = rx + (R2 * cos(radians(Ang2)));
    Y = ry + (R2 * sin(radians(Ang2)));

    println(rx, ry);
    //println(X, Y);
    
    fill(0, 100, 100, 60);
    rect(X, Y, 5, 5);
}

void fadeToWhite(){
    noStroke();
    fill(99, 30);
    rectMode(CORNER);
    rect(0, 0, width, height);
}

color randomRGBColor(){
    color c = color(random(256), random(256), random(256));
    return c;
}

void keyTyped() {
    if (key == 's' || key == 'S') {
        save("screen.png");
    }
}