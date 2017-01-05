//----------------------------------------------
// ステージクラス
class Stage {
  int cw, ch;        // ステージ全体の横幅と縦幅
  int[][] chips;     // ステージチップデータ（CHIP_*が入る）

  final int ChipSize = 32;   // ステージチップサイズ

  final int CHIP_SKY = 0;    // 空中
  final int CHIP_SNOW = 1;   // 雪の地面
  final int CHIP_BLOCK = 2;  // ブロック
  final int CHIP_MAX = 3;    // チップの種類数

  final PImage[] chipImages = new PImage[CHIP_MAX];  // チップの画像

  // 初期化
  Stage() {
    // ステージの地形チップ画像をまとめたものを読み込む
    PImage base = loadImage("chip.png");
    // 32×32ドットの画像ごとにCHIP_MAX個分切り出してchipImagesに入れる
    for(int i=0; i<CHIP_MAX; i++) {
      chipImages[i] = base.get(ChipSize * i, 0, ChipSize, ChipSize);
    }
  }

  // 指定ファイル名のステージを読み込んで作成
  boolean load(String filename) {
    String lines[] = loadStrings(filename);  // ファイルを文字列の配列として読み込む
    if(lines==null || lines.length<=0 || lines[0].length()<=0) {
      return false; // 正常に読み込めなかったのでfalseを返す
    }

    ch = lines.length;        // ステージの縦のチップ数
    cw = lines[0].length();   // ステージの横のチップ数
    chips = new int[ch][cw];  // ステージのチップタイプを記憶する場所を作る

    for(int iy = 0; iy < lines.length; iy++) {  // ステージの縦チップ数分＆ファイルの行数分繰り返す
      String str = lines[iy];                   // 1行取り出す
      int strLen = str.length();                // この行の文字数を取り出す
      //println(str);
      for(int ix = 0; ix < cw; ix++) {          // ステージの横チップ数分繰り返す
        int type = CHIP_SKY;                    // チップの種類（基本は空中）
        if(ix < strLen) {                       // 行の文字数以内だったら
          char c = str.charAt(ix);              // 1文字取り出す
          switch(c) {
            case '0': type = CHIP_SKY; break;   // 0の文字は空中
            case '1': type = CHIP_SNOW; break;  // 1の文字は雪の地面
            case '2': type = CHIP_BLOCK; break; // 2の文字はブロック
            default:    // その他の文字が書かれていたら
              println("不明なチップ(" + ix + ", " + iy + "):" + c);
              return false; // 正常に読み込めなかったのでfalseを返す
          }
        }
        chips[iy][ix] = type; // チップの種類を設定
      }
    }
    return true;  // 正常に読み込めたらtrueを返す
  }

  // ステージを描く
  void draw() {
    int camX = cx(cameraX);  // ステージを描きはじめる左端のチップ位置
    int camY = cy(cameraY);  // ステージを描きはじめる上端のチップ位置
    int dw = cx(width);      // 画面を横方向に埋めるのに必要なチップの数
    int dh = cy(height);     // 画面を縦方向に埋めるのに必要なチップの数
    int margin = 0;          // 画面の大きさよりも少し余分に広い範囲を描く量（マージン）
    for(int iy = camY - margin; iy <= camY + dh + margin; iy++) {    // 縦方向のくり返し
      for(int ix = camX - margin; ix <= camX + dw + margin; ix++) {  // 横方向のくり返し
        int type = chipType(ix, iy);  // 指定位置のチップの種類を得る
        if(type==CHIP_SKY) continue;  // 空中のときはチップを描かない（背景をそのまま見せる）
        image(chipImages[type], ix * ChipSize, iy * ChipSize, ChipSize, ChipSize);
      }
    }
  }

  // ドット単位のX座標をチップ単位の座標に変換して返す
  int cx(float x) {
    if(x < 0) { return int((x + 1) / ChipSize - 1); }
    else { return int(x / ChipSize); }
  }

  // ドット単位のY座標をチップ単位の座標に変換して返す
  int cy(float y) {
    if(y < 0) { return int((y + 1) / ChipSize - 1); }
    else { return int(y / ChipSize); }
  }

  // 指定位置のチップの種類を返す
  int chipType(int cx, int cy) {
    if(chips==null|| cy<0 || cy>=chips.length || cx<0 || cx>=chips[cy].length) {
      return CHIP_SKY;      // 範囲外だったら空中のチップを返す
    } else {
      return chips[cy][cx]; // チップデータから指定位置のチップの種類を返す
    }
  }

  // 壁にぶつかったか？
  boolean isWall(float x, float y) {
    int type = chipType(cx(x), cy(y));
    return type > CHIP_SKY;
  }
}
