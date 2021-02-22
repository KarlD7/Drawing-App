/**
* Freehand drawing tool
*/

class Pencil{
  private boolean start = true;

  public Pencil(){
    try{
      drawnCanvas = loadImage("drawnCanvas.tif");
      coords.cleanDisplay();
      background(drawnCanvas);
    }
    catch(Exception e){
      coords.cleanDisplay();
      saveFrame("drawnCanvas");
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
    }
  }
  
  public void paint(){
    if(start){
      if(mousePressed){
        cleared = false;
        coords.cleanDisplay();
        saveFrame("undoCanvas");
        start = false;
      }
    }
    if(mousePressed){
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
      line(mouseX, mouseY, pmouseX, pmouseY);
      coords.cleanDisplay();
      saveFrame("drawnCanvas");
    }
    if(!start && !mousePressed){
      coords.cleanDisplay();
      saveFrame("drawnCanvas");
      start = true;
      lastAction = "draw";
    }
  }
}
