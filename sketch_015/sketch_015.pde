Yukidaruma yukidarumaA;
Yukidaruma yukidarumaB;
Yuki[] yukiArray;

void setup(){
    size(640, 480);
    println(yukidarumaA); // == null

    // 雪だるまのインスタンス生成
    yukidarumaA = new Yukidaruma(200, height);
    yukidarumaB = new Yukidaruma(500, height);
    
    // 雪をランダムに100個作る
    yukiArray = new Yuki[100];
    for (int i = 0; i < yukiArray.length; i++){
        Yuki yuki = new Yuki(random(width), random(height));
        yukiArray[i] = yuki;
    }
}

void draw(){
    background(100, 100, 220);

    // 雪だるまを描画
    yukidarumaA.draw();
    yukidarumaB.draw();
    
    // 雪を描写
    for(Yuki yuki : yukiArray){
        yuki.draw();
    }
}

// Yukidarumaクラスを定義
class Yukidaruma{
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

class Yuki{
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

class IroYukidaruma extends Yukidaruma{
    color col;
    
    IroYukidaruma(int x, int y, color col){
        super(x, y);
        this.col = col;
    }
    
    IroYukidaruma(int x, int y){
        super(x, y);
    }
    
    void draw(){
        pushStyle();
        fill(col);
        super.draw();
        popStyle();
    }
}

void keyTyped(){
    if(key == 's' || key == 'S'){
        save("screen.jpg");
    }
}