class Timer{ 
  float Time;
  float Min;
  float Sec;
  
  //constructor
  Timer(float set){
    Time = set;
  }
  
 //returns current time
  float getTime(){
    return(Time);
  }
  
  //set the timer to whatever you input (sec)
  void setTime(float set) {
    Time = set;
  }
  
  //update timer by counting down
  void countDown() {
    Time -= 1/frameRate;
    if (Time < 0){
      Time = 0.0;
    }
  }
  
  float getMin(float set){
    Min = set / 60;
    return(Min);
  }
  
  float getSec(float set){
    Sec = set % 60;
    return(Sec);
  }
  
  String timeFormatted(){
    return(Min + ":" + Sec);  }
}
