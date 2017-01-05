PImage bgImg;
int bgNo = 0;
int seed = 0;

void setup(){
    size(640, 480);
    bgImg = loadImage("bg0.jpg");
    stroke(255);
}

void draw(){
    background(255);
    
    if(!mousePressed) seed = frameCount / 5;
    randomSeed(seed);
    
    int r = 5 + int(10.0 * mouseX / width);
    //println(r);
    
    if(mouseY > height / 2){
        image(bgImg, 0, 0, width, height);
    } else {
        // 画面に合わせて拡大(size()の大きさが変わっても大丈夫なように)
        scale(width / (float)bgImg.width, height / (float)bgImg.height);
        translate(0, -r);
        
        // 画像の縦横分繰り返す（rドットずつ飛ばしながら）
        for(int y = 0; y < bgImg.height; y += r){
            for(int x = 0; x < bgImg.width; x += r){
                color c = bgImg.get(x, y);
                fill(c);
                
                // はり絵（ちぎり絵）風に四角をランダムに傾けて描く
                if(random(100) < 90){
                    noStroke();
                } else {
                    strokeWeight(random(0, 2));
                }
                pushMatrix();
                
                translate(x, y);
                rotate(radians(random(90)));
                // いろんな大きさのランダムの四角を描く
                rect(random(r / 2 + 1), random(r / 2 + 1), random(r, r *2), random(r, r *2));
                popMatrix();
            }
        }
    }
}

void mouseClicked(){
    if(++bgNo > 6) bgNo = 0;
    println(bgNo);
    bgImg = loadImage("bg" + bgNo + ".jpg");
}

void keyTyped(){
    if(key == 's' || key == 'S'){
        save("screen.jpg");
    }
}