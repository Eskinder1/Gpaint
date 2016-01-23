//Generative Painting Program
//Alex Abebe 2016
// C for color chage
// R record Obj
// Q saves vector 

import nervoussystem.obj.*;
import processing.pdf.*;

//boolean record = false;
float brush=30;
PFont font;
PFont font2;

float theta;
float xoff = 0.0;
float xincrement = 0.01; 
float bgCol = 204;
//Variables
boolean button1=false;
boolean button2=false;
boolean button3=false;
boolean button4=false;
boolean button5=false;

//PrintScreen 
float bX=width/2;
float bY=580;
float bW=100;
float bH=30;

//Rectangle variables
float rX=50;
float rY=50;
float rW=100;
float rH=100;

//Circle variables
float cX=245;
float cY=45;
float cW=110;
float cH=110;

//Triangle variables
float tA=125;
float tB=200;
float tC=150;
float tD=125;

int rotzfactor = 0;


void setup() {
  size(1200, 800, P3D);
  background(bgCol);
  surface.setResizable(true);
  beginRecord("nervoussystem.obj.OBJExport", "filename.obj");
  beginRaw(PDF, "everything-####.pdf");
  // frameRate(5);
  font = loadFont("AgencyFB-Reg-48.vlw");
  font2 = loadFont("AnonymousPro-Bold-35.vlw");
  smooth(2);
  noStroke();
  lights();
}

void draw() {
  textFont(font);

  window();
  instraction();
  //float n = random(0,110);  
  float n = noise(xoff)*500;
  xoff += xincrement++;               // With each cycle, increment xoff
  float rotx = (mouseY/360.0)*-2*PI+PI;
  float roty = (mouseX/420.0)*2*PI-PI;
  float rotz = rotzfactor*PI/36;
  theta = map(mouseX++, 0, width, 0, PI/2);
  if (keyPressed) {
    if (key == 'p' || key == 'P') {
      saveFrame();
    }
  }
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      rotateX(radians(frameCount*2));
    }
    if (keyPressed) {
      if (key == 'c' || key == 'C') {
        fill( random(255), random(255), random(255), random(255));
      }
    }
  }

  //stroke(0);
  //strokeWeight(3);

  if (button1) {                            //button1  Rectangle          
    pushMatrix();
    //fill(9,106,16);
    //noFill();
    translate(mouseX, mouseY);
    rotateY(random(360));
    rotateX(random(0.9));
    box(random(n));
    popMatrix();
  } else if (button4) {
    //fill(255);
  } else {
    //fill(255,13,0);
  }
  rectMode(CENTER);
  // rect(100,100,90,90);


  if (button2) {                         //button2 Ellipse
    pushMatrix();
    //fill(10,48,193);
    translate(mouseX, mouseY);
    lights();
    tint(100, 127);
    sphere(random(200));
    popMatrix();
  } else if (button4) {
    //fill(255);
  } else {
    //fill(9,106,16);
  }
  //ellipse(300,100,100,100);



  if (button3) {                           //button3 Trinagle
    pushMatrix();
    //fill(255,13,0);
    //noFill();
    translate(mouseX, mouseY);
    rotateX(rotx);  
    rotateY(roty);  // rotate drawing coordinates according to user input variables
    rotateZ(rotz);
    triangle((400), (400), random(375), random(125), random(25), random(125));
    popMatrix();
  } else if (button4) {
    //fill(255);
  } else {
    //fill(10,48,193);
  }

  //triangle(200,200,275,325,125,325);

  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      endRecord();
    }
  }
  if (keyPressed) {
    if (key == ']' || key == ']') {
      brush++;
    }
  }
  if (keyPressed) {
    if (key == '[' || key == '[') {
      brush--;
    }
  }
  if (keyPressed) {
    if (key == 'q' || key == 'Q') {
      endRaw();
      exit();
    }
  }
}

void mouseDragged() {
  fill(bgCol);
  ellipse(mouseX, mouseY, brush, brush);
}
void mousePressed() {
  if (keyPressed) {
    if (key == 'x' || key == 'X') {
      fill(10);
      ellipse(mouseX, mouseY, brush/2, brush/2);
    }
  }
}




//Rectangle
void keyPressed() {
  //Change rect color on/off when mouse click inside rect
  if (key=='1') {
    button1=!button1;
  }
  //Change circle color on/off when mouse click inside circle
  if (key=='2') {
    button2=!button2;
  }
  //Change ellipse color on/off when mouse click inside triangle
  if (key=='3') {
    button3=!button3;
  }

  //Change all color when mouse click not inside shapes
  if (mouseX<rX && mouseX>rX+rW && mouseX<cX && mouseX >cX+cW && mouseX<tA && mouseX>tA+tC && mouseY<rY && mouseY>rY+rH && mouseY<cY && mouseY>cY+cH && mouseY<tB && mouseY>tB+tD) {
    button4=!button4;
  }
}