void setup() {
  size(500, 500);
}

int countEllipse = 0;
int countX1 = 0;
int countX1aux = 0;
int countDrop1 = 0;
int countDrop2 = -250;
int countDrop3 = -500;
float[] positions = new float[20];

void draw() {

  background(255);

  int colorRectX = mouseX;
  int colorRectY = mouseY;
  int colorEllipse;

  //controling ellipse color
  if (countEllipse<50)
    colorEllipse = 250;
  else
    colorEllipse = 0;

  if (countEllipse==100)
    countEllipse = 0;


  //drawing rows
  for (int i=0; i<4; i++) {


    tree(-32+countX1, 15+190*i, colorRectX, colorRectY, colorEllipse);
    star(-158+countX1, -15+190*i, colorRectX, colorRectY);
    heart(-10+countX1, -130+190*i, colorRectX, colorRectY);
    tree(253+countX1, 15+190*i, colorRectX, colorRectY, colorEllipse);
    star(127+countX1, -15+190*i, colorRectX, colorRectY);
    heart(275+countX1, -130+190*i, colorRectX, colorRectY);

    tree(-32-countX1, 110+190*i, colorRectY, colorRectX, colorEllipse);
    star(-158-countX1, 80+190*i, colorRectX, colorRectY);
    heart(-10-countX1, -35+190*i, colorRectY, colorRectX);
    tree(253-countX1, 110+190*i, colorRectY, colorRectX, colorEllipse);
    star(127-countX1, 80+190*i, colorRectY, colorRectX);
    heart(275-countX1, -35+190*i, colorRectY, colorRectX);
  }

  //controling movements
  if (countX1aux<=200)
    countX1++;
  if (countX1aux>200)
    countX1--;
  if (countX1aux==400)
    countX1aux = 0;

  //drawing drops
  if (countDrop1==500)
    countDrop1 = -250;

  if (countDrop2==500)
    countDrop2 = -250;

  if (countDrop3==500)
    countDrop3 = -499;

  if (countDrop3 == -500) {
    for (int i = 0; i<20; i++) {      
      positions[i] = (int)random(0, 10)*40+40;
    }
  }

  for (int i=0; i<8; i++)
    drop(positions[i], countDrop1+i*20);
  for (int i=8; i>=0; i--)
    drop(positions[i], countDrop2+i*20);
  for (int i=10; i<19; i++)
    drop(positions[i], countDrop3+i*20);

  //incrementing variables
  countDrop1++;
  countDrop2++;
  countDrop3++;
  countEllipse++;
  countX1aux++;
}

void star(int x, int y, int colorRectX, int colorRectY) {

  stroke(0);
  fill(colorRectX, 190, colorRectY);
  rect(x+253, y+15, 95, 95);
  fill(#E5D117);
  beginShape();
  vertex(x+300, y+20);
  vertex(x+315, y+50);
  vertex(x+345, y+50);
  vertex(x+320, y+65);
  vertex(x+328, y+90);
  vertex(x+300, y+70);
  vertex(x+274, y+92);
  vertex(x+280, y+65);
  vertex(x+255, y+50);
  vertex(x+285, y+50);
  vertex(x+300, y+20);
  endShape();
}

void drop(float x, int yDrop) {

  stroke(0);
  fill(255);
  beginShape();
  vertex(x, yDrop);
  bezierVertex(x-30, -30+yDrop, x+30, -30+yDrop, x, yDrop);
  endShape();
}

void tree(int x, int y, int colorRectX, int colorRectY, int colorEllipse) {

  stroke(0);
  fill(190, colorRectY, colorRectX);
  rect(x+32, y-15, 95, 95);
  fill(colorEllipse, 0, 0);
  ellipse(x+79, y-3, 8, 8);
  noStroke();
  fill(#0D9017);
  for (int i=0; i<5; i++)
    triangle(50+3*i+x, 50-9*i+y, 110-3*i+x, 50-9*i+y, 80+x, y);
  stroke(0);
  line(x+80, 50+y, x+80, 70+y);
}

void heart(int x, int y, int colorRectX, int colorRectY) {

  stroke(0);
  fill(colorRectX, colorRectY, 190);
  rect(x+200, y+130, 95, 95);
  noStroke();
  fill(255, 0, 0);
  beginShape();
  curveVertex(x+250, y+250);
  curveVertex(x+290, y+170);
  curveVertex(x+260, y+155);
  curveVertex(x+250, y+170);
  curveVertex(x+240, y+155);
  curveVertex(x+210, y+170);
  curveVertex(x+250, y+250);
  endShape();
  triangle(x+250, y+200, x+290, y+170, x+210, y+170);
}

