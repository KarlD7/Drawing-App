import controlP5.*;

ControlP5 cp5;
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
ShapeBrush line;
ShapeBrush text;
PImage drawnCanvas;
PImage undoCanvas;
PImage loadCanvas;
ShapeList shapes;
CoordinateDisplay coords;
TextSetter textSetter;

Shape activeShape;
ArrayList<Shape> activeGroup;
boolean cleared = false;
Shape lastRemoved;

CommandInvoker cvk;
Command strokeColor;
Command undo;
Command clear;
Command save;
Command load;
Transformation transformation;

String lastAction = "";
boolean loading = false;

float isAdult;

float colorButton;
float drawButton;

float undoButton;
float redoButton;
float clearButton;
float saveAsButton;
float saveButton;
float loadButton;
float rot;

int cr;
int cg;
int cb;
int[] rgb;

String textSet;

Boolean saved;
Boolean loaded;

void fileSelected(File selection){
    if(selection == null){
       println("Cancelled.");
    }
    else{
      println("Selected: " + selection.getAbsolutePath());
      loadCanvas = loadImage(selection.getAbsolutePath());
      loading = true;
    }
}

void folderSelected(File selection){
   if(selection == null){ 
     println("Cancelled.");
   }
   else{
     println("Selected: " + selection.getAbsolutePath());
     drawnCanvas.save(selection.getAbsolutePath());
   }
}

void keyPressed(){
 if(key == CODED){
   if(keyCode == UP){
     transformation.translateShape(activeGroup.size(),0,20);
   }
   if(keyCode == DOWN){
     transformation.translateShape(activeGroup.size(),0,-20);
   }
   if(keyCode == LEFT){
     transformation.translateShape(activeGroup.size(),20,0);
   }
   if(keyCode == RIGHT){
     transformation.translateShape(activeGroup.size(),-20,0);
   }
 }
}

void settings(){
  size(960,540);

}

void setup(){
 background(255,255,255);
 imageMode(CENTER);
 textAlign(LEFT,TOP);
 saveFrame("drawnCanvas");
 surface.setLocation(0,0);
 
 pencil = new Pencil();
 rect = new RectangleBrush();
 ellipse = new EllipseBrush();
 shapes = new ShapeList();
 line = new LineBrush();
 text = new TextBrush();
 transformation = new Transformation();
 
 activeGroup = new ArrayList<Shape>();
 
 cvk = new CommandInvoker();
 undo = new UndoCommand();
 clear = new ClearCommand();
 save = new SaveCommand();
 load = new LoadCommand();
 
 coords = new CoordinateDisplay();
 textSetter = new TextSetter();
 textSet = "";
 
 PImage logo = loadImage("ihoc.png");
 PImage rectImg = loadImage("rec.png");
 PImage triImg = loadImage("tri.png");
 PImage elliImg = loadImage("elli.png");
 PImage arcImg = loadImage("arc.png");
 PImage lineImg = loadImage("line.png");
 PImage rectImg2 = loadImage("recPressed.png");
 PImage triImg2 = loadImage("triPressed.png");
 PImage elliImg2= loadImage("elliPressed.png");
 PImage arcImg2 = loadImage("arcPressed.png");
 PImage lineImg2 = loadImage("linePressed.png");
 PImage rotL = loadImage("rotleft.png");
 PImage rotLP = loadImage("rotleftPressed.png");
 PImage rotR = loadImage("rotright.png");
 PImage rotRP = loadImage("rotrightPressed.png");
 String font = "DejaVuSans.ttf";
 menu = new ControlFrameMenu(this,600,360,"NcPaint",logo,createFont(font,20),rectImg,triImg,elliImg,arcImg,lineImg,rectImg2,triImg2,elliImg2,arcImg2,lineImg2,rotL,rotLP,rotR,rotRP);
}


void draw(){
  if(loadCanvas != null && loading == true){
    imageMode(CORNER);
    image(loadCanvas, 0, 0); 
    imageMode(CENTER);
    int wd = loadCanvas.width;
    int ht = loadCanvas.height;
    Shape i = new Shape(0+wd/2, 0+ht/2, wd, ht, "image", loadCanvas);
    shapes.addShape(i);
    loading = false;
  }
  
  coords.display();
  noFill();
  
  if(rot == 0.1) transformation.rotateShape(shapes.getShapeIndex(shapes.last()), -45);
  if(rot == 0.2) transformation.rotateShape(shapes.getShapeIndex(shapes.last()), 45);
  if(isAdult == 1.0) {
    rgb = new int[]{cr,cg,cb};
  }
  if(drawButton == 0.0){
   pencil.paint(); 
  }
  if(drawButton == 0.1){
   rect.paint(); 
  }
  if(drawButton == 0.2){
    ellipse.paint();
  }
  if(drawButton == 0.3){
   //triangle.paint(); 
  }
  if(drawButton == 0.4){
   //arc.paint(); 
  }
  if(drawButton == 0.5){
   line.paint(); 
  }
  if(drawButton == 0.6){
   textSetter.setText(textSet);
   println(textSet.toString()+"a");
   text.paint(); 
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
  if(saveAsButton == 1.0){
    
  }
  if(saveButton == 1.0){
    if(!saved){
     save.execute();
     saved = true;
    }
  }
  if(saveButton == 0.0) saved = false;
  if(loadButton == 1.0){
    if(!loaded){
     load.execute();
     loaded = true;
    }
  }
  if(loadButton == 0.0) loaded = false;
  
  
  if(isAdult == 0.0){
    if(colorButton == 0.0) rgb = new int[]{0,0,0};
    if(colorButton == 0.1) rgb = new int[]{255,0,0};
    if(colorButton == 0.2) rgb = new int[]{255,155,0};
    if(colorButton == 0.3) rgb = new int[]{200,200,0};
    if(colorButton == 0.4) rgb = new int[]{0,205,0};
    if(colorButton == 0.5) rgb = new int[]{0,0,255};
    if(colorButton == 0.6) rgb = new int[]{205,0,255};
    if(colorButton == 0.7) rgb = new int[]{255,255,255};
  }
  strokeColor = new ColorCommand(rgb);
  strokeColor.execute();
  
}
