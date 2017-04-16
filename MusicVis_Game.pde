
//setup for game screens
final int gameStart = 0; //state to start game
final int gameOn = 1; //state for when game is running
final int gamePause = 2; //state for when game is paused, user presses 'p' to pause
final int gameEnd = 3; //state for when game is finished
int state = gameStart; //set beginning state to start screen

Button startButton; //button to start game
Button exitButton; //button to exit game
Button contButton; //button to continue game

//Character
sprite note;

int gameTime, totTime;

int elapsedSeconds; //seconds elapsed during running program
int gameSeconds = 0; //seconds elapsed during a game
int timerSeconds; //seconds displayed on the game timer
int pauseSeconds = 0; //game seconds elapsed when game is paused

int cScore;//Current Score
int hiScore;//High Score

boolean justEnded; //to check if the game just ended
String result; //for victory/defeat screens

// Import Minim for sound 
import ddf.minim.*;
AudioPlayer player;
Minim minim;//audio context


void setup() {
  size(700,700);
  startButton = new Button(color(150), width/2, (height/5) * 3, 150, 60, "Start Game"); //initialize start button
  exitButton = new Button(color(150), width/2, (height/5) * 4, 150, 60, "Exit Game"); //initialize exit button
  contButton = new Button(color(150), width/2, (height/5) * 3, 150, 60, "Continue Game"); //initialize continue button
  
  
  note = new sprite(6, width/2, height/2);
  totTime = 0;
  gameTime = 0;
  justEnded = true;
  
  // Play music 
  minim = new Minim(this);
  player = minim.loadFile("SpringDay.mp3");
  player.play();
  player.loop();
}



void draw() {
  background(255);
  
  //change all buttons to invisible at the beginning of each loop
  startButton.changeVisibility(false);
  exitButton.changeVisibility(false);
  contButton.changeVisibility(false);
  
  //handle game screens
  /*switch (state) {
    
    case gameStart:
      showStart(); //show the start screen with start and exit buttons
      break;
    case gameOn:*/
     runGame();
    //  break;
    /*case gamePause:
      showPause(); //show the pause screen with continue and exit buttons
      break;
    case gameEnd:
      if (justEnded == true) { //show victory or defeat screen based on win/loss
        if(cScore > hiScore){
          hiScore = cScore;
          result = "Victory :D";
        }
        else{
          result = "Defeat :(";
        }
        justEnded = false;
      }
      showEnd(); //show the end screen with start and exit buttons
      break;
 }*/
}



//method for running the game from the beginning
void runGame() {
  
  if(keyPressed == true){
    note.move();
  }
  
  note.run();// display character
  
  //Run Timer
  elapsedSeconds = millis() / 1000; //store milliseconds elapsed as seconds
  timerSeconds = elapsedSeconds - gameSeconds; //seconds displayed in timer as seconds elapsed minus seconds that the game has been running
  rectMode(CORNER);
  stroke(0);
  noFill();
  rect(width-120, 0, 120, 50);
  textAlign(TOP);
  fill(0);
  textSize(13);
  text(("Current Score: "+ str(cScore)), (width-110), 15);
  text(("High Score: "+ str(hiScore)), (width-110), 30);
  text(("Time: "+ nf(30 - timerSeconds, 2)), (width-110), 45);
  //if (timerSeconds >= 30) { //go to end game if 30 seconds are up
  //  state = gameEnd;  
  //}
}



//method for start screen
void showStart() {
  background(240);
  startButton.changeVisibility(true);
  startButton.update();
  exitButton.changeVisibility(true);
  exitButton.update();
  textSize(32);
  fill(0);
  text("Title", width/2, height/5); //display heading title
  textSize(20);
  String instructions = "Use the 'wasd' keys to control the cursor and collect as many emojis as you can in 30 seconds.\nEmojis have different point values.\nPress 'p' to pause the game.\nTry to beat the high score!";
  text(instructions, width/2, height/3, (width/4) * 3, (height/5) * 2); //display game instructions
}

//method for pause screen
void showPause() {
  background(240);
  contButton.changeVisibility(true);
  contButton.update();
  exitButton.changeVisibility(true);
  exitButton.update();
  textSize(32);
  fill(0);
  text("EMOTE Paused", width/2, height/5);
  textSize(20);
  String instructions = "Select an option below.";
  text(instructions, width/2, height/3, (width/3) * 2, (height/5) * 2);
}

//method for end screen
void showEnd() {
  background(240);
  startButton.changeVisibility(true);
  startButton.update();
  exitButton.changeVisibility(true);
  exitButton.update();
  textSize(32);
  fill(0);
  text(result, width/2, height/5);
  textSize(20);
  String score = "High Score: " + hiScore + "\nCurrent Score: " + cScore; //display high score from current round
  text(score, width/2, height/3, (width/3) * 2, (height/5) * 2); 
}


//method to make 'p' mean pause
void gameControls() {
  if (key != CODED) {
    if (key == 'p') { //switch to gamePause if 'p' is pressed
      pauseSeconds = millis() / 1000; //record pause point
      state = gamePause;
    }
    else {
      //nothing
    }
  }
 else {
   //nothing
 }
}