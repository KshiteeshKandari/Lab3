
import processing.sound.*;

SoundFile music;
SoundFile music2;
SoundFile music3;


ControlP5 cp5;
float volumeLevel = 20; // Default volume level


void options_setup(){
 
 if (music != null) {
    music.amp(volumeLevel / 100.0);
  }
  
  cp5 = new ControlP5(this);
    //cp5.addToggle("toggleMusic")
    // .setPosition(width-40, 60)
    // .setSize(30, 20)
    // .setLabel("Music Enabled")
    // .setValue(musicEnabled);
     
      cp5.addSlider("volume")
     .setPosition(width-140, 20)
     .setRange(20, 100)
     .setValue(volumeLevel)
     .setLabel("Volume")
     .setColorBackground(color(#3116D6))
     .setColorForeground(color(#C816D6))
     .setColorActive(color(#3EE370));
     
     cp5.addButton("playMusic1")
     .setPosition(width-140, 60)
     .setSize(100, 30)
     .setLabel("Music-1");
     
     cp5.addButton("playMusic2")
     .setPosition(width-140, 100)
     .setSize(100, 30)
     .setLabel("Music-2");
     
     cp5.addButton("playMusic3")
     .setPosition(width-140, 140)
     .setSize(100, 30)
     .setLabel("Music-3");
     
    
}

void options_draw(){

  

 
     
     
  background(50);
  
  
  
  PImage back;
  boolean backButton = false;
  back = loadImage("back.png");
  image(back,10,10,50,50);
  if (mouseX >10 && mouseX < 60 && mouseY > 10 && mouseY <60) {
     if (mousePressed) {
        backButton = true;  // Set the imageClicked variable to true
      }
  }
  if (backButton){tab = "home";}
  backButton= false;
  
  
  fill(255);
  text("Volume: " + int(cp5.getController("volume").getValue()), 200, 65);
}

void volume(float vol) {
  // Update music volume based on the slider value
  volumeLevel = vol;
  if (music != null) {
    float volume = vol / 100.0; // Convert slider value to a percentage (0.0 to 1.0)
    music.amp(volume);
    music2.amp(volume);
    music3.amp(volume);
  }
}
//void toggleMusic(boolean enabled) {
//  musicEnabled = enabled;
//  if (enabled && music!= null) {
//    println("Music enabled");
//    if (!music.isPlaying()) {
//      music.play(); // Start playing the music if music is enabled and not already playing
//    }
//  } else {
//    println("Music disabled");
//    if (music != null && music.isPlaying()) {
//      music.stop(); // Stop playing the music if music is disabled or already playing
//    }
//  }
//}


void playMusic1() {
  if (music != null && !music.isPlaying()) {
    music.play();
    if (music2 != null && music2.isPlaying()) {
      music2.stop();
    }
    if (music3 != null && music3.isPlaying()) {
      music3.stop();
    }
  }
}

void playMusic2() {
  if (music2 != null && !music2.isPlaying()) {
    music2.play();
    if (music != null && music.isPlaying()) {
      music.stop();
    }
    if (music3 != null && music3.isPlaying()) {
      music3.stop();
    }
  }
}

void playMusic3() {
  if (music3 != null && !music3.isPlaying()) {
    music3.play();
    if (music != null && music.isPlaying()) {
      music.stop();
    }
    if (music2 != null && music2.isPlaying()) {
      music2.stop();
    }
  }
}
