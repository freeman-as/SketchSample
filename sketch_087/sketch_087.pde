int LENGTH = 20;
int _blockSize;
int[][] _map;
int _x, _y;

void setup() {
    size(500, 500);
    colorMode(HSB, 100);
    background(99);
    
    _x = mouseX;
    _y = mouseY;
    
    _blockSize = (width / LENGTH);

    _map = new int[LENGTH][LENGTH];
    for(int y = 0; y < LENGTH; y++){
        for(int x = 0; x < LENGTH; x++){
            _map[y][x] = 10;
        }
    }
}

void draw() {

    for(int y = 0; y < LENGTH; y++){
        for(int x = 0; x < LENGTH; x++){
            noStroke();
            fill(_map[y][x]*10);
            rect(x * _blockSize, y * _blockSize, _blockSize, _blockSize);
        }
    }
}

void mouseMoved(){
    _x = mouseX / _blockSize;
    _y = mouseY / _blockSize;
    println(mouseX+" : "+mouseY);
    if(_map[_y][_x] > 0) _map[_y][_x]--;
}

void mouseDragged(){
    int x =0;
    int y =0;
    x = mouseX / _blockSize;
    y = mouseY / _blockSize;
     // マウスドラッグの時にマイナスの値までキャンバス外の値を取ってくるせいで起こる配列数越えの例外を除外する条件
    if((x < LENGTH && x >= 0) && (y < LENGTH && y >= 0)){
        if(_map[y][x] < 10) _map[y][x]++;
    }
    println(mouseX+" : "+mouseY);
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