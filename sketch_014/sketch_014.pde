final int SCENE_LOGO = 0;
final int SCENE_TITLE = 1;
final int SCENE_GAME = 2;

int scene = SCENE_LOGO;
int sceneFrames = 0;
int fadeAlpha = 255;

PImage logoImg, titleImg, bgImg, charaImg, balloonImg; // 各種画像
boolean pmousePressed, isClicked; // マウスボタンの状態用

void setup() {
    size(640, 480);
    textFont(createFont("", 60));
    logoImg = loadImage("logo.png");
    titleImg = loadImage("title.png");
    bgImg = loadImage("bg.png");
    charaImg = loadImage("chara_girl.png");
    balloonImg = loadImage("balloon.png");
    //frameRate(1);
}

void draw() {
    isClicked = (!pmousePressed && mousePressed);
    println(isClicked);

    background(0);
    sceneFrames++;

    // 各シーンを描写
    switch(scene) {
    case SCENE_LOGO: 
        drawLogo(); 
        break;
    case SCENE_TITLE: 
        drawTitle(); 
        break;
    case SCENE_GAME: 
        drawGame(); 
        break;
    }

    fadeAlpha = max(fadeAlpha - 12, 0);
    if (fadeAlpha > 0) {
        fill(0, fadeAlpha);
        rect(0, 0, width, height);
    }

    pmousePressed = mousePressed;
}

// シーンの変更
void changeScene(int newScene) {
    scene = newScene;
    sceneFrames = 0;
    fadeAlpha = 255;
}

// ロゴ画面
void drawLogo() {
    // ロゴ終了後はタイトル画面に遷移
    if (sceneFrames > 60 * 4 || isClicked) {
        changeScene(SCENE_TITLE);
        return;
    }

    // ロゴのフェードアウト表示
    float logoAlpha = 1.0f;
    if (sceneFrames > 60 * 1) {
        logoAlpha = map(sceneFrames, 60 * 3, 60 * 4, 255, 0);
    }

    //真ん中にロゴを表示
    pushStyle();
    tint(255, logoAlpha);
    imageMode(CENTER);
    image(logoImg, width/2, height/2, 380, 380);
    popStyle();
}

// ロゴ画面
void drawTitle() {
    image(titleImg, 0, 0, width, height);

    fill(255);
    textAlign(LEFT, TOP);
    textSize(100);
    text("Game", width/2, 120);
    text("Title", width/2, 220);
    textSize(30);
    text("- CLICK TO START -", width/2, 380);

    if (isClicked) {
        changeScene(SCENE_GAME);
    }
}

void drawGame() {
    image(bgImg, 0, 0, width, height);

    // 右下にキャラクターを描写
    float charaW = width * 0.3f;
    float charaH = charaImg.height * (charaW / charaImg.width);
    image(charaImg, width - charaW, height - charaH, charaW, charaH);

    // キャラクターのフキダシ
    float balloonH = 150;
    float balloonW = width - charaW +10;
    float balloonX = 30;
    float balloonY = height - charaH - 40;
    image(balloonImg, balloonX, balloonY, balloonW, balloonH);

    // フキダシの中にセリフを描写
    String message = "ここからはじまるのね！　でもこれはサンプルだからここまで。\nクリックするとロゴに戻るよ。";
    fill(0);
    textSize(20);
    textAlign(LEFT, TOP);
    text(message, balloonX +40, balloonY + 30, balloonW - 120, balloonH - 50);
    
    if(isClicked){
        changeScene(SCENE_LOGO);
    }
}