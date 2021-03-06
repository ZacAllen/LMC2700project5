// This class handles the transitions between player phases

// P4 phase instance variables
boolean P4begin = false;
boolean P4SplashScreen = false;

void P4Turn(){
  clear();
  P4SplashScreen = true;
  pushStyle();
    background(#ffcecc);
    fill(#ba2644);
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
    text("Player 4 Turn", width/2, height/2 - 160);
    fill(color(#ba2644));
    textAlign(CENTER);
    textSize(40);
    text("Time on the clock: " + time + " Seconds ", width/2, height/2 - 100);
    colorMode(RGB);
    textSize(14);
    fill(#46F05B);
    fill(255);
    textSize(24);
    text("Players 1 through 3 have each had their turn. It is now your turn.\n You will have 10 seconds to look at the picture " + 
    "and then\n " + time + " seconds to replicate the image on your own with the three\n colors used. Good luck and go cat-ch that purr-fect" +
    " score", width/2, height/2 + -20);
    
    textSize(36);
    fill(#ba2644);
    text("Click Here to Begin", width/2, height - 100);
    noFill();
    noStroke();
    //stroke(#E6E6FA);
    rect(width/2 - 250, height - 150, 500, 80);
    popStyle();
    peekTimer = new Timer(10);
  }
