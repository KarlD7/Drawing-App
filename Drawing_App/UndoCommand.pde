public class UndoCommand implements Command{
  
  private Shape temp;
  private boolean undone = false;
 
  public UndoCommand(){
  }
  
  @Override
  public void execute(){
    try{
      if(!undone){
        undoCanvas = loadImage("undoCanvas.tif");
        saveFrame("undoCanvas.tif");
        if(!lastAction.equals("transformation")){
          temp = shapes.getShape(shapes.getSize()-1);
          shapes.removeShape(shapes.getSize()-1);
        }
        background(undoCanvas);
        saveFrame("drawnCanvas.tif");
        undone = true;
      }
    }
    catch(Exception e){
      if(!undone){
        saveFrame("undoCanvas.tif");
        undoCanvas = loadImage("undoCanvas.tif");
        saveFrame("undoCanvas.tif");
        if(!lastAction.equals("transformation")){
          temp = shapes.getShape(shapes.getSize()-1);
          shapes.removeShape(shapes.getSize()-1);
        }
        background(undoCanvas);
        saveFrame("drawnCanvas.tif");
        undone = true;
      }
    }
  }
  
  @Override
  public void undo(){
    if(undone){
      undoCanvas = loadImage("undoCanvas.tif");
      saveFrame("undoCanvas.tif");
      background(undoCanvas);
      if(!lastAction.equals("transformation")){
        shapes.addShape(temp);
      }
      saveFrame("drawnCanvas.tif");
      undone = false;
    }
  }
}
