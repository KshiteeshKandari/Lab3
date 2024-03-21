String tab = "home";
boolean musicEnabled = true;

void setup(){
  music = new SoundFile(this,"m1.mp3");
  music2 = new SoundFile(this,"m2.mp3");
  music3 = new SoundFile(this,"m3.mp3");
  size(600,900);
  background(0);
  game_setup();
  options_setup();
  credit_setup();
  
 
     
}

void draw(){

  
  if(tab == "game"){
    game_draw();
  }
  else if(tab == "home"){
    home_draw();
  }
  else if(tab == "credit"){
    credit_draw();
  }
   
     
}



 
