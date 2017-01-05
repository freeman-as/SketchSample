float screenScale = 1.0f;
int sWidth, sHeight;
int spMouseX, spMouseY, sMouseX, sMouseY;

void setupScaleScreen(int baseWidth, int baseHeight){
  screenScale = min(width/(float)baseWidth, height/(float)baseHeight);

  sWidth = int(width/screenScale);
  sHeight = int(height/screenScale);

  println("screenScale = " + screenScale + ", sWidth = " + sWidth + ", sHeight = " + sHeight);
}

void drawScaleScreen(){
  scale(screenScale);
  spMouseX = sMouseX;
  spMouseY = sMouseY;
  sMouseX = int(mouseX / screenScale);
  sMouseY = int(mouseY / screenScale);
}