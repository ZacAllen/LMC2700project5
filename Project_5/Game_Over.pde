boolean gameOver = false;

void GameOver(){
  saveSecond(); // saves P4's grid for comparison to the original
  clear();
    background(#ffcecc);
    fill(#FFFFFF);
    fill(#75FF50);
    colorMode(HSB);
    double sin = sin(millis()/1000.0);
    double hue = 0; // from 48 to 0, from 360 to 241

    if (sin > 0) {
      hue = 50.0 * sin;
    } else {
      double modifier = abs((float) (120.0 * sin));
      hue = 360 - modifier;
      hue = 0; 
    }
    fill(color(#ba2644));
    textAlign(CENTER);
    textSize(100);
    text("Game Over", width/2, height/2 - 160);
    fill(color(#00bcb5));
    textAlign(CENTER);
    textSize(40);
    text("Difficulty: " + level, width/2, height/2 - 100);
    text("Final Score: " + Math.round(score), width/2, height/2 - 50);
    
    String lose = "Oops, looks like time's up! That’s paw-ful. Just kitten! " +
      "\nYou did a great job and made a cool design in the process.\n You should try again. I’m sure you’ll beat your previous score!";
      
    String win = "You win!!! You made a paw-sitively purr-fect copy!\n Try playing again at a higher difficulty!";  
    
    
    fill(255);
    if(score >= 999) {
      textSize(25);
      text(win, width/2, height/2 + 20);
    } else if (score < 999) {
      textSize(25);
      text(lose, width/2, height/2 + 20);
    }
 ; }
