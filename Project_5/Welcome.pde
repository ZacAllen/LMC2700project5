void Welcome(){
clear();
    background(#E6E6FA);
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
    fill(color(#EE82EE));
    textAlign(CENTER);
    textSize(100);
    text("CopyCat", width/2, height/2 - 160);
    colorMode(RGB);
    textSize(14);
    fill(#46F05B);
    fill(200);
    textSize(24);
    text("Hello, welcome to CopyCat. My name is Catpernicus, and I'm \npawsitively excited to have you join me today to play this \npawe-some game. I have a good feline about this. We’re going \nto play a game called CopyCat and here are the rules. First, Player\n 1 will paint a certain amount of squares red on a grid.\n \nNext, Player 2 will have a turn to paint some squares blue. \nThen Player 3 will do the same with green. From there, Player 4\n will have ten seconds to look at the grid and then do their\n best to make a purrfect copy.", width/2, height/2 + -20)
 ; }
