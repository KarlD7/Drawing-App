/**
* Clears the canvas
*/

public class ClearCommand implements Command{
  
  private ArrayList<Shape> temp;
  
  public ClearCommand(){
  }
 
  @Override
  public void execute(){
   coords.cleanDisplay();
   saveFrame("undoCanvas");
   background(255);
   temp = shapes.getList();
   shapes.clearList();
   coords.cleanDisplay();
   saveFrame("drawnCanvas");
   cleared = true;
  }
  
  @Override
  public void undo(){
   if(cleared){
     undoCanvas = loadImage("undoCanvas.tif");
     coords.cleanDisplay();
     saveFrame("undoCanvas");
     background(undoCanvas);
     shapes.setList(temp);
     coords.cleanDisplay();
     saveFrame("drawnCanvas");
     cleared = false;
   }
  }
  
}
