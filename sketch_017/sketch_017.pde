ArrayList<Drawable> objects; // 描画できるオブジェクト配列クラス

void setup(){
    size(640, 480);
    
    // 描画できるオブジェクトの配列を確保
    objects = new ArrayList<Drawable>();

    // 雪だるまを２つ作る
    objects.add(new Yukidaruma(200, 480));
    objects.add(new Yukidaruma(500, 480));
    
    // 雪をランダムに100個作る
    for (int i = 0; i < 100; i++){
        Yuki yuki = new Yuki(random(width), random(height));
        objects.add(yuki);
    }
}

void draw(){
    background(100, 100, 220);
    
    for(Drawable obj : objects){
        obj.draw();
    }

    // マウスボタンを押している間、雪を増やす
    if(mousePressed) objects.add(new Yuki(random(width), 0));
    
    println(objects.size());
    
    // objectsの数が増えるほど雪が積もったように資格を描画
    fill(255);
    int yukiLevel = (objects.size() - 100) / 5;
    rect(0,height - yukiLevel, width, yukiLevel);
}

interface Drawable{
    void draw();
}

// Yukidarumaクラスを定義
class Yukidaruma implements Drawable {
    int x, y;
    
    // newで作るときに呼ばれる関数
    Yukidaruma(int x, int y){
        this.x = x;
        this.y = y;
    }
    
    void draw(){
        noStroke();
        ellipse(x, y - 100, 200 , 200 );
        ellipse(x, y - 200 - 40, 180, 180);
    }
}

class Yuki implements Drawable {
    float x, y;
    
    Yuki(float x, float y){
        this.x = x;
        this.y = y;
    }
    
    void draw(){
        y += random(0.5f, 2.0f);
        if(y > height) y -= height + 50;;
        
        noStroke();
        fill(255);
        ellipse(x, y, 20, 20);
    }
}

//class IroYukidaruma extends Yukidaruma{
//    color col;
    
//    IroYukidaruma(int x, int y, color col){
//        super(x, y);
//        this.col = col;
//    }
    
//    IroYukidaruma(int x, int y){
//        super(x, y);
//    }
    
//    void draw(){
//        pushStyle();
//        fill(col);
//        super.draw();
//        popStyle();
//    }
//}

void keyTyped(){
    if(key == 's' || key == 'S'){
        save("screen.jpg");
    }
}