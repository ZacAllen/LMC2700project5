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
    savedFirst = get(0,0, gridWidth, gridHeight);
    savedFirst.save("savedFirst.jpg");
    displayFirst = loadImage("savedFirst.jpg");
    displayFirst.resize(Math.round(firstHeight), Math.round(firstWidth));
    firstCounter = true;
  }
}

void redrawFirst(float startX, float startY) {
  image(displayFirst, startX, startY);
}

//void redrawFirst(float startX, float startY) {
//  for (float i = 0; i <= firstWidth; i += difficulty/1.5) {
//    line(startX + i, startY, startX + i, firstHeight + startY);
//    line(startX, startY + i, firstWidth + startX, startY + i);
//  }
  
//  for (int i = 0; i < filled.length; i++) {
//    int countI = 0;
//    for (int j = 0; j < filled.length; j++) {
//      int countJ = 0;
//      if (filled[i][j] == 0) {
//        pushStyle();
//        fill(erasercolor);
//        rect(startX + (countI * difficulty/1.5), startY + (countJ * difficulty/1.5), difficulty/1.5, difficulty/1.5);
//        popStyle();
//      } else if (filled[i][j] == 1) {
//        pushStyle();
//        fill(player1color);
//        rect(startX + (countI * difficulty/1.5), startY + (countJ * difficulty/1.5), difficulty/1.5, difficulty/1.5);
//        popStyle();
//      } else if (filled[i][j] == 2) {
//        pushStyle();
//        fill(player2color);
//        rect(startX + (countI * difficulty/1.5), startY + (countJ * difficulty/1.5), difficulty/1.5, difficulty/1.5);
//        popStyle();
//      } else if (filled[i][j] == 3) {
//        pushStyle();
//        fill(player3color);
//        rect(startX + (countI * difficulty/1.5), startY + (countJ * difficulty/1.5), difficulty/1.5, difficulty/1.5);
//        popStyle();
//      }
//      countJ++;
//    }
//    countI++;
//  }
  
//  //for (int i = 0; i < filled.length; i++) {
//  //  int countI = 0;
//  //  for (int j = 0; j < filled[i].length; j++) {
//  //    int countJ = 0;
//  //    if (filled[i][j] == 0) {
//  //      pushStyle();
//  //      fill(erasercolor);
//  //      rect(startX + (countI * difficulty/1.5), startY + (countJ * difficulty/1.5), startX + (countI * difficulty/1.5) + difficulty/1.5, startY + (countJ * difficulty/1.5) + difficulty/1.5);
//  //      popStyle();
//  //    } else if (filled[i][j] == 1) {
//  //      pushStyle();
//  //      fill(player1color);
//  //      rect(startX + (countI * difficulty/1.5), startY + (countJ * difficulty/1.5), startX + (countI * difficulty/1.5) + difficulty/1.5, startY + (countJ * difficulty/1.5) + difficulty/1.5);
//  //      popStyle();
//  //    } else if (filled[i][j] == 2) {
//  //      pushStyle();
//  //      fill(player2color);
//  //      rect(startX + (countI * difficulty/1.5), startY + (countJ * difficulty/1.5), startX + (countI * difficulty/1.5) + difficulty/1.5, startY + (countJ * difficulty/1.5) + difficulty/1.5);
//  //      popStyle();
//  //    } else if (filled[i][j] == 3) {
//  //      pushStyle();
//  //      fill(player3color);
//  //      rect(startX + (countI * difficulty/1.5), startY + (countJ * difficulty/1.5), startX + (countI * difficulty/1.5) + difficulty/1.5, startY + (countJ * difficulty/1.5) + difficulty/1.5);
//  //      popStyle();
//  //    }
//  //    countJ++;
//  //  }
//  //  countI++;
//  //}
  
//  //for (int i = 0; i < filled.length; i++) {
//  //  for (int j = 0; j < filled[i].length; j++) {
//  //    if (filled[i][j] == 0) {
//  //      pushStyle();
//  //      fill(erasercolor);
//  //      rect(newConstrainX, newConstrainY, difficulty/1.5, difficulty/1.5);
//  //      popStyle();
//  //    } else if (filled[i][j] == 1) {
//  //      pushStyle();
//  //      fill(player1color);
//  //      rect(newConstrainX, newConstrainY, difficulty/1.5, difficulty/1.5);
//  //      popStyle();
//  //    } else if (filled[i][j] == 2) {
//  //      pushStyle();
//  //      fill(player2color);
//  //      rect(newConstrainX, newConstrainY, difficulty/1.5, difficulty/1.5);
//  //      popStyle();
//  //    } else if (filled[i][j] == 3) {
//  //      pushStyle();
//  //      fill(player3color);
//  //      rect(newConstrainX, newConstrainY, difficulty/1.5, difficulty/1.5);
//  //      popStyle();
//  //    }
//  //  }
//  //}
//}

void redrawSecond() {

}
