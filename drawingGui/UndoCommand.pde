public class UndoCommand implements Command{
 
  public UndoCommand(){
  }
  
  /**
  * Execute and undo (Undo and redo) currently do the exact same thing
  */
  @Override
  public void execute(){
    try{
      undoCanvas = loadImage("undoCanvas.tif");
      saveFrame("undoCanvas.tif");
      background(undoCanvas);
      saveFrame("drawnCanvas.tif");
    }
    catch(Exception e){
      saveFrame("undoCanvas.tif");
      undoCanvas = loadImage("undoCanvas.tif");
      saveFrame("undoCanvas.tif");
      background(undoCanvas);
      saveFrame("drawnCanvas.tif");
    }
  }
  
  @Override
  public void undo(){
    undoCanvas = loadImage("undoCanvas.tif");
    saveFrame("undoCanvas.tif");
    background(undoCanvas);
    saveFrame("drawnCanvas.tif");
  }
}
