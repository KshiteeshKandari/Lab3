import processing.serial.*;

Serial myPort;

int squareX, squareY;  // Position of the square
int squareSize = 20;   // Size of the square
int circleX, circleY;  // Position of the circle
int circleSize = 10;   // Size of the circle
boolean circleCollected = false;  // Whether the circle is collected or not
int count = 0;


void setup() {
  size(400, 400);

  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');

  squareX = width / 2;
  squareY = height / 2;

  placeCircle(); // placed at a random location
}

void draw() {
  background(255);

  // Draw square
  fill(0, 0, 255);
  rectMode(CENTER);
  rect(squareX, squareY, squareSize, squareSize);

  // Draw circle
  if (!circleCollected) {
    fill(255, 0, 0);
    ellipse(circleX, circleY, circleSize, circleSize);
  }

  // Check collision
  if (dist(squareX, squareY, circleX, circleY) < squareSize / 2 + circleSize / 2 && !circleCollected) {
    circleCollected = true;
    placeCircle();
    count++;
  }
  // Draw score
  textSize(15);
  fill(0);
  text(count, 30, 30);
}

void serialEvent(Serial myPort) {
  String tempVal = myPort.readStringUntil('\n');
  if (tempVal != null) {
    tempVal = trim(tempVal);
    int direction = Integer.parseInt(tempVal);
    switch (direction) {
    case 5:  // up - yellow
      squareY -= 5;
      break;
    case 6:  // down - green
      squareY += 5;
      break;
    case 7:  // left - red
      squareX -= 5;
      break;
    case 8:  // right - purple
      squareX += 5;
      break;
    }
  }
}

void placeCircle() { // place circle at random location inside the area
  circleX = int(random(circleSize, width - circleSize));
  circleY = int(random(circleSize, height - circleSize));
  circleCollected = false;
}
