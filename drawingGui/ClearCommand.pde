public class ClearCommand implements Command{
  
 public ClearCommand(){
 }
 
 @Override
 public void execute(){
   saveFrame("undoCanvas");
   background(255);
   saveFrame("drawnCanvas");
 }
  
 @Override
 public void undo(){
   undoCanvas = loadImage("undoCanvas.tif");
   saveFrame("undoCanvas");
   background(undoCanvas);
   saveFrame("drawnCanvas");
 }
  
}
