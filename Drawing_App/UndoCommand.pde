/**
* Undoes and redoes the most recent command. Only works once for now.
*/

public class UndoCommand implements Command{
  
  private Shape temp;
  private boolean undone = false;
 
  public UndoCommand(){
  }
  
  @Override
  public void execute(){
    try{
        undoCanvas = loadImage("undoCanvas.tif");
        saveFrame("undoCanvas.tif");
        temp = shapes.last();
        shapes.removeShape(temp);
        if(lastAction.equals("transformation")){
          shapes.addShape(lastRemoved);
        }
        background(undoCanvas);
        saveFrame("drawnCanvas.tif");
        undone = true;
    }
    catch(Exception e){
        saveFrame("undoCanvas.tif");
        undoCanvas = loadImage("undoCanvas.tif");
        saveFrame("undoCanvas.tif");
        temp = shapes.last();
        shapes.removeShape(temp);
        if(lastAction.equals("transformation")){
          shapes.addShape(lastRemoved);
        }
        background(undoCanvas);
        saveFrame("drawnCanvas.tif");
        undone = true;
    }
  }
  
  @Override
  public void undo(){
    if(undone){
      undoCanvas = loadImage("undoCanvas.tif");
      saveFrame("undoCanvas.tif");
      background(undoCanvas);
      shapes.addShape(temp);
      if(lastAction.equals("transformation")){
          shapes.removeShape(lastRemoved);
      }
      saveFrame("drawnCanvas.tif");
      undone = false;
    }
  }
}
