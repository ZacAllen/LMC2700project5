boolean selected = false;
int barWidth = 0;
color barColor = #ba2644;
String level = "Default";


void SelectDifficulty() {
    clear();
    background(#00bcb5);
    
    fill(225);
    textAlign(CENTER);
    textSize(80);
    text("Choose your difficulty!", width/2, height/4);
    System.out.println(difficulty);
    
    textAlign(CENTER);
    textSize(20);
    text("House\nCat", 350, 500);
    text("16 Squares", 350, 700);
    
    textAlign(CENTER);
    textSize(20);
    text("Bobcat", 550, 500);
    text("25 Squares", 550, 700);
    
    textAlign(CENTER);
    textSize(20);
    text("Lion", 750, 500);
    text("64 Squares", 750, 700);
    
    textAlign(CENTER);
    textSize(20);
    text("Sabertooth\nTiger", 950, 500);
    text("100 Squares", 950, 700);
    
    textAlign(CENTER);
    textSize(20);
    text("ImPAWsible", 1150, 500);
    text("400 Squares", 1150, 700);
    
    fill(barColor);
    //Probably replace with an actual image later
    rect(1100, 800, 400, 100);
    pushMatrix();
    fill(255);
    textSize(50);
    text("PLAY GAME", 1300, 870);
    popMatrix();
    

    //Keeps bar filled after releasing mouse
    if (!selected) {
    noFill();
    stroke(10);
    rect(250, 600, 1000, 10, 7);
    } else {
      noFill();
      stroke(10);
      rect(250, 600, 1000, 10, 7);
      fill(barColor);
      rect(250, 600, barWidth, 9, 7);
    }
    
    //Fills slider depending on mouse position
    if (mousePressed && mouseX >= 250 && mouseX <= 450
      && mouseY >= 500 && mouseY <= 800) { //House Cat
      selected = true;
      difficulty = 250;
      barWidth = 200;
      fill(barColor);
      rect(250, 600, barWidth, 9, 7);
      level = "House Cat";
      time = 20;
    }
    if (mousePressed && mouseX >= 450 && mouseX <= 650
      && mouseY >= 500 && mouseY <= 800) { //Bobcat
      selected = true;
      barWidth = 400;
      difficulty = 200; 
      fill(barColor);
      rect(250, 600, barWidth, 9, 7);
      level = "Bobcat";
      time = 30;
    }    
    if (mousePressed && mouseX >= 650 && mouseX <= 850
      && mouseY >= 500 && mouseY <= 800) { //Lion
      selected = true;
      difficulty = 125;
      barWidth = 600;
      fill(barColor);
      rect(250, 600, barWidth, 9, 7);
      level = "Lion";
      time = 40;
    } 
    if (mousePressed && mouseX >= 850 && mouseX <= 1050
      && mouseY >= 500 && mouseY <= 800) { //Sabretooth Tiger
      selected = true;
      difficulty = 100;
      barWidth = 800;
      fill(barColor);
      rect(250, 600, barWidth, 9, 7);
      level = "Sabretooth Tiger";
      time = 50;
    }     
    if (mousePressed && mouseX >= 1050 && mouseX <= 1250
      && mouseY >= 500 && mouseY <= 800) { //ImPAWsible
      selected = true;
      difficulty = 50;
      barWidth = 1000;
      fill(barColor);
      rect(250, 600, barWidth, 9, 7);
      level = "ImPAWsible";
      time = 60;
    }
    startTimer = new Timer(time);
}
