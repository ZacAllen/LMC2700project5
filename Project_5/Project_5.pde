PFont ourFont;
import java.util.ArrayList;

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
boolean modeCopy = false;
float score = 0;
float maxScore = gridWidth;
int filledBlockCount = 0;
float scoreDivision = 0;
boolean erased = false;
boolean playerSelect = false;

// Variables for welcome screen
int s = second();
int count = 0;
boolean welcomeScreen = true;

//Difficulty select
boolean diffSelect = false;

// Stored colors for each player
color player1color = #ba2644;
color player2color = #00bcb5;
color player3color = #b6c399;

// For testing purposes
color player4color = #9932CC;

color blockColor = player1color; // Current drawing color 

int player = 1;
int [][] filled; 
int [][] copyFilled;  


void settings() {
   size(canvasWidth, canvasHeight); 
}

void setup() {
  background(255);
  startTimer = new Timer(120);
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
}

void draw() {
  if (welcomeScreen) {
    Welcome();
  } else {
  System.out.println("Mouse X: " + mouseX + "Mouse Y: " + mouseY);
    if (diffSelect){
      SelectDifficulty();
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
    count++;
  }
  
  for (int i = 0; i < gridWidth; i += difficulty) {
      line(i, 0, i, gridHeight);
      line(0, i, gridWidth, i);
    }
    
  line(gridWidth, 0, gridWidth, gridHeight);
  image(logo, 1100, 50);
  textSize(30);
  fill(255);
  rect(1040, 930, 400, 100);
  fill(0);
  
  int mouseConstrainX = difficulty * Math.round(mouseX/difficulty);
  int mouseConstrainY = difficulty * Math.round(mouseY/difficulty);
  
  //control if spot has already been filled
  try {
  if (mousePressed && filled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] == 0 ) {
    fill(blockColor);
    rect(mouseConstrainX, mouseConstrainY, difficulty, difficulty);
    filled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] = player;
    
    //perhaps later with the 4th player we can compare their array to this array and calculate points based on that
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
    P4Turn();
  } else {
  if (!erased) { 
   background(255);
   erased = true;
   playerSelect = true;
  }
  if (playerSelect) {
    image(color1button, 1100, 400);
    image(color2button, 1100, 550);
    image(color3button, 1100, 700); 
    playerSelect = false;
  }  

  for (int i = 0; i < gridWidth; i += difficulty) {
      line(i, 0, i, gridHeight);
      line(0, i, gridWidth, i);
            
    }
  line(gridWidth, 0, gridWidth, gridHeight);
  image(logo, 1100, 50);
  startTimer.countDown();
  textSize(24);
  fill(255);
  rect(1040, 930, 400, 100);
  fill(#4c072c);
  text("Time Left: " + nf(startTimer.getTime(), 0, 2) + " seconds", 1240, 980);
  
  int mouseConstrainX = difficulty * Math.round(mouseX/difficulty);
  int mouseConstrainY = difficulty * Math.round(mouseY/difficulty);
  
  //control if spot has already been filled
  try {
  if (mousePressed && copyFilled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] == 0 ) {
    fill(blockColor);
    rect(mouseConstrainX, mouseConstrainY, difficulty, difficulty);
    //currently only responing to reds, need to add way to have player 4 change colors
    copyFilled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] = player;
    int X = mouseConstrainX/difficulty;
    int Y = mouseConstrainY/difficulty;
    scoreUpdate(X, Y);
  }
  } catch (Exception e){
    // Prevents the game from crashing if clicked outside window
    System.out.println("Array is out of bounds");
  }
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
  fill(255);
  rect(1040, 830, 400, 100);
  fill(#4c072c);
  text("Score: " + (int)score + " / " + (int)maxScore, 1200, 880);
}

void keyPressed() {
  // debugging
  if (key == 't') {
    if (transitions) {
      transitions = false;
    } else {
      transitions = true;
    }
  }

  if(key == ' ') {
    player++;
  }
  if (player == 2) {
    blockColor = player2color;
  }
  else if (player == 3) {
    blockColor = player3color;
  }
  else if (player > 3) {
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
 }
}

void mouseClicked() {
  // welcome screen button
   if (welcomeScreen && mouseX >= width/2 - 250 && mouseY >= height - 150 
      && mouseX <= width/2 + 250 && mouseY <= height - 70) {
      welcomeScreen = false;
      diffSelect = true;
   }
   // P4 transition screen button
   if (!P4begin && P4SplashScreen && mouseX >= width/2 - 250 && mouseY >= height - 150 
      && mouseX <= width/2 + 250 && mouseY <= height - 70) {
      P4begin = true;
   }
   // Difficulty screen button
   if (diffSelect && mouseX >= 1100 && mouseY >= 800 
      && mouseX <= 1400 && mouseY <= 900) {
     diffSelect = false; 
     filled = new int[gridWidth/difficulty][gridHeight/difficulty];
     copyFilled = new int[gridWidth/difficulty][gridHeight/difficulty];
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
   else if (mouseX >= 1100 && mouseY >= 700
     && mouseX <= 1200 && mouseY <= 800) {
       player = 3;
       blockColor = player3color;
   }
}
