/**
* Freehand drawing tool
*/

class Pencil{
  private boolean start = true;

  public Pencil(){
    try{
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
    }
    catch(Exception e){
      saveFrame("drawnCanvas");
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
    }
  }
  
  public void paint(){
    if(start){
      if(mousePressed){
        cleared = false;
        saveFrame("undoCanvas");
        start = false;
      }
    }
    if(mousePressed){
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
      line(mouseX, mouseY, pmouseX, pmouseY);
      saveFrame("drawnCanvas");
    }
    if(!start && !mousePressed){
      saveFrame("drawnCanvas");
      start = true;
      lastAction = "draw";
    }
  }
}
