PFont h_font;
import controlP5.*;



void home_draw(){

  PImage home;

  h_font = createFont("home.ttf",100);
  textFont(h_font);
  
  
  home = loadImage("home.jpg");
  
  background(home);
  
  fill(0);
  
  drawButton("Play", width/2, height/2 - 100, 200, 60);
  drawButton("Credits", width/2, height/2, 200, 60);
  drawButton("Exit", width/2, height/2 + 100, 200, 60);
}

void drawButton(String label, float x, float y, float w, float h) {
  // Draw button background
  fill(#140F34); // Green color
  rectMode(CENTER);
  rect(x, y, w, h, 10);
  
  // Draw button label
  fill(255);
  textSize(60);
  textAlign(CENTER, CENTER);
  text(label, x, y);
}

void mousePressed() {
  if (tab == "home") {
    home_mousePressed();
  }
}

void home_mousePressed() {
  // Check if the mouse click is within the bounds of each button
  if (mouseX > width/2 - 100 && mouseX < width/2 + 100) {
    if (mouseY > height/2 - 130 && mouseY < height/2 - 70) {
      tab = "game";
    } 
    //Credits Setting
    else if (mouseY > height/2-30 && mouseY < height/2 +30) {
      println("Credits button clicked");
      tab = "credit";
    }
    //Exit the game
    else if (mouseY > height/2 + 70 && mouseY < height/2 + 130) {
      println("Exit button clicked");
      exit();
    }
  }
}
