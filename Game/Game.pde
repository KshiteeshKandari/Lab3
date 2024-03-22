import processing.serial.*;
Serial myPort;
//making a string for x values
int[] stringX = {150,250,350,450};
boolean[] bars = {false,false,false,false};
int barsY; 
int numBeats = 9;
PVector [] beats = new PVector[numBeats];

int flow = 3;
int Score = 0;

boolean backButton = false;


void game_setup(){
  rectMode(CENTER);
  
  barsY = height * 4/5;
  
  for(int i = 0; i < numBeats; i++){
    int randIndex = floor(random(4));
    beats[i] = new PVector(stringX[randIndex],floor(random(1,40) * -60));
    //beats[i] = new PVector(10,random(-600,-200));
  }

}

void game_draw(){
  
    if (Score == 50) {
    // Display game won screen
    fill(0);
    rect(300,450,400,200);
    fill(255);
    textSize(46);
    textAlign(CENTER, CENTER);
    text("Game Won!", width/2, height/2);
    return; 
    }
  PImage back;
  PImage background;
  
  
  background = loadImage("game_bg.gif");

  //background(0);
  image(background, 0, 0, width, height);
  
  back = loadImage("back.png");
  image(back,10,10,50,50);
  if (mouseX >10 && mouseX < 60 && mouseY > 10 && mouseY <60) {
     if (mousePressed) {
        backButton = true;  // Set the imageClicked variable to true
      }
  }
  if (backButton){tab = "home";}
  backButton= false;
  
  stroke(255);
  
  
  //draw lines for the game
  for( int i = 0; i < stringX.length; i ++){
    line(stringX[i],0,stringX[i],height);
  
  }
  
  //draw the beats
  fill(#8809B7);
  for (int i = 0 ; i< beats.length; i++){
    ellipse(beats[i].x, beats[i].y,30,30);
    beats[i].y += flow;
    if(beats[i].y > height + 15){resetBeat(i);}
  }
  
  //draw bars for the game
  for(int i = 0; i < bars.length; i++){
    if(bars[i]){fill(0);}else{fill(255);}
    rect(stringX[i], barsY,40,40);
  }
  
  //checking the bars hit the beat or not
  
  for (int i = 0; i < beats.length; i++){
    for (int j = 0; j < bars.length; j++){
      if( bars[j] && stringX[j] == beats[i].x && beats[i].y > barsY - 30 && beats[i].y < barsY + 30){
        resetBeat(i);
        Score+=1;
      }
    }
  }
  fill(0);
  text(Score,500,500);
  
}



// do it with key pressed for now
//void keyPressed(){
//  if (key == 'h'){bars[0] = true;}
//  if (key == 'j'){bars[1] = true;}
//  if (key == 'k'){bars[2] = true;}
//  if (key == 'l'){bars[3] = true;}
//}

//void keyReleased(){
//  if (key == 'h'){bars[0] = false;}
//  if (key == 'j'){bars[1] = false;}
//  if (key == 'k'){bars[2] = false;}
//  if (key == 'l'){bars[3] = false;}
//}

// ----------------------------- using serial port input
void serialEvent(Serial myPort) {
  String tempVal = myPort.readStringUntil('\n');
  if (tempVal != null) {
    tempVal = trim(tempVal);
    int direction = Integer.parseInt(tempVal);
    switch (direction) {
    case 5:  // yellow
      if (bars[0] == false){
        bars[0] = true;
      }
      else {
      bars[0] = false;
      }
      break;
    case 6:  // green
      if (bars[1] == false){
        bars[1] = true;
      }
      else {
      bars[1] = false;
      }
      break;
    case 7:  // red
      if (bars[2] == false){
        bars[2] = true;
      }
      else {
      bars[2] = false;
      }
      break;
    case 8:  // purple
      if (bars[3] == false){
        bars[3] = true;
      }
      else {
      bars[3] = false;
      }
      break;
    }
  }
}

//-------------------------------
void resetBeat(int index){
   beats[index].x = stringX[floor(random(4))];
   beats[index].y -= 950;
}
