ArrayList<Chara> charas;
PlayerYukidaruma player;
Stage stage; // ステージクラス
float cameraX, cameraY; //カメラの位置
PImage bgImg, filterImg;
boolean isClear = false;
boolean isDebug = true;


// カーソルキーやスペースキーの同時入力判定用
boolean isKeyUp, isKeyDown, isKeyLeft, isKeyRight, isKeySpace;


void setup(){
  size(640, 480, P2D);

  textFont(createFont("", 60));
  bgImg = loadImage("bg.png");
  filterImg = loadImage("filter.png");

  initStage(0);
}

// 新しいステージを開始する
void initStage(int no){
  // キャラクターリストを作成
  charas = new ArrayList<Chara>();

  // ステージを作る
  stage = new Stage();
  stage.load("stage" + no + ".txt");

  player = new PlayerYukidaruma(200, (stage.ch - 15) * stage.ChipSize);
  charas.add(player);
}

void draw(){
  // 背景を描く
  tint(120, 120, 220);
  image(bgImg, 0, 0, width, height);
  noTint();

  // カメラがプレイヤーをなめらかに追いかけるようにする
  float leapY = 0.1f;
  if(player.y > stage.ch * stage.ChipSize) leapY = 0.01f;
  cameraX = lerp(cameraX, player.x - width * 0.3f, 0.2f);
  cameraY = lerp(cameraY, player.y - height * 0.7f, leapY);

  // カーソルキーでカメラの表示位置を移動
  // float step = stage.ChipSize / 4;
  // if(isKeyRight) cameraX += step;
  // if(isKeyLeft) cameraX -= step;
  // if(isKeyUp) cameraY -= step;
  // if(isKeyDown) cameraY += step;
  // println(cameraX, cameraY);

  drawYuki();

  pushMatrix();
  translate(-cameraX, -cameraY);

  stage.draw(); // ステージ描写

  // キャラクターを動かして描く
  for(int i = 0; i < charas.size(); i++){
    Chara chara = charas.get(i);
    chara.update();
    chara.draw();

    //プレイヤーと敵の雪だるまがぶつかった時に、跳ねさせる
    if(chara != player && player.isHitRect(chara)){
      if(chara.x - player.x < 0){
        player.speedX = 20.0f;
      } else {
        player.speedX = -20.0f;
      }
      player.speedY = -5.0f;

      // 敵の頭を踏んだら敵を消す
      /*
      if(chara.y - chara.h / 2 > player.y){
        fill(0);
        ellipse(chara.x, chara.y - chara.h * 0.25f, chara.w * 1.5f, chara.h * 0.5f);
        charas.remove(i);
        i--;
      }
      */
    }
  }

  // // キャラクター描写
  // player.update();
  // player.draw();

  popMatrix();

  // 曇りガラスのような画像を画面全体に重ねる
  tint(255, 120);
  image(filterImg, 0, 0, width, height);
  noTint();

  //デバッグ用の表示
  if(isDebug){
    fill(0, 128);
    rect(10, 10, 250, 80);

    fill(50, 255, 50);
    textSize(16);
    textAlign(LEFT, TOP);
    text("position:" + nf(player.x, 0, 2) + ", " + nf(player.y, 0, 2), 20, 20);
    text("speed:" + nf(player.speedX, 0, 2) + ", " + nf(player.speedY, 0, 2), 20, 40);
    text("frameRate:" + nf(frameRate, 2, 1), 20, 60);
  }

  if(player.y < 0) {
    isClear = true;
  } else if(player.y > (stage.ch + 10) * stage.ChipSize){
    initStage(0);
  }

  // ゲームクリア状態ならクリアの文字を描く
  if(isClear){
    fill(255);
    textSize(80);
    textAlign(CENTER,CENTER);
    text("CLEAR", width/2, height/3);
  }
}

void drawYuki(){
  int seed = int(random(1000));
  randomSeed(0);

  noStroke();
  fill(255);
  for(int i = 0; i < 100; i ++){
    float z = random(1, 2);
    float r = z * 5;
    float xt = sin(frameCount * random(0.02f, 0.04f) * z);
    float yt = frameCount * z * 0.5f;

    // 画面外だったら割った余りで画面内にすることでどこまでも降る雪にする
    //手前にあるほどカメラの動きに付いてくる
    float x = modulo(random(width) -cameraX * (z - 1) + xt, width);
    float y = modulo(random(height) -cameraY * (z - 1) + yt, height);
    ellipse(x, y, r, r);
  }

  randomSeed(seed);
}

float modulo(float a, float b){
  return a - floor(a / b) * b;
}

void keyPressed(){
    if(key == CODED){
        switch(keyCode){
            case UP:
                isKeyUp = true;
                break;
            case DOWN:
                isKeyDown = true;
                break;
            case LEFT:
                isKeyLeft = true;
                break;
            case RIGHT:
                isKeyRight = true;
                break;
        }
    } else if (key == ' ') isKeySpace = true;
}

void keyReleased(){
    if(key == CODED){
        switch(keyCode){
            case UP:
                isKeyUp = false;
                break;
            case DOWN:
                isKeyDown = false;
                break;
            case LEFT:
                isKeyLeft = false;
                break;
            case RIGHT:
                isKeyRight = false;
                break;
        }
    } else if (key == ' ') isKeySpace = false;
}
