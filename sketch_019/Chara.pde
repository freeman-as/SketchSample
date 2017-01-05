// キャラクタークラス
class Chara {
  float x, y;
  float w, h;

  Chara(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  // 座標を設定
  void setPos(int x, int y){
    this.x = x;
    this.y = y;
  }

  // 更新
  void update(){}

  // 描画
  void draw(){
    if(isDebug){
      // キャラ全体を囲う四角
      noStroke();
      fill(255, 0, 0, 64);
      rect(x - w / 2, y - h, w, h);
    }
  }

  // キャラクター同士が重なっているか
  boolean isHitRect(Chara chara){
    float rx = chara.x - x;
    float ry = (chara.y - chara.h / 2) - (y - h / 2);

    float hw = (chara.w + w) / 2;
    float hh = (chara.h + h) / 2;

    return (rx > -hw && rx < hw) && (ry > -hh && ry < hh);
  }

  // キャラクター同士が重なっているかを円形で判定
  // (半径はw / 2を使用)
  boolean isHitEllipse(Chara chara){
    return dist(chara.x, chara.y - chara.h / 2, x, y - h / 2) < (chara.w + w) / 2;
  }
}

// 雪だるまクラス
class Yukidaruma extends Chara{
  PImage img;
  color col = color(255);
  float speedX, speedY;
  boolean isLanding;

  Yukidaruma(int x, int y, color col){
    super(x, y, 50, 80);
    this.col = col;
    img = loadImage("yukidaruma.png");
  }

  void update(){
    if(isLanding){
      speedX *= 0.9f;
    } else {
      speedX *= 0.93f;
      speedY += 0.22f;
    }

    // 現在の速さで動く
    x += speedX;
    y += speedY;
    fixWall();
  }

  void draw(){
    super.draw();

    pushMatrix();

    translate(x, y);
    tint(col);
    image(img, -w / 2, -h, w, h);

    if(isDebug){
      stroke(0, 255, 0);
      line(0, 0, 0, -h);
      float hw = w / 2;
      float hh = h / 2;
      float hc = stage.ChipSize / 2;

      line(-hw, -hh, hw, -hh);
      line(-hw, -hc, hw, -hc);

      line(-hw, -h + hc, hw, -h + hc);
    }

    popMatrix();
  }

  void landing(){
    isLanding = true;
    speedY = 0.0f;
  }

  void air(){
    isLanding = false;
  }

  // ステージの壁に雪だるまの上下左右が重なった時に呼ばれる関数
  void onTop(){}
  void onDown(){}
  void onLeft(){}
  void onRight(){}

  // 壁の外に雪だるまを押し出す
  void fixWall(){
    float leftX = x - w/2;
    float rightX = x + w/2;
    float topY = y - h;
    float middleY = y - h / 2;
    float hc = stage.ChipSize / 2;

    // 足元をチェック
    if(stage.isWall(x, y)){
      y = stage.cy(y) * stage.ChipSize;

      if(isLanding) onDown();

      landing();
    } else {
      air();
    }

    // アタマの上をチェック
    if(stage.isWall(x, topY)){
      y = (stage.cy(topY) + 1) * stage.ChipSize + h;
      onTop();
    }

    // 左チェック
    if(stage.isWall(leftX, middleY) || stage.isWall(leftX, y - hc) || stage.isWall(leftX, topY + hc)){
      x = (stage.cx(leftX)+1) * stage.ChipSize + w/2;
      onLeft();
    }

    // 左チェック
    if(stage.isWall(rightX, middleY) || stage.isWall(rightX, y - hc) || stage.isWall(rightX, topY + hc)){
      x = (stage.cx(rightX)) * stage.ChipSize - w/2;
      onRight();
    }
  }
}

// プレイヤークラス
class PlayerYukidaruma extends Yukidaruma{
  int jumpFrames = 0;

  PlayerYukidaruma(int x, int y){
    super(x, y, color(255));
  }

  void update(){
    if(isLanding || jumpFrames > 0){
      boolean isMouseJump = (mousePressed && cameraY + mouseY < y - h / 2);
      if(isKeyUp || isKeySpace || isMouseJump){
        if(isLanding){
          air();
          speedY -= 4.0f;
          jumpFrames = 20;
        } else {
          speedY -= 0.3f;
          jumpFrames--;
        }
      }
    }

    float stepX = 0.9f;
    if(!isLanding) stepX *= 0.25f;

    float stageMouseX = mouseX + cameraX;

    if(isKeyLeft || (mousePressed && x > stageMouseX + w / 2)){
      speedX -= stepX;
    } else if(isKeyRight || (mousePressed && x < stageMouseX - w/2)){
      speedX += stepX;
    }

    super.update();
  }

  // 下がステージの壁に重なった時
  void onDown(){
    if(!isLanding){
      jumpFrames = 0;
    }
  }

  //上がステージの壁に重なった時
  void onTop(){
    jumpFrames = 0;
    if(speedY < 0.0f) speedY = 0.0f;
  }
}

// 敵の雪だるま
class EnemyYukidaruma extends Yukidaruma{
  float walkSpeed = -1.0f;

  EnemyYukidaruma(int x, int y){
    super(x, y, color(30, 30, 55));
  }

  void onLeft(){ walkSpeed = -walkSpeed; }
  void onRight(){ walkSpeed = -walkSpeed; }

  void update(){
    // 行く先の地面がなかったら反転
    if(!stage.isWall(x + walkSpeed, y)){
      walkSpeed = -walkSpeed;
    }
    speedX = walkSpeed;
    super.update();
  }
}