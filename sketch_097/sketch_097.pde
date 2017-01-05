import processing.video.*;

Capture camera;
PImage pcamera;


void setup() {
    size(640, 480);
    stroke(255);
    frameRate(30);

    String[] cameras = Capture.list();

    if (cameras.length == 0) {
        println("There are no cameras available for capture.");
        exit();
    } else {
        println("Available cameras:");
        for (int i = 0; i < cameras.length; i++) {
            println(cameras[i]);
        }
    
        camera = new Capture(this, width, height, 15);
        pcamera = new PImage(width, height);
        camera.start();     
    }
}

void draw() {
    pcamera.loadPixels(); // カメラ画像のpixelsロード
    
    tint(255, 64);
    image(camera, 0, 0);
    
    for(int y = 0; y < height; y += 5){
        for(int x = 0; x < width; x += 5){
            int pos = (y * width) + x;
            float diff = abs(brightness(pcamera.pixels[pos] - camera.pixels[pos]));
            
            if(diff > 50){
                fill(camera.pixels[pos]);
                rect(x, y, diff/5, diff/5);
            }
        }
    }
    
    pcamera.copy(camera, 0, 0, width, height, 0, 0, width, height);
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