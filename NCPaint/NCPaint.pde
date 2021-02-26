import controlP5.*;
import processing.sound.*;

SoundFile kidsHelp;
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
ShapeBrush triangle;
ShapeBrush arc;
PImage drawnCanvas;
PImage undoCanvas;
PImage loadCanvas;
ShapeList shapes;
//CoordinateDisplay coords;
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
Command weight;
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

float helpButton;

int cr;
int cg;
int cb;
int[] rgb;
int stk;

String textSet;
int numX;
int numY;
int numW;
int numH;

String[] help;

Boolean saved;
Boolean loaded;
Boolean undone;

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

public void setText(String newString){
  textSet = newString;
}

public void setInt(char n,int num){
 if(n == 'x') numX = num;
 if(n == 'y') numY = num;
 if(n == 'w') numW = num;
 if(n == 'h') numH = num;
}

void keyPressed(){
 if(key == CODED){
   if(keyCode == UP){
     transformation.translateShape(shapes.getSize()-1,0,-20);
   }
   if(keyCode == DOWN){
     transformation.translateShape(shapes.getSize()-1,0,20);
   }
   if(keyCode == LEFT){
     transformation.translateShape(shapes.getSize()-1,-20,0);
   }
   if(keyCode == RIGHT){
     transformation.translateShape(shapes.getSize()-1,20,0);
   }
 }
 if(key == '+' || key == '='){
     transformation.resizeShape(shapes.getSize()-1,10,10);
   }
   if(key == '-'){
     transformation.resizeShape(shapes.getSize()-1,-10,-10);
   }
}

void settings(){
  size(1000,700);

}

void setup(){
 background(255,255,255);
 imageMode(CENTER);
 textAlign(LEFT,TOP);
 saveFrame("drawnCanvas");
 surface.setLocation(0,0);
 noFill();
 stk = 1;
 rgb = new int[]{0,0,0};
 
 kidsHelp = new SoundFile(this,"kidhelpmenu.mp3");
 
 pencil = new Pencil();
 rect = new RectangleBrush();
 ellipse = new EllipseBrush();
 shapes = new ShapeList();
 line = new LineBrush();
 text = new TextBrush();
 triangle = new TriangleBrush();
 arc = new ArcBrush();
 transformation = new Transformation();
 
 activeGroup = new ArrayList<Shape>();
 
 cvk = new CommandInvoker();
 undo = new UndoCommand();
 clear = new ClearCommand();
 save = new SaveCommand();
 load = new LoadCommand();
 
 //coords = new CoordinateDisplay();
 textSetter = new TextSetter();
 textSet = "";
 undone = false;

 
 PImage logo = loadImage("NCPaintLogo.png");
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
  if(isAdult == 1.0){
    fill(255,255,255);
    stroke(255,255,255);
    rect(0,680,100,20);
    fill(0,0,0);
    textSize(13);
    text("X: "+mouseX+"  Y: "+mouseY,0,680);
    fill(255,255,255);
  }
  strokeColor = new ColorCommand(rgb);
  weight = new WeightCommand(stk);
  strokeColor.execute();
  weight.execute();
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
  
  if(rot == 0.1) transformation.rotateShape(shapes.getShapeIndex(shapes.last()), -90);
  if(rot == 0.2) transformation.rotateShape(shapes.getShapeIndex(shapes.last()), 90);
  if(helpButton == 1.0){
    if(isAdult == 1.0){
        launch(dataPath("")+"/AdvancedManual.pdf");
        helpButton = 0.0;
    }
    if(isAdult != 1.0){
     if(!kidsHelp.isPlaying()){
       kidsHelp.play();
       helpButton = 0.0;
     }
    }
  }
  
  if(drawButton == 0.0){
    strokeColor.execute();
    weight.execute();
   pencil.paint(); 
  }
  if(drawButton == 0.1){
   strokeColor.execute();
   weight.execute();
   rect.paint(); 
  }
  if(drawButton == 0.2){
    strokeColor.execute();
    weight.execute();
    ellipse.paint();
  }
  if(drawButton == 0.3){
    strokeColor.execute();
    weight.execute();
   triangle.paint(); 
  }
  if(drawButton == 0.4){
    strokeColor.execute();
    weight.execute();
    arc.paint(); 
  }
  if(drawButton == 0.5){
   strokeColor.execute();
   weight.execute();
   line.paint(); 
  }
  if(drawButton == 0.6){
   textSetter.setText(textSet);
   textSetter.setSize(stk);
   text.paint(); 
  }
  if(drawButton == 0.7){
    transformation.changeFillColor(shapes.getSize()-1,rgb);
  }
  if(drawButton == 0.8){
    strokeColor.execute();
    weight.execute();
    if(numX == 0 && numY == 0 && numW == 0 && numH == 0){
      rect.paintOneClick();
    }
    else rect.paintNumerically(numX,numY,numW,numH);
  }
  if(drawButton == 0.9){
    strokeColor.execute();
    weight.execute();
    if(numX == 0 && numY == 0 && numW == 0 && numH == 0){
      ellipse.paintOneClick();
    }
    else ellipse.paintNumerically(numW,numY,numW,numH);
  }
  if(drawButton == 1.0){
    strokeColor.execute();
    weight.execute();
    line.paintNumerically(numX,numY,numW,numH);
  }
  if(drawButton == 1.1){
   strokeColor.execute();
   weight.execute();
    if(numX == 0 && numY == 0 && numW == 0 && numH == 0){
      triangle.paintOneClick();
    }
   else triangle.paintNumerically(numX,numY,numW,numH); 
  }
  if(drawButton == 1.2){
    pencil.eraser();
  }
  
  if(undoButton == 0.0) undone = false;
  if(undoButton == 1.0 && !undone){
   undo.execute();
   undone = true;
  }
  if(redoButton == 1.0){
   undo.undo();
   clear.undo();
  }
  if(clearButton == 1.0){
   clear.execute(); 
  }
  if(saveButton == 1.0){
    if(!saved){
     fill(255,255,255);
     stroke(255,255,255);
     rect(0,680,100,20);
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
  if(isAdult == 1.0) {
   rgb = new int[]{cr,cg,cb};
  }
  
  if(!lastAction.equals("")){
    for(Shape s : shapes.getList()){
      if(s != null) s.redrawShape(); 
    }
  }
}
