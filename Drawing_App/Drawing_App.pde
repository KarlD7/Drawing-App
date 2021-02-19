Pencil pencil;
ShapeBrush rect;
ShapeBrush ellipse;
ShapeBrush line;
PImage drawnCanvas;
PImage undoCanvas;
PImage loadCanvas;
ShapeList shapes;
CoordinateDisplay coords;

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

void setup(){
 size(960,540); 
 background(255,255,255);
 imageMode(CENTER);
 //rectMode(CENTER);
 //frameRate(120);
 
 coords = new CoordinateDisplay();
 
 pencil = new Pencil();
 rect = new RectangleBrush();
 ellipse = new EllipseBrush();
 line = new LineBrush();
 int[] rgb = new int[]{255,0,0};
 shapes = new ShapeList();
 transformation = new Transformation();
 
 activeGroup = new ArrayList<Shape>();
 
 cvk = new CommandInvoker();
 strokeColor = new ColorCommand(rgb);
 undo = new UndoCommand();
 clear = new ClearCommand();
 save = new SaveCommand();
 load = new LoadCommand();
 
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
       println(shapes.getShape(i).wd);
     }*/
   }
   if(keyCode == RIGHT){
     //load.execute();
     //rect.paintNumerically(600,500,100,300);
     //transformation.translateShape(0,50,"down");
     //shapes.setActiveShape(shapes.last());
     
     //transformation.rotateShape(shapes.getShapeIndex(shapes.last()),45);
     //transformation.resizeShape(0,100,100);
     //shapes.removeShape(0);
     
     //coords.cleanDisplay();
     //save.execute();
     //shapes.duplicateList(shapes.getList());

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
  
  //background(255);
  //strokeColor.execute();
  //strokeColor.undo();
  
  //cvk.addCommand(strokeColor);
  //cvk.executeCommand();
  //cvk.undoCommand();
  
  //pencil.paint();
  //rect.paintNumerically(600,500,100,300);
  //rect(100,200,100,300);
  //translate(50,50);
  //rotate(PI);
  //rect(100,200,100,300);
  
  //ellipse.paintNumerically(600,500,100,300);
  rect.paint();
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
