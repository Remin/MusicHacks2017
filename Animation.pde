class Animation {
  
  int numFrames;
  PImage[] sprite;
  String imageName;
  
  int animationTimer = 0;
  int animationTimerValue = 100;
  int currentFrame;
  
  Animation(int tempFrames) {
    numFrames = tempFrames;
    currentFrame = 0;
    sprite = new PImage[numFrames];
    
    for(int i = 0; i < numFrames; i++) {
      imageName = "sprite_Note" + nf(i, 1) + ".png";
      sprite[i] = loadImage(imageName);
    }
    
  }
  
  
  void display(float locX, float locY) {
    image(sprite[currentFrame], locX, locY, 60, 60);
    if((millis() - animationTimer) >= animationTimerValue) {
      currentFrame = (currentFrame + 1) % numFrames;
      animationTimer = millis();
    }
  }
}