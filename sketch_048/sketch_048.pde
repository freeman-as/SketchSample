void setup() {
    size(640, 640);
    colorMode(RGB, 256);
    background(255);
    noStroke();
    //frameRate(10);
}

void draw() {

    fill(255, 15);
    rect(0, 0, width, height);

    int x = int(random(width));
    int y = int(random(height));
    int sz = int(random(width/2));
    fill(randomRGBColor());
    ellipse(x, y, sz, sz);

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