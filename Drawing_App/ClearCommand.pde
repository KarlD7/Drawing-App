public class ClearCommand implements Command{
  
  private ArrayList<Shape> temp;
  
  public ClearCommand(){
  }
 
  @Override
  public void execute(){
   saveFrame("undoCanvas");
   background(255);
   temp = shapes.getList();
   shapes.clearList();
   saveFrame("drawnCanvas");
   cleared = true;
  }
  
  @Override
  public void undo(){
   if(cleared){
     undoCanvas = loadImage("undoCanvas.tif");
     saveFrame("undoCanvas");
     background(undoCanvas);
     shapes.setList(temp);
     saveFrame("drawnCanvas");
     cleared = false;
   }
  }
  
}
