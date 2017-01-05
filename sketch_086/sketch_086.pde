int LENGTH = 5;
int[][] _map = {
    {0, 1, 2, 1, 0},
    {1, 2, 3, 2, 1},
    {2, 3, 6, 3, 2},
    {1, 2, 3, 2, 1},
    {0, 1, 2, 1, 0}
};
float _radius;


void setup() {
    size(500, 500);
    colorMode(HSB, 100);
    background(99);
    noStroke();
    //frameRate(10);
    
    _radius = width/5;
}

void draw() {

    //translate(_radius/2, _radius/2);
    ellipseMode(CORNER);

    for(int y = 0; y < LENGTH; y++){
        for(int x = 0; x < LENGTH; x++){
            fill(_map[y][x]*10, 60, 99);
            ellipse(x*_radius, y*_radius, _radius, _radius);
        }
    }
}

void fadeToWhite() {
    noStroke();
    //fill(LENGTH- 1, LENGTH * 0.3);
    fill(99, 10);
    rectMode(CORNER);
    rect(0, 0, width, height);
}

color randomRGBColor(int r, int g, int b) {
    color c = color(random(r), random(g), random(b), 80);
    return c;
}
color randomRGBColor(int r, int g, int b, int a) {
    color c = color(random(r), random(g), random(b), a);
    return c;
}

void keyPressed(){
    if(keyCode == ENTER) save("screen.png");
}
void keyTyped(){
    if(key == 's' || key == 'S') saveFrame("screen_##.png");
}