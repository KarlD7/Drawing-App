/**
* Undoes and redoes the most recent command. Only works once for now.
*/

public class UndoCommand implements Command{
  
  private Shape temp;
  private boolean undone = false;
 
  public UndoCommand(){
  }
  
  //Undo
  @Override
  public void execute(){
    try{
        undoCanvas = loadImage("undoCanvas.tif");
        //coords.cleanDisplay();
        saveFrame("undoCanvas.tif");
        temp = shapes.last();
        shapes.removeShape(temp);
        if(lastAction.equals("transformation")){
          shapes.addShape(lastRemoved);
        }
        background(undoCanvas);
        //coords.cleanDisplay();
        saveFrame("drawnCanvas.tif");
        undone = true;
    }
    catch(Exception e){
        //coords.cleanDisplay();
        saveFrame("undoCanvas.tif");
        undoCanvas = loadImage("undoCanvas.tif");
        //coords.cleanDisplay();
        saveFrame("undoCanvas.tif");
        temp = shapes.last();
        shapes.removeShape(temp);
        if(lastAction.equals("transformation")){
          shapes.addShape(lastRemoved);
        }
        background(undoCanvas);
        //coords.cleanDisplay();
        saveFrame("drawnCanvas.tif");
        undone = true;
    }
  }
  
  //Redo
  @Override
  public void undo(){
    if(undone){
      undoCanvas = loadImage("undoCanvas.tif");
      //coords.cleanDisplay();
      saveFrame("undoCanvas.tif");
      background(undoCanvas);
      shapes.addShape(temp);
      if(lastAction.equals("transformation")){
          shapes.removeShape(lastRemoved);
      }
      //coords.cleanDisplay();
      saveFrame("drawnCanvas.tif");
      undone = false;
    }
  }
}
