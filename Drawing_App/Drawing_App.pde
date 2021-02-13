Pencil pencil;
Shape rect;
Shape ellipse;
PImage drawnCanvas;
PImage undoCanvas;

CommandInvoker cvk;
Command strokeColor;
Command undo;
Command clear;

void setup(){
 size(1250,750); 
 background(255);
 //frameRate(120);
 
 pencil = new Pencil();
 rect = new Rectangle();
 ellipse = new Ellipse();
 int[] rgb = new int[]{0,0,255};
 
 cvk = new CommandInvoker();
 strokeColor = new ColorCommand(rgb);
 undo = new UndoCommand();
 clear = new ClearCommand();
 
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
  
  pencil.paint();
  //rect.paintNumerically(600,200,100,300);
  //ellipse.paintNumerically(600,200,100,300);
  //rect.paint();
  //ellipse.paint(); 
  
}
