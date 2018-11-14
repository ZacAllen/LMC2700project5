import java.util.ArrayList;

int canvasWidth = 1500;
int canvasHeight = 1000;
int gridWidth = 1000;
int gridHeight = 1000;
int difficulty = 100;
Timer startTimer;
PImage logo;
boolean modeCopy = false;
int score = 0;
boolean erased = false;

// Stored colors for each player
color player1color = #CC0000;
color player2color = #0000FF;
color player3color = #77E277;
//this can be changed, for testing purposes
color player4color = #9932CC;


color blockColor = player1color; // Current drawing color 

int player = 1;
int [][] filled = new int[gridWidth/difficulty][gridHeight/difficulty];
int [][] copyFilled = new int[gridWidth/difficulty][gridHeight/difficulty];



void settings() {
   size(canvasWidth, canvasHeight); 
}

void setup() {
  background(255);
  startTimer = new Timer(120);
  logo = loadImage("logo.jpg");
  logo.resize(300, 300);
}

void draw() {
  if (modeCopy) {
    copyMode();
  } else {
    makerMode();
  }
}

void makerMode(){
  for (int i = 0; i < gridWidth; i += difficulty) {
      line(i, 0, i, gridHeight);
      line(0, i, gridWidth, i);
    }
  line(gridWidth, 0, gridWidth, gridHeight);
  image(logo, 1100, 100);
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
}

//this is a mode for player 4. right now, the new array is called copyFilled and the default fill is 1 so we can check scorer (doesn't have color variations in grid)
void copyMode() {
    if (!erased) { 
    background(255);
    erased = true;
  }

  for (int i = 0; i < gridWidth; i += difficulty) {
      line(i, 0, i, gridHeight);
      line(0, i, gridWidth, i);
    }
  line(gridWidth, 0, gridWidth, gridHeight);
  image(logo, 1100, 100);
  startTimer.countDown();
  textSize(30);
  fill(255);
  rect(1040, 930, 400, 100);
  fill(0);
  text("Time Left: " + nf(startTimer.getTime(), 0, 2) + " seconds", 1050, 980);
  
  int mouseConstrainX = difficulty * Math.round(mouseX/difficulty);
  int mouseConstrainY = difficulty * Math.round(mouseY/difficulty);
  
  //control if spot has already been filled
  try {
  if (mousePressed && copyFilled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] == 0 ) {
    fill(blockColor);
    rect(mouseConstrainX, mouseConstrainY, difficulty, difficulty);
    //currently only responing to reds, need to add way to have player 4 change colors
    copyFilled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] = 1;
    int X = mouseConstrainX/difficulty;
    int Y = mouseConstrainY/difficulty;
    scoreUpdate(X, Y);
    //perhaps later with the 4th player we can compare their array to this array and calculate points based on that
  }
  } catch (Exception e){
    // Prevents the game from crashing if clicked outside window
    System.out.println("Array is out of bounds");
  }
}


void scoreUpdate(int x, int y){
  //if colors are the same
  if (copyFilled[x][y] == filled[x][y]) {
      score += 10;
    }
    //if they put a color where where should only be white space
  if ((copyFilled[x][y] != 0) && (filled[x][y]== 0))  {
      score -= 10;
    }
    //if they guess a wrong color but correct position
  if ((copyFilled[x][y] != 0) && (filled[x][y]!= 0) && !(copyFilled[x][y] == filled[x][y])){
    score +=5;
  }
  fill(255);
  rect(1040, 830, 400, 100);
  fill(0);
  text("Score: " + score, 1050, 880);  
}

void keyPressed() {
  if(key == ' ');
  player++;
  if (player == 2) {
    //blockColor = #0000FF;
    blockColor = player2color;
  }
  else if (player == 3) {
    //blockColor = #77E277;
    blockColor = player3color;
  }
  else if (player > 3) {
    //blockColor = #9932CC;
    blockColor = player4color;
    modeCopy = true;
  }
  
}
