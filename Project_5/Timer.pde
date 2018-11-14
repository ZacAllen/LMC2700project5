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
  void countDown(){
<<<<<<< HEAD
    Time -= 1/frameRate;
    if (Time < 0){
      Time = 0.0;
    }
=======
    Time -= frameRate;
>>>>>>> 49aa51e16b17388d7be9e6e3c247b38daf487660
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
