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

void setup(){
 size(1250,750); 
 background(255,255,255);
 //rectMode(CENTER);
 //frameRate(120);
 
 pencil = new Pencil();
 rect = new RectangleBrush();
 ellipse = new EllipseBrush();
 int[] rgb = new int[]{255,0,0};
 shapes = new ShapeList();
 transformation = new Transformation();
 
 cvk = new CommandInvoker();
 strokeColor = new ColorCommand(rgb);
 undo = new UndoCommand();
 clear = new ClearCommand();
 strokeColor.execute();
}

//This is just how I am manually testing commands
void keyPressed(){
 if(key == CODED){
   if(keyCode == CONTROL){
     undo.execute();
   }
   if(keyCode == SHIFT){
     undo.undo(); 
   }
   if(keyCode == UP){
     clear.execute(); 
   }
   if(keyCode == DOWN){
     clear.undo(); 
   }
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
  //background(255);
  //strokeColor.execute();
  //strokeColor.undo();
  
  //cvk.addCommand(strokeColor);
  //cvk.executeCommand();
  //cvk.undoCommand();
  
  //pencil.paint();
  rect.paintNumerically(600,500,100,300);
  //rect(100,200,100,300);
  //translate(50,50);
  //rotate(PI);
  //rect(100,200,100,300);
  
  //ellipse.paintNumerically(600,500,100,300);
  //rect.paint();
  //ellipse.paint();
  //transformation.translateShape(0,200,"up");
  //transformation.rotateShape(0,45);
  
  //shapes.removeShape(0);
  //Shape t = shapes.getShape(0);
  //t.eraseShape();
  
}
