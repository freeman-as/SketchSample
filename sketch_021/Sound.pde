import ddf.minim.*;

// BGMと効果音などのサウンドクラス
class Sound{
  Minim minim;
  AudioPlayer bgm;
  AudioSample jumpSE, landingSE, hitSE;
  HashMap<String, AudioSample> seMap;

  // 初期化
  Sound(PApplet applet){
    minim = new Minim(applet);

    bgm = minim.loadFile("bgm.mp3");
    jumpSE = minim.loadSample("jump.wav");
    landingSE = minim.loadSample("landing.wav");
    hitSE = minim.loadSample("hit.wav");

    seMap = new HashMap<String, AudioSample>();
  }

  void dispose(){
    minim.dispose();
    jumpSE = landingSE = hitSE = null;
    bgm = null;
    seMap.clear();
  }

  void playBGM(){ bgm.loop(); }
  void playJump(){ jumpSE.trigger(); }
  void playLanding(){ landingSE.trigger(); }
  void playHit(){ hitSE.trigger(); }

  AudioSample loadSE(String fileName){
    AudioSample se = minim.loadSample(fileName);
    seMap.put(fileName, se);
    return se;
  }

  void playSE(String fileName){
    AudioSample se = seMap.get(fileName);
    if(se == null){
      se = loadSE(fileName);
    }
    se.trigger();
  }
}