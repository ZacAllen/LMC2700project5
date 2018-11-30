// Stores and redraws the grids

float firstHeight = gridHeight/1.5;
float firstWidth = gridWidth/1.5;
//float newConstrainX = difficulty/1.5 * Math.round(mouseX/(difficulty/1.5));
//float newConstrainY = difficulty/1.5 * Math.round(mouseY/(difficulty/1.5));

//int secondHeight;
//int secondWidth;

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
  text("Time Left: " + nf(peekTimer.getTime(), 0, 2) + " seconds", 1050, 980);
  redrawFirst((width/2 - firstWidth/2), (height/2 - firstHeight/2));
  popStyle();
}


void finalComparison() {
  
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

void redrawFirst(float startX, float startY) {
  image(displayFirst, startX, startY);
}

void redrawSecond(float startX, float startY) {
  image(displaySecond, startX, startY);
}
