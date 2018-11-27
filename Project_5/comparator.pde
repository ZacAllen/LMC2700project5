// Stores and redraws the grids

float firstHeight = gridHeight/1.5;
float firstWidth = gridWidth/1.5;
float newConstrainX = difficulty/1.5 * Math.round(mouseX/(difficulty/1.5));
float newConstrainY = difficulty/1.5 * Math.round(mouseY/(difficulty/1.5));

int secondHeight;
int secondWidth;
//debugging
boolean compare = false;

PImage savedFirst;
PImage displayFirst;
boolean firstCounter = false;
boolean showPreview = false;

void previewScreen() {
  clear();
  pushStyle();
  background(#ffcecc);
  redrawFirst((width/2 - firstWidth/2), (height/2 - firstHeight/2));
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

void redrawFirst(float startX, float startY) {
  image(displayFirst, startX, startY);
}

void redrawSecond() {

}
