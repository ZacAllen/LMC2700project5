// Stores and redraws the grids

float firstHeight = gridHeight/1.5;
float firstWidth = gridWidth/1.5;

//debugging
boolean compare = false;

PImage savedFirst;
PImage displayFirst;
boolean firstCounter = false;
boolean showPreview = false;

PImage savedSecond;
PImage displaySecond;
boolean secondCounter = false;
boolean showFinalComparison = false;

void previewScreen() {
  clear();
  background(#ffcecc);
  peekTimer.peekCountDown();
  pushStyle();
  textAlign(LEFT);
  textSize(24);
  fill(#ffcecc);
  rect(1040, 930, 400, 100);
  fill(#4c072c);
  text("Time Left: " + nf(peekTimer.getTime(), 0, 2), 1050, 980);
  text(" seconds", 1275, 980);
  redrawFirst((width/2 - firstWidth/2), (height/2 - firstHeight/2), Math.round(firstHeight));
  
  textAlign(CENTER);
  textSize(50);
  fill(player1color);
  text("GET READY!", width/2, 100);
  popStyle();
}

void saveFirst() {
  if (!firstCounter) {
    savedFirst = get(0,0, gridWidth + 1, gridHeight + 1);
    savedFirst.save("savedFirst.jpg");
    displayFirst = loadImage("savedFirst.jpg");
    displayFirst.resize(Math.round(firstHeight), Math.round(firstWidth));
    firstCounter = true;
  }
}

void saveSecond() {
  if (!secondCounter) {
    savedSecond = get(0,0, gridWidth + 1, gridHeight + 1);
    savedSecond.save("savedSecond.jpg");
    displaySecond = loadImage("savedSecond.jpg");
    displaySecond.resize(Math.round(firstHeight), Math.round(firstWidth));
    secondCounter = true;
  }
}

void redrawFirst(float startX, float startY, int resize) {
  displayFirst.resize(resize, resize);
  image(displayFirst, startX, startY);
}

void redrawSecond(float startX, float startY, int resize) {
  displaySecond.resize(resize, resize);
  image(displaySecond, startX, startY);
}
