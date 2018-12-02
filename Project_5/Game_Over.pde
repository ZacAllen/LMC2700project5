boolean gameOver = false;

void GameOver(){
  saveSecond(); // saves P4's grid for comparison to the original
  clear();
    background(#ffcecc);
    pushStyle();
    fill(#ffcecc);
    noStroke();
    rect(0, 920, width, height - 920);
    popStyle();
    fill(#FFFFFF);
    fill(#75FF50);
    colorMode(HSB);
   
    fill(color(#ba2644));
    textAlign(CENTER);
    textSize(100);
    if (score >= 999) {
      text("You Win!", width/2, height/11);
    } else {
      text("Game Over", width/2, height/11);
    }
    fill(color(#00bcb5));
    textAlign(CENTER);
    textSize(40);
    text("Difficulty: " + level, width/2, (height/8) + 4);
    text("Final Score: " + Math.round(score), width/2, (height/6) + 2);
    
    
    redrawFirst(width/2 - (gridWidth/2 + 75), height/2 - 300, Math.round(gridWidth/2));
    redrawSecond(width/2 + 75, height/2 - 300, Math.round(gridHeight/2));
    
    String lose = "Oops, looks like time's up! That’s paw-ful. Just kitten! " +
      "\nYou did a great job and made a cool design in the process.\n You should try again. I’m sure you’ll beat your previous score!";
      
    String win = "You win!!! You made a paw-sitively purr-fect copy!\n Try playing again at a higher difficulty!";  
    
    
    fill(255);
    if(score >= 999) {
      textSize(25);
      text(win, width/2, (height/2) - 300 + (gridWidth/2 + 75) - 30);
    } else if (score < 999) {
      textSize(25);
      text(lose, width/2, (height/2) - 300 + (gridWidth/2 + 75) - 30);
    }
 ; }
