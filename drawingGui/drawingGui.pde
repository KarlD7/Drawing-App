import controlP5.*;

ControlP5 cp5;
PImage logo;
String font;
ControlFrameMenu menu;
ControlFrame kf;
ControlFrame af;
boolean openedWindow;

color main;
color highlight1;
color highlight2;

Button au;
Button su;

Pencil pencil;
ShapeBrush rect;
ShapeBrush ellipse;
PImage drawnCanvas;
PImage undoCanvas;
ShapeList shapes;

CommandInvoker cvk;
Command strokeColor;
Command undo;
Command clear;
Transformation transformation;

String lastAction;

float brush;
float rectBrush;
float ellipseBrush;
float triangleBrush;
float arcBrush;
float lineBrush;

float undoButton;
float redoButton;
float clearButton;

int cr;
int cg;
int cb;

void settings(){
 size(1250,750); 
}

void setup(){
 background(255,255,255);
 //rectMode(CENTER);
 //frameRate(120);
 
 pencil = new Pencil();
 rect = new RectangleBrush();
 ellipse = new EllipseBrush();
 int[] rgb = new int[]{cr,cg,cb};
 shapes = new ShapeList();
 transformation = new Transformation();
 
 cvk = new CommandInvoker();
 strokeColor = new ColorCommand(rgb);
 undo = new UndoCommand();
 clear = new ClearCommand();
 strokeColor.execute();
 
 logo = loadImage("ihoc.png");
 font = "DejaVuSans.ttf";
 menu = new ControlFrameMenu(this,600,350,"Name of Drawing App",logo,createFont(font,20));
}

//This is just how I am manually testing commands
void keyPressed(){
 if(key == CODED){
   if(keyCode == LEFT){
     shapes.iterateShapes();
   }
   if(keyCode == RIGHT){
     //rect.paintNumerically(600,500,100,300);
     //transformation.translateShape(shapes.getSize()-1,50,"up"); 
     //transformation.rotateShape(0,-45);
     //transformation.resizeShape(0,100,10);
   }
   if(keyCode == ALT) println(mouseX, mouseY);
 } 
}

//Currently, just comment and uncomment the methods here to test the classes.
void draw(){
  int[] rgb = new int[]{cr,cg,cb};
  strokeColor = new ColorCommand(rgb);
  strokeColor.execute();
  //background(255);
  //strokeColor.execute();
  //strokeColor.undo();
  
  //cvk.addCommand(strokeColor);
  //cvk.executeCommand();
  //cvk.undoCommand();
  
  //rect.paintNumerically(600,500,100,300);
  //rect(100,200,100,300);
  //translate(50,50);
  //rotate(PI);
  //rect(100,200,100,300);
  
  //ellipse.paintNumerically(600,500,100,300);
  //transformation.translateShape(0,200,"up");
  //transformation.rotateShape(0,45);
  
  //shapes.removeShape(0);
  //Shape t = shapes.getShape(0);
  //t.eraseShape();
  if(brush == 1.0){
   pencil.paint(); 
  }
  if(rectBrush == 1.0){
   rect.paint(); 
  }
  if(ellipseBrush == 1.0){
    ellipse.paint();
  }
  if(triangleBrush == 1.0){
   //triangle.paint(); 
  }
  if(arcBrush == 1.0){
   //arc.paint(); 
  }
  if(lineBrush == 1.0){
   //line.paint(); 
  }
  if(undoButton == 1.0){
   undo.execute(); 
  }
  if(redoButton == 1.0){
   undo.undo();
   clear.undo();
  }
  if(clearButton == 1.0){
   clear.execute(); 
  }
  
}
