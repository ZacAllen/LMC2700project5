import java.util.ArrayList;

int canvasWidth = 1500;
int canvasHeight = 1000;
int gridWidth = 1000;
int gridHeight = 1000;
int difficulty = 100;

// Stored colors for each player
color player1color = #CC0000;
color player2color = #0000FF;
color player3color = #77E277;

color blockColor = player1color; // Current drawing color 

int player = 1;
int [][] filled = new int[gridWidth/difficulty][gridHeight/difficulty];



void settings() {
   size(canvasWidth, canvasHeight); 
}

void setup() {
  background(255);
}

void draw() {
  for (int i = 0; i < gridWidth; i += difficulty) {
    line(i, 0, i, gridHeight);
    line(0, i, gridWidth, i);
  }
  line(gridWidth, 0, gridWidth, gridHeight);
  
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
  } catch (Exception e){
    // Prevents the game from crashing if clicked outside window
    System.out.println("Array is out of bounds");
  }
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
}
