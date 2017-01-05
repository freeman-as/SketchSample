int frameStep = 1;
float frameStepBase = 0;
int framePrevTime = 0;

void updateFrameStep(){
  int nowTime = millis();
  if(framePrevTime != 0){
    frameStepBase += min((nowTime - framePrevTime) / (1000 / 60.0f), 4);
    frameStep = int(frameStep);
    frameStepBase -= frameStep;
  }
  framePrevTime = nowTime;
}