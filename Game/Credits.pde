PFont creditsFont; // Font for the credits text
int fontSize = 30; // Font size
int lineHeight = 40; // Line height between each credit
int yPos; // Y position for drawing the credits
String[] credits = {
  "Directed by: Ash",
  "Produced by: BME/CS 479",
  "Written by: Tyler",
  "Cinematography by: Ash",
  "Music by: Keshi",
  "Edited by: Pranav",
  "Chief Developer and Visual Arts Manager: Ash",
  "Game Design by: Ash",
  "Lead Programmer: Ash",
  "Production Design by: Tyler",
  "Costume Design by: Paranav",
  "Visual Effects by: Tyler",
  "Sound Design by: Ash",
  "Starring:",
  " - Ash",
  " - Paranav",
  " - Tyler",
  "Special Thanks to:",
  " - Family and Friends",
  " - Supporters",
  " - Fans"
};


void credit_setup() {
  creditsFont = createFont("Arial", fontSize); // Load the font
  textAlign(CENTER); // Center align the text
  yPos = height + fontSize; // Start drawing credits below the screen
}


void credit_draw() {
  PImage back;
    background(0); // Black background
  back = loadImage("back.png");
  image(back,10,10,50,50);
  if (mouseX >10 && mouseX < 60 && mouseY > 10 && mouseY <60) {
     if (mousePressed) {
        backButton = true;  // Set the imageClicked variable to true
      }
  }
  if (backButton){tab = "home";}
  backButton= false;
  
  creditsFont = createFont("credits.ttf",34);
  textFont(creditsFont);

  
  fill(255); // White text color
  textFont(creditsFont); // Set the font
  for (int i = 0; i < credits.length; i++) {
    text(credits[i], width/2, yPos + i * lineHeight); // Draw each credit line by line
  }
  
  yPos -= 1; // Move the credits upwards
  if (yPos < -credits.length * lineHeight) {
    yPos = height + fontSize; // Reset yPos when all credits have scrolled up
  }
}
