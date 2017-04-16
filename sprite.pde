

class sprite{
  int numFrames;
  Animation chara;
  float charX;
  float charY;
  
  sprite(int frames, float startX, float startY){
    numFrames = frames;
    charX = startX;
    charY = startY;
    chara = new Animation(numFrames);
  }
  
  void run(){
   //this.update();
   chara.display(charX, charY);
   
  }
  
  void update(){
    
  }
  
  void move(){
    float amt = 2; //amount of pixels cursor will move per key press
    switch(key){
      case 'w':
        if(charY > 0){
          charY -= amt;
        }
        break;
      case 'a': 
        if (charX > 0){
          charX -= amt;
        }
        break;
      case's':
        if (charY < (height - 20)){
          charY += amt;
        }  
        break;
      case 'd':
        if (charX < (width - 20)){
        charX += amt;
        }
        break;
    }
    
  }
  
  float getX(){
    return charX;
  }
  
  float getY(){
    return charY;
  }
    
  
}