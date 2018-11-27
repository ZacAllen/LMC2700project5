import processing.sound.*;
import java.util.ArrayList;
import java.util.Random;
PFont ourFont;


int musicCounter = 0;
int musicCounter2 = 0;
int canvasWidth = 1500;
int canvasHeight = 1000;
int gridWidth = 1000;
int gridHeight = 1000;
int difficulty = 100;
Timer startTimer;
PImage logo;
PImage color1button;
PImage color2button;
PImage color3button;
PImage eraserbutton;
PImage welcomeCat;
boolean modeCopy = false;
float score = 0;
float maxScore = gridWidth;
int filledBlockCount = 0;
float scoreDivision = 0;
boolean erased = false;
boolean playerSelect = false;
int lives = 9;
boolean alive = true;
int oldColor;
int time;

// Variables for welcome screen
int s = second();
int count = 0;
boolean welcomeScreen = true;

//Difficulty select
boolean diffSelect = false;

//Player 4 Screen
boolean p4turn = false;
int p4stopper = 0;

// Stored colors for each player
color player1color = #ba2644;
color player2color = #00bcb5;
color player3color = #b6c399;
color erasercolor = 255;

// For testing purposes
color player4color = #9932CC;

color blockColor = player1color; // Current drawing color 

int player = 1;
int [][] filled; 
int [][] copyFilled;  

SoundFile neko;
SoundFile nekofast;
SoundFile meow1, meow2, meow3;

ArrayList<SoundFile> meows;
Random rand = new Random();

void settings() {
   size(canvasWidth, canvasHeight); 
}

void setup() {
  neko = new SoundFile(this, "NekoAtsume.wav");
  nekofast = new SoundFile(this, "NekoAtsumeFast.wav");
  meow1 = new SoundFile(this, "meow1.wav");
  meow2 = new SoundFile(this, "meow2.wav");
  meow3 = new SoundFile(this, "meow3.wav");
  meows = new ArrayList<SoundFile>();
    meows.add(meow1);
    meows.add(meow2);
    meows.add(meow3);
  background(255);
  logo = loadImage("logo.jpg");
  logo.resize(300, 300);
  ourFont = createFont("Snap ITC", 24);
  textFont(ourFont);
  color1button = loadImage("pink_paw.jpg");
  color1button.resize(100, 100);
  color2button = loadImage("blue_paw.jpg");
  color2button.resize(100, 100);
  color3button = loadImage("green_paw.jpg");
  color3button.resize(100, 100);
  eraserbutton = loadImage("eraser.png");
  eraserbutton.resize(100, 100);
  welcomeCat = loadImage("cat1.jpg");
  welcomeCat.resize(250,250);
}

void draw() {
  if (musicCounter < 1) {
   neko.loop(); 
   musicCounter++;
  }

  if (welcomeScreen) {
    Welcome();
  } 
  //// debugging ONLY /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //else if (compare) {
  //  previewScreen();
  //}
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  else {
  System.out.println("Mouse X: " + mouseX + "Mouse Y: " + mouseY);
    if (diffSelect){
      SelectDifficulty();
    } else if (p4turn) {
        neko.stop(); //run function again so it sees stopMusic
       if (musicCounter2 < 1) {
         nekofast.loop();
         musicCounter2++;  
       }
      saveFirst();
      P4Turn();
    } else if (modeCopy) {
      copyMode();
    } else {
      makerMode();
    }
  }
}

void makerMode(){
  // clears the background only once
  while (count < 1) {
    background(255);
    fill(#ffcecc);
    rect(gridWidth + 1, 0, width - gridWidth, height);
    count++;
    pushStyle();
    textSize(40);
    textAlign(CENTER);
    fill(#4c072c);
    text("Press Space Bar \n To Change Players", 1250, height/2 + 300);
    popStyle();
  }
  
  for (int i = 0; i < gridWidth; i += difficulty) {
      line(i, 0, i, gridHeight);
      line(0, i, gridWidth, i);
  }
    
  line(gridWidth, 0, gridWidth, gridHeight);
  image(logo, 1070, 50);
  textSize(30);
  fill(#ffcecc);
  rect(1040, height/2 , 400, 200);
  pushStyle();
  textSize(65);
  fill(blockColor);
  textAlign(CENTER);
  text("Player " + player + "'s \n Turn!", 1250, height/2 + 70);
  popStyle();
  
  int mouseConstrainX = difficulty * Math.round(mouseX/difficulty);
  int mouseConstrainY = difficulty * Math.round(mouseY/difficulty);
  
  //control if spot has already been filled
  try {
    if (mousePressed && filled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] == 0 ) {
      fill(blockColor);
      rect(mouseConstrainX, mouseConstrainY, difficulty, difficulty);
      filled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] = player;
    }
  } catch (Exception e) {
    // Prevents the game from crashing if clicked outside window
    System.out.println("Array is out of bounds");
  }
  
  if (transitions) {
    transitionsBox();
  }
}

//this is a mode for player 4.
void copyMode() {
  if (!P4begin) {
    if (showPreview) {
      previewScreen();
    } else {
      P4Turn();
    }
  } else {
  if (!erased) { 
   background(255);
   fill(#ffcecc);
   rect(gridWidth + 1, 0, width - gridWidth, height);
   erased = true;
   playerSelect = true;
  }
  if (playerSelect) {
    image(logo, 1070, 50);
    image(color1button, 1100, 400);
    image(color2button, 1100, 550);
    image(color3button, 1250, 400);
    image(eraserbutton, 1250, 550);
    pushStyle();
    textAlign(LEFT);
    fill(#ffcecc);
    rect(1040, 830, 400, 100);
    rect(1040, 730, 400, 100);
    rect(1040, 660, 400, 70);
    fill(#4c072c);
    text("Score: " + 0 + " / " + (int)maxScore, 1050, 880);
    text("Lives left: " + 9 + " / 9", 1050, 780);
    textSize(60);
    text("STOP", 1140, 715);
    popStyle();
    
    playerSelect = false;
  }  

  for (int i = 0; i < gridWidth; i += difficulty) {
      line(i, 0, i, gridHeight);
      line(0, i, gridWidth, i);
            
    }
  line(gridWidth, 0, gridWidth, gridHeight);
  startTimer.countDown();
  pushStyle();
  textAlign(LEFT);
  textSize(24);
  fill(#ffcecc);
  rect(1040, 930, 400, 100);
  fill(#4c072c);
  text("Time Left: " + nf(startTimer.getTime(), 0, 2) + " seconds", 1050, 980);
  
  popStyle();
  int mouseConstrainX = difficulty * Math.round(mouseX/difficulty);
  int mouseConstrainY = difficulty * Math.round(mouseY/difficulty);
  
  //control if spot has already been filled
  try {
    if (mousePressed && player > 0 && copyFilled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] == 0 ) {
      fill(blockColor);
      rect(mouseConstrainX, mouseConstrainY, difficulty, difficulty);
      //currently only responing to reds, need to add way to have player 4 change colors
      copyFilled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] = player;
      int X = mouseConstrainX/difficulty;
      int Y = mouseConstrainY/difficulty;
      scoreUpdate(X, Y);
    } 
    else if(mousePressed && player == 0 && alive && copyFilled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] > 0){
      oldColor = copyFilled[mouseConstrainX/difficulty][mouseConstrainY/difficulty];
      fill(blockColor);
      rect(mouseConstrainX, mouseConstrainY, difficulty, difficulty);
      copyFilled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] = player;
      if (player == 0) {
        livesUpdate();
      }
      int X = mouseConstrainX/difficulty;
      int Y = mouseConstrainY/difficulty;
      scoreUpdateEraser(X, Y, oldColor);
    }
  } catch (Exception e){
    // Prevents the game from crashing if clicked outside window
    System.out.println("Array is out of bounds");
  }
  }
}

void livesUpdate(){
  lives--;
  pushStyle();
  textAlign(LEFT);
  fill(#ffcecc);
  rect(1040, 730, 400, 100);
  fill(#4c072c);
  text("Lives left: " + lives + " / 9", 1050, 780);
  popStyle();
  if (lives <= 0) {
    alive = false;
  }
}

void scoreUpdate(int x, int y){
  //if colors are the same
  if (copyFilled[x][y] == filled[x][y]) {
      score += scoreDivision;
    }
    //if they put a color where where should only be white space
  if ((copyFilled[x][y] != 0) && (filled[x][y]== 0))  {
      score -= scoreDivision;
    }
    //if they guess a wrong color but correct position
  if ((copyFilled[x][y] != 0) && (filled[x][y]!= 0) && !(copyFilled[x][y] == filled[x][y])){
    score += scoreDivision/2;
  }
  pushStyle();
  textAlign(LEFT);
  fill(#ffcecc);
  rect(1040, 830, 400, 100);
  fill(#4c072c);
  text("Score: " + (int)score + " / " + (int)maxScore, 1050, 880);
  popStyle();
}

void scoreUpdateEraser(int x, int y, int oldColor) {
  //if the old color was correct
  if (filled[x][y] == oldColor) {
    score -= scoreDivision;
  }
  //if the old color was wrong but placement was right
  if (filled[x][y] != oldColor && filled[x][y] != 0) {
    score -= scoreDivision/2;
  }
  //if the old color and placement was wrong and it was supposed to be white space
  if (filled[x][y] == 0){
    score += scoreDivision;
  }
  pushStyle();
  textAlign(LEFT);
  fill(#ffcecc);
  rect(1040, 830, 400, 100);
  fill(#4c072c);
  text("Score: " + (int)score + " / " + (int)maxScore, 1050, 880);
  popStyle();
}

void keyPressed() {
  //if(key == ' ' && !welcomeScreen && !diffSelect) {
  // debugging
  if (key == 't') {
    if (transitions) {
      transitions = false;
    } else {
      transitions = true;
    }
  }
  
  // debugging ONLY /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (key == ENTER) {
    if (compare) {
      compare = false;
    } else {
      compare = true;
    }
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if(key == ' ') {
    player++;
  }
  
  if (player == 2) {
    blockColor = player2color;
  }
  else if (player == 3) {
    blockColor = player3color;
  }
  else if (player == 4) {
    player = 1;
    blockColor = player1color;
    modeCopy = true;
    for (int i = 0; i < gridWidth/difficulty; i++) {
      for (int j = 0; j < gridHeight/difficulty; j++) {
        if (filled[i][j] != 0) {
          filledBlockCount ++;
        }
      }
    }
    //allow score to increase depending on amount of filled
    scoreDivision = maxScore/filledBlockCount;
  
    while(p4stopper < 1) {
      p4turn = true;
      p4stopper++;
    }
  }
  //}
}

void mouseClicked() {
  // welcome screen button
   if (welcomeScreen && mouseX >= width/2 - 250 && mouseY >= height - 150 
      && mouseX <= width/2 + 250 && mouseY <= height - 70) {
      welcomeScreen = false;
      diffSelect = true;
      int randIndex = rand.nextInt(3);
      meows.get(randIndex).play();
   }
   
   
   // P4 transition screen button
   if (!P4begin && P4SplashScreen && !showPreview && mouseX >= width/2 - 250 && mouseY >= height - 150 
      && mouseX <= width/2 + 250 && mouseY <= height - 70) {
      P4SplashScreen = false;
      showPreview = true;
   }
   if (!P4begin && !P4SplashScreen && showPreview && mouseX >= width/2 - 250 && mouseY >= height - 150 
      && mouseX <= width/2 + 250 && mouseY <= height - 70) {
      P4begin = true;
      int randIndex = rand.nextInt(3);
      meows.get(randIndex).play();
   }
   
   
   // Difficulty screen button
   if (diffSelect && mouseX >= 1100 && mouseY >= 800 
      && mouseX <= 1400 && mouseY <= 900) {
     diffSelect = false; 
     int randIndex = rand.nextInt(3);
     meows.get(randIndex).play();

     diffSelect = false;
     filled = new int[gridWidth/difficulty][gridHeight/difficulty];
     copyFilled = new int[gridWidth/difficulty][gridHeight/difficulty];
   }
   
   //if (p4turn && !showPreview && mouseX >= 500 && mouseX <= 1000
   //  && mouseY >= 800 && mouseY <= 900) {
   //  showPreview = true;
   //}

   if (p4turn /*&& showPreview*/&& mouseX >= 500 && mouseX <= 1000
     && mouseY >= 800 && mouseY <= 900) {
     p4turn = false; 
   }
   
   if (P4begin && mouseX >= 1040 && mouseX <= 1440
     && mouseY >= 660 && mouseY <= 730) {
       GameOver();
       startTimer.setTime(0.00);
       int randIndex = rand.nextInt(3);
       meows.get(randIndex).play();
    }

   
   
   
   // P4's color select buttons
   if (mouseX >= 1100 && mouseY >= 400 
     && mouseX <= 1200 && mouseY <= 500) {
    player = 1;
    blockColor = player1color;
   }
   else if (mouseX >= 1100 && mouseY >= 550 
     && mouseX <= 1200 && mouseY <= 650) {
     player = 2;
     blockColor = player2color;
   }
   else if (mouseX >= 1250 && mouseY >= 400
     && mouseX <= 1350 && mouseY <= 500) {
       player = 3;
       blockColor = player3color;
   }
   else if (mouseX >= 1250 && mouseY >= 550
     && mouseX <= 1350 && mouseY <= 650) {
       if (alive) {
         player = 0;
         blockColor = erasercolor;
       }
   }
}
