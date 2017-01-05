import processing.video.*;
Capture camera;


void setup() {
    size(1280, 720);
    colorMode(HSB, 256);
    noFill();
    strokeWeight(2);

    String[] cameras = Capture.list();

    if (cameras.length == 0) {
        println("There are no cameras available for capture.");
        exit();
    } else {
        println("Available cameras:");
        for (int i = 0; i < cameras.length; i++) {
            println(cameras[i]);
        }
    
        camera = new Capture(this, width, height, 12);
        camera.start();     
    }
}

void draw() {
    background(0);
    camera.loadPixels(); // カメラ画像のpixelsロード
    //image(camera, 0, 0); // 背景をカメラ画像に
    
    for(int y = 0; y < height; y+=10){
        for(int x = 0; x < width; x+=10){
            int pos = (y * camera.width) + x;
            color c = camera.pixels[pos];
            
            float h = hue(c);
            float s = saturation(c);
            float b = 10 * brightness(c) /256;
            
            stroke(h, s, 256);
            ellipse(x, y, b, b);
        }
    }
    updatePixels();
}

void captureEvent(Capture camara){
    if (camera.available() == true) {
        camera.read();
    }    
}

void fadeToWhite() {
    noStroke();
    //fill(LENGTH- 1, LENGTH * 0.3);
    fill(99, 30);
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