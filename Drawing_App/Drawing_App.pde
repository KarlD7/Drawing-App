Pencil pencil;
ShapeBrush rect;
ShapeBrush ellipse;
ShapeBrush line;
ShapeBrush text;
ShapeBrush arc;
ShapeBrush triangle;
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
Command weight;

Transformation transformation;

String lastAction = "";

boolean loading = false;

int rgb[] = {0, 0, 0};


void setup(){
 size(960,540); 
 background(255);
 imageMode(CENTER);
 textAlign(LEFT,TOP);
 saveFrame("drawnCanvas");
 //fill(255);
 
 //rectMode(CENTER);
 //frameRate(120);
 
 coords = new CoordinateDisplay();
 textSetter = new TextSetter();
 
 pencil = new Pencil();
 rect = new RectangleBrush();
 ellipse = new EllipseBrush();
 line = new LineBrush();
 text = new TextBrush();
 arc = new ArcBrush();
 triangle = new TriangleBrush();
 
 rgb = new int[]{255,0,0};
 shapes = new ShapeList();
 transformation = new Transformation();
 
 activeGroup = new ArrayList<Shape>();
 
 cvk = new CommandInvoker();
 strokeColor = new ColorCommand(rgb);
 undo = new UndoCommand();
 clear = new ClearCommand();
 save = new SaveCommand();
 load = new LoadCommand();
 weight = new WeightCommand(10);

 //load.execute();
 
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
     //shapes.iterateShapes();
     println(shapes.getSize());
     /*for(int i = 0; i < shapes.getSize(); i++){
       println(i+1, shapes.getShape(i).type);
     }*/
     //weight.undo();
     //int[] newColor = {0,255,0};
     //transformation.changeFillColor(shapes.getSize()-1, newColor);
   }
   if(keyCode == RIGHT){
     //weight.execute();
     //textSetter.setText("Hello world");
     //text.paint();
     
     //translate(960/2,540/2);
     //scale(5);
     
     //load.execute();
     //rect.paintNumerically(600,500,100,300);
     //shapes.setActiveShape(shapes.last());
     
     //transformation.changeText(shapes.getSize()-1, "debug");
     
     int[] newColor = {0,255,0};
     //transformation.changeColor(shapes.getSize()-1, newColor);
     //transformation.changeFillColor(shapes.getSize()-1, newColor);
     //transformation.clearFill(shapes.getSize()-1);
     //transformation.translateShape(shapes.getSize()-1, 50, 100);
     //transformation.rotateShape(shapes.getShapeIndex(shapes.last()), 45);
     
     //Shapes
     //transformation.resizeShape(shapes.getSize()-1,200,200);
     
     //Text
     //transformation.resizeShape(shapes.getSize()-1, 32);
     
     //shapes.removeShape(0);
     
     //coords.cleanDisplay();
     
     //save.execute();
     //shapes.duplicateList(shapes.getList());
     
     //DEMO - Color
     //transformation.changeColor(shapes.getSize()-1, newColor);
     //transformation.changeFillColor(shapes.getSize()-1, newColor);
     //transformation.clearFill(shapes.getSize()-1);

   if(keyCode == ALT) println(mouseX, mouseY);
   }
 } 
}

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

//Currently, just comment and uncomment the methods here to test the classes.
void draw(){
  coords.display();
  noFill();

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
  
  //arc.paint();
  //triangle.paint();
  
  //DEMO - Color
  //rect.paint();
  //text.paint();
  //line.paint();
  
  //textSetter.setText("Hello world");
  //text.paint();
  
  //background(255);
  //strokeColor.execute();
  //strokeColor.undo();
  
  //cvk.addCommand(strokeColor);
  //cvk.executeCommand();
  //cvk.undoCommand();
  
  pencil.paint();
  //rect.paintNumerically(600,500,100,300);
  //rect(100,200,100,300);
  //translate(50,50);
  //rotate(PI);
  //rect(100,200,100,300);
  
  //rect.paintOneClick();
  //ellipse.paintOneClick();
  
  //ellipse.paintNumerically(600,500,100,300);
  //rect.paint();
  //ellipse.paint();
  //line.paint();
  //line.paintNumerically(600,500,700,700);
  //transformation.translateShape(0,200,"up");
  //transformation.rotateShape(0,45);
  
  //shapes.removeShape(0);
  //Shape t = shapes.getShape(0);
  //t.eraseShape();
  
  if(!lastAction.equals("")){
    for(Shape s : shapes.getList()){
      if(s != null) s.redrawShape(); 
    }
  }
  
}
