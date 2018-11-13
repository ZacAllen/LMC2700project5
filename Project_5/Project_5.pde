import java.util.ArrayList;

int canvasWidth = 1000;
int canvasHeight = 1000;
int difficulty = 100;
color blockColor = #CC0000;
int player = 1;
int [][] filled = new int[canvasWidth/difficulty][canvasHeight/difficulty];
Timer startTimer;


void settings() {
   size(canvasWidth, canvasHeight); 
}
void setup() {

  background(255);
  startTimer = new Timer(600);
}
void draw() {
  for (int i = 0; i < canvasWidth; i += difficulty) {
    line(i, 0, i, canvasHeight);
    line(0, i, canvasWidth, i);
  }
  
  startTimer.countDown();
  textSize(30);
  text(startTimer.getTime(), 800, 980);
  
  int mouseConstrainX = difficulty * Math.round(mouseX/difficulty);
  int mouseConstrainY = difficulty * Math.round(mouseY/difficulty);
  
  //control if spot has already been filled
  if (mousePressed && filled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] == 0 ) {
    fill(blockColor);
    rect(mouseConstrainX, mouseConstrainY, difficulty, difficulty);
    filled[mouseConstrainX/difficulty][mouseConstrainY/difficulty] = player;
    //perhaps later with the 4th player we can compare their array to this array and calculate points based on that
  }
}

void keyPressed() {
  if(key == ' ');
  player++;
  if (player == 2) {
    blockColor = #0000FF;
  }
  else if (player == 3) {
    blockColor = #77E277;
  }
}
