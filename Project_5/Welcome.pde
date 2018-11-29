void Welcome(){
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
    image(welcomeCat, width/2 - 125, height/2 - 320);
    textSize(100);
    text("CopyCat", width/2, height/2 - 350);
    colorMode(RGB);
    textSize(14);
    fill(#46F05B);
    fill(255);
    textSize(24);
    pushStyle();
    fill(0);
    text("Hello, welcome to CopyCat. My name is Catpernicus, and I'm \npaw-sitively excited to have you join me today to play this \npawe-some game." + 
    "I have a good feline about this. We’re going \nto play a game called CopyCat and here are the rules.\n\n First, Player 1 will paint a certain amount of " +
    "squares red on a grid.\n Next, Player 2 will have a turn to paint some squares blue. \nThen Player 3 will do the same with green.\n" + "The goal of this is to have the first three players work together create a design on the grid."
    + "\nFrom there, Player 4 will have ten seconds to look at the design and then do their\n best to make a purr-fect copy. Use the Space Bar to switch turns!", width/2, height/2 + -50);
    
    // Delayed pop-up of start button. Currently waits 2 seconds, we could change that number to be longer if we want
    if (second() > s + 2) {
      textSize(36);
      fill(#4c072c);
      text("Click Here to Begin", width/2, height - 80);
      noFill();
      stroke(#E6E6FA);
      rect(width/2 - 250, height - 120, 500, 80);
    }
    popStyle();
 ; }
