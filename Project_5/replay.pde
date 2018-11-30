void replay() {

  // instance vars from Project5
  musicCounter = 0;
  musicCounter2 = 0;
  canvasWidth = 1500;
  canvasHeight = 1000;
  gridWidth = 1000;
  gridHeight = 1000;
  difficulty = 100;

  modeCopy = false;
  score = 0;
  maxScore = gridWidth;
  filledBlockCount = 0;
  scoreDivision = 0;
  erased = false;
  playerSelect = false;
  lives = 9;
  alive = true;

  s = second();
  count = 0;
  welcomeScreen = true;

  diffSelect = false;

  p4turn = false;
  p4stopper = 0;

  blockColor = player1color;

  player = 1;
  filled = null;
  copyFilled = null;
  background(255);



  // instance vars from selectDifficulty

  selected = false;
  barWidth = 0;
  barColor = #ba2644;
  level = "Default";



  // instance vars from comparator
  firstHeight = gridHeight/1.5;
  firstWidth = gridWidth/1.5;

  compare = false;

  firstCounter = false;
  showPreview = false;
  secondCounter = false;
  showFinalComparison = false;



  // instance vars from transitions
  P4begin = false;
  P4SplashScreen = false;
  
  
  // instance vars from Game_Over
  gameOver = false;
}
